# =============================================================================
# randomize_form_versions.R
# ESPM 231 Assignment 2 (RQ1) - Isabela Tapia-Jaramillo
#
# There are no treatment groups in this study (cross-sectional design). What IS
# randomized is the ORDER of the two photos in the image-association task:
#   "T" = giant tortoise photo first, then the park-ranger photo
#   "R" = park-ranger photo first, then the giant tortoise photo
# -> 2 form versions, each a separate KoboToolbox form. Everything else
#    (block order and item order) is the same for every respondent.
#
# This script makes the version sequence each enumerator follows: permuted
# blocks of 4 (two T and two R in random order), so the two versions stay
# balanced within each enumerator throughout fieldwork.
#
# Run from the repository root:
#   Rscript ESPM231_Assignment2_RQ1/Step04_design/randomize_form_versions.R
# =============================================================================

SEED <- 20280415   # proposal seed; record the final seed in the OSF pre-registration
set.seed(SEED)

enumerators <- c("E1", "E2", "E3")
n_recruit   <- 450                            # from Step09 power analysis
per_enum    <- ceiling(n_recruit / length(enumerators) / 4) * 4 + 8   # spare slots

seq_for <- function(e) {
  v <- unlist(replicate(per_enum / 4, sample(c("T", "T", "R", "R")), simplify = FALSE))
  data.frame(enumerator = e, slot = seq_along(v),
             participant_id = sprintf("%s-%03d", e, seq_along(v)),
             form_version = v,
             photo_first = ifelse(v == "T", "tortoise", "ranger"))
}
sequence <- do.call(rbind, lapply(enumerators, seq_for))

out <- file.path("ESPM231_Assignment2_RQ1", "Step04_design", "form_version_sequence.csv")
write.csv(sequence, out, row.names = FALSE)

cat("Seed:", SEED, "| slots:", nrow(sequence), "\n")
print(table(sequence$enumerator, sequence$photo_first))
cat("Max imbalance between versions within any enumerator after any number of",
    "interviews: 2 (permuted blocks of 4)\n")
