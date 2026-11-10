# =============================================================================
# randomization.R
# Step 04 — Stratified, blocked 1:1 random assignment of the festival invitation
# Study: Festival de las Tortugas Gigantes (Santa Cruz, Galápagos)
# Author: Isabela Tapia-Jaramillo
#
# What it does
#   1. Builds an assignment sequence for every enumerator x stratum cell, where
#      stratum = area (Puerto Ayora / highlands) x occupation (5 levels).
#   2. Within each cell, uses permuted blocks of random size (2 or 4) so that
#      invited : not invited stays close to 1:1 however many people are enrolled.
#   3. Writes a CSV that KoboToolbox reads with pulldata(): the enumerator picks
#      the stratum, the form takes the next unused participant ID for that
#      enumerator x stratum, and the assignment is revealed only on the LAST
#      screen, after all first-survey questions have been answered.
#   4. Provides balance_table() for the post-enrollment balance check.
#
# Run from the repository root:
#   Rscript Step_04_Study_Architecture_and_Experimental_Design/code/randomization.R
#
# NOTE ON THE SEED: the seed below is for this proposal and lets anyone
# reproduce the example sequence. For fieldwork, the final seed is generated
# on the day the sequence is locked, recorded in the (embargoed) OSF
# pre-registration, and kept out of this public repo until enrollment closes,
# so enumerators cannot predict upcoming assignments.
# =============================================================================

SEED <- 20280415          # proposal seed (replace when locking for fieldwork)
set.seed(SEED)

areas       <- c(PA = "Puerto Ayora", HL = "Highlands (Bellavista + Santa Rosa)")
occupations <- c(FAR = "Farming", FIS = "Fishing", TOU = "Tourism",
                 PUB = "Public sector", OTH = "Other")
enumerators <- c("E1", "E2", "E3")
slots_per_cell <- 80       # > largest expected cell (e.g., Puerto Ayora tourism ~44 per enumerator); unused slots discarded

permuted_blocks <- function(n_slots, block_sizes = c(2, 4)) {
  out <- character(0)
  while (length(out) < n_slots) {
    b <- sample(block_sizes, 1)
    out <- c(out, sample(rep(c("Invited", "Not invited"), each = b / 2)))
  }
  out[seq_len(n_slots)]
}

cells <- expand.grid(enumerator = enumerators, area = names(areas),
                     occupation = names(occupations), stringsAsFactors = FALSE)

sequence <- do.call(rbind, lapply(seq_len(nrow(cells)), function(i) {
  cl <- cells[i, ]
  data.frame(
    participant_id = sprintf("%s-%s-%s-%03d", cl$area, cl$occupation, cl$enumerator,
                             seq_len(slots_per_cell)),
    enumerator = cl$enumerator,
    area       = cl$area,
    occupation = cl$occupation,
    slot       = seq_len(slots_per_cell),
    condition  = permuted_blocks(slots_per_cell),
    stringsAsFactors = FALSE
  )
}))

out_dir <- file.path("Step_04_Study_Architecture_and_Experimental_Design", "code", "output")
dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)
write.csv(sequence, file.path(out_dir, "assignment_sequence_example.csv"), row.names = FALSE)

cat("Seed:", SEED, "| cells:", nrow(cells), "| slots:", nrow(sequence), "\n")
cat("Overall allocation:\n"); print(table(sequence$condition))

# Worst-case imbalance within any cell for the first k enrollees
max_imbalance <- function(k) {
  max(tapply(sequence$condition, paste(sequence$enumerator, sequence$area, sequence$occupation),
             function(x) abs(sum(x[1:k] == "Invited") - sum(x[1:k] == "Not invited"))))
}
cat("Max within-cell imbalance after 5 / 10 / 15 enrollees:",
    max_imbalance(5), "/", max_imbalance(10), "/", max_imbalance(15), "\n")

# -----------------------------------------------------------------------------
# Balance check (run after enrollment closes, on the real first-survey data)
#   dat: data frame with `condition` and baseline covariates
# -----------------------------------------------------------------------------
balance_table <- function(dat, covariates) {
  do.call(rbind, lapply(covariates, function(v) {
    x <- dat[[v]]
    if (is.numeric(x)) {
      m <- tapply(x, dat$condition, mean, na.rm = TRUE)
      s <- tapply(x, dat$condition, sd,   na.rm = TRUE)
      p <- t.test(x ~ dat$condition)$p.value
      data.frame(covariate = v,
                 not_invited = sprintf("%.2f (%.2f)", m["Not invited"], s["Not invited"]),
                 invited     = sprintf("%.2f (%.2f)", m["Invited"], s["Invited"]),
                 p = round(p, 3))
    } else {
      tab <- table(x, dat$condition)
      p <- suppressWarnings(chisq.test(tab)$p.value)
      data.frame(covariate = v, not_invited = "see table", invited = "see table",
                 p = round(p, 3))
    }
  }))
}

# Demonstration with simulated data (delete once real data exist)
demo <- sequence[sequence$slot <= 15, ]            # ~450 enrollees
demo$age <- round(rnorm(nrow(demo), 40, 13))
demo$gender <- sample(c("Woman", "Man", "Other/NR"), nrow(demo), TRUE, c(.49, .49, .02))
demo$int_baseline <- round(pmin(5, pmax(1, rnorm(nrow(demo), 3.4, 0.9))), 2)
cat("\nDemo balance table (simulated data):\n")
print(balance_table(demo, c("age", "gender", "int_baseline")), row.names = FALSE)
