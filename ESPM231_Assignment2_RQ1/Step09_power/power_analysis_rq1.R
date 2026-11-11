# =============================================================================
# power_analysis_rq1.R
# ESPM 231 Assignment 2 (RQ1 only) - Isabela Tapia-Jaramillo
#
# Adapted from Step 09 example (e), power_example_e_sample_size_calculator_traits.R
# (Part A: multiple regression, one rating per person). Added: a simulation for
# the BEHAVIOR model (logistic regression), because attendance is yes/no.
#
# Study: one face-to-face survey of adult residents of Santa Cruz, Galapagos,
# followed by a real invitation to a community tortoise-monitoring day.
#
#   Model 1 (intention, linear):
#     Y1 = identity + trust + RV + RV x trust + identity x trust + covariates + e
#   Model 2 (behavior, logistic; attended the monitoring day yes/no):
#     logit P(Y2 = 1) = same predictors
#   Covariates (13 terms): area (1), origin (1), occupation (7 categories ->
#     6 dummies), age, gender, education, years in Galapagos (4),
#     practical-barrier count (1).
#   Total predictors k = 5 focal + 13 covariates = 18.
#
#   Focal tests: the trust interactions (RV x trust, identity x trust) and the
#   main effects of RV, identity and trust.
#
# Run from the repository root:
#   Rscript ESPM231_Assignment2_RQ1/Step09_power/power_analysis_rq1.R
# Output: ESPM231_Assignment2_RQ1/Step09_power/output/
# =============================================================================

for (pkg in c("pwr", "MASS")) {
  if (!requireNamespace(pkg, quietly = TRUE))
    install.packages(pkg, repos = "https://cloud.r-project.org")
}
library(pwr)

out_dir <- file.path("ESPM231_Assignment2_RQ1", "Step09_power", "output")
dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)
sink(file.path(out_dir, "power_results.txt"), split = TRUE)

cat("R version:", R.version.string, "| pwr", as.character(packageVersion("pwr")),
    "| MASS", as.character(packageVersion("MASS")), "\n\n")

# ---- 1. Assumptions (every number has a source or a stated reason) -----------
alpha  <- 0.05   # convention, two-sided
power  <- 0.80   # convention
k      <- 18     # predictors in each model (see header)

# Smallest effect size of interest (SESOI): Cohen's (1988) "small" effect.
#   Intention model: f2 = .02 for ONE tested term (e.g., RV x trust).
#   Behavior model : d = 0.20 converted to an odds ratio per SD of the
#                    predictor with Chinn (2000): ln(OR) = d * pi / sqrt(3)
#                    -> OR = 1.44.
# Why a SESOI and not a published estimate: no study has estimated these
# associations (relational values, identification, trust in a park authority)
# for Galapagos residents, and pilot estimates are too noisy (Step 09 README).
# Sensitivity values: d = 0.18 and d = 0.31, the bias-corrected and average
# effects of field behavior-change interventions (Bergquist et al., 2023).
f2_sesoi <- 0.02
d_to_or  <- function(d) exp(d * pi / sqrt(3))        # Chinn (2000)
d_sesoi  <- 0.20
or_grid  <- c(d_018 = d_to_or(0.18), d_020 = d_to_or(0.20), d_031 = d_to_or(0.31))

attend_rate <- 0.30  # expected share of invited residents who attend the
                     # monitoring day (author's estimate from the Guardians of
                     # the Giant Tortoises program; free transport, food and
                     # family activities, but work and family barriers remain)
r_predictors <- 0.30 # assumed correlation among identity, trust and RV
                     # (assumption; to be checked in the pilot)
nonresponse  <- 0.05 # incomplete surveys / failed attention checks
                     # (assumption for face-to-face tablet surveys; to be
                     # updated from the pilot)
n_sims <- 1000       # simulations per setting (Ale's example e: use 1000
                     # for final numbers)
set.seed(2026)

cat("=== Assumptions ===\n")
cat(sprintf("alpha = %.2f (two-sided) | power = %.2f | k = %d predictors\n", alpha, power, k))
cat(sprintf("SESOI: f2 = %.2f (intention); d = %.2f -> OR = %.2f per SD (behavior)\n",
            f2_sesoi, d_sesoi, d_to_or(d_sesoi)))
cat(sprintf("Attendance = %.0f%% | r among focal predictors = %.2f | non-response = %.0f%%\n\n",
            100 * attend_rate, r_predictors, 100 * nonresponse))

# ---- 2. Model 1: intention (linear regression) - example (e) Part A ---------
resA <- pwr.f2.test(u = 1, f2 = f2_sesoi, sig.level = alpha, power = power)
N_intention <- ceiling(resA$v) + k + 1               # N = v + k + 1
cat("=== Model 1: intention (pwr.f2.test, one tested term) ===\n")
cat(sprintf("f2 = %.2f, u = 1, k = %d -> v = %.1f -> N = %d\n", f2_sesoi, k, resA$v, N_intention))
sensA <- data.frame(f2 = c(0.01, 0.02, 0.035, 0.05))
sensA$N <- sapply(sensA$f2, function(f2)
  ceiling(pwr.f2.test(u = 1, f2 = f2, sig.level = alpha, power = power)$v) + k + 1)
cat("Sensitivity (f2 for one term -> N):\n"); print(sensA, row.names = FALSE)
cat("\n")

# ---- 3. Model 2: behavior (logistic regression) - simulation -----------------
sim_once <- function(N, or) {
  S <- matrix(r_predictors, 3, 3); diag(S) <- 1
  X <- MASS::mvrnorm(N, rep(0, 3), S)
  id <- X[, 1]; tr <- X[, 2]; rv <- X[, 3]
  occ  <- factor(sample(1:7, N, TRUE)); area <- rbinom(N, 1, .5); orig <- rbinom(N, 1, .5)
  age  <- rnorm(N); gen <- rbinom(N, 1, .5); edu <- rnorm(N); yrs <- rnorm(N)
  bar  <- rpois(N, 1.5)   # barrier count (0-6)
  eta  <- qlogis(attend_rate) + log(or) * (id + tr + rv) + log(or) * (rv * tr + id * tr)
  y    <- rbinom(N, 1, plogis(eta))
  p <- coef(summary(glm(y ~ id + tr + rv + rv:tr + id:tr + occ + area + orig +
                          age + gen + edu + yrs + bar, family = binomial)))[, 4]
  c(trust = p[["tr"]] < alpha, rv_x_trust = p[["tr:rv"]] < alpha,
    id_x_trust = p[["id:tr"]] < alpha)
}
N_grid <- seq(300, 600, by = 25)
cat(sprintf("=== Model 2: behavior (logistic; %d simulations per cell) ===\n", n_sims))
simB <- do.call(rbind, lapply(names(or_grid), function(nm) {
  do.call(rbind, lapply(N_grid, function(N) {
    pw <- rowMeans(replicate(n_sims, sim_once(N, or_grid[[nm]])))
    data.frame(effect = nm, OR = round(or_grid[[nm]], 2), N = N,
               trust = pw[["trust"]], rv_x_trust = pw[["rv_x_trust"]],
               id_x_trust = pw[["id_x_trust"]])
  }))
}))
simB$min_power <- pmin(simB$trust, simB$rv_x_trust, simB$id_x_trust)
print(transform(simB, trust = round(trust, 2), rv_x_trust = round(rv_x_trust, 2),
                id_x_trust = round(id_x_trust, 2), min_power = round(min_power, 2)),
      row.names = FALSE)
N_behavior <- min(simB$N[simB$effect == "d_020" & simB$min_power >= power])
cat(sprintf("\nSmallest N in the grid with power >= %.2f for ALL three focal tests at the SESOI (OR = %.2f): %d\n\n",
            power, d_to_or(d_sesoi), N_behavior))

# ---- 4. Intention-behavior correlation (descriptive; sensitivity) ------------
cat("=== Y1-Y2 correlation (point-biserial) ===\n")
r_detect <- function(N) pwr.r.test(n = N, sig.level = alpha, power = power)$r

# ---- 5. Decision --------------------------------------------------------------
N_analysable <- max(N_intention, N_behavior)
N_recruit    <- ceiling(N_analysable / (1 - nonresponse) / 5) * 5
cat(sprintf("Smallest correlation detectable with N = %d: r = %.2f\n\n", N_analysable, r_detect(N_analysable)))
cat("=== Sample size decision ===\n")
cat(sprintf("Intention model needs %d; behavior model needs %d -> analysable N = %d\n",
            N_intention, N_behavior, N_analysable))
cat(sprintf("Recruit N = %d / (1 - %.2f) = %d (rounded up to a multiple of 5)\n",
            N_analysable, nonresponse, N_recruit))
cat(sprintf("Field effort: 3 enumerators x ~8 surveys/day -> ~%d field days\n",
            ceiling(N_recruit / 24)))
pw_at <- function(nm) simB$min_power[simB$effect == nm & simB$N == N_analysable]
cat(sprintf("Behavior model, lowest focal power at N = %d: d = .18 -> %.2f | d = .20 -> %.2f | d = .31 -> %.2f\n",
            N_analysable, pw_at("d_018"), pw_at("d_020"), pw_at("d_031")))

# ---- 6. Power curves ----------------------------------------------------------
png(file.path(out_dir, "power_curve_intention.png"), width = 1400, height = 900, res = 200)
Ns <- seq(100, 900, by = 10)
plot(NA, xlim = range(Ns), ylim = c(0, 1), xlab = "Analysable N", ylab = "Power",
     main = "Model 1 (intention): one tested term, 18 predictors")
cols <- c("#1b9e77", "#d95f02", "#7570b3")
for (i in 1:3) {
  f2 <- c(0.01, 0.02, 0.035)[i]
  lines(Ns, sapply(Ns, function(N) pwr.f2.test(u = 1, v = N - k - 1, f2 = f2)$power),
        col = cols[i], lwd = 2)
}
abline(h = power, lty = 2); abline(v = N_analysable, col = "firebrick")
legend("bottomright", legend = c("f2 = .01", "f2 = .02 (SESOI)", "f2 = .035"),
       col = cols, lwd = 2, bty = "n")
invisible(dev.off())

png(file.path(out_dir, "power_curve_behavior.png"), width = 1400, height = 900, res = 200)
plot(NA, xlim = range(N_grid), ylim = c(0, 1), xlab = "Analysable N",
     ylab = "Power (lowest of the three focal tests)",
     main = sprintf("Model 2 (attendance, %.0f%% attend): logistic regression", 100 * attend_rate))
labs <- c(d_018 = "d = .18 (OR 1.39)", d_020 = "d = .20 (OR 1.44, SESOI)", d_031 = "d = .31 (OR 1.75)")
for (i in seq_along(or_grid)) {
  s <- simB[simB$effect == names(or_grid)[i], ]
  lines(s$N, s$min_power, col = cols[i], lwd = 2, type = "b", pch = 16)
}
abline(h = power, lty = 2); abline(v = N_analysable, col = "firebrick")
legend("bottomright", legend = labs, col = cols, lwd = 2, bty = "n")
invisible(dev.off())
cat("\nPower curves saved to", out_dir, "\n")
sink()

# References
# Bergquist M, Thiel M, Goldberg MH, van der Linden S (2023) PNAS 120:e2214851120. doi:10.1073/pnas.2214851120
# Chinn S (2000) Stat Med 19:3127-3131. doi:10.1002/1097-0258(20001130)19:22<3127::AID-SIM784>3.0.CO;2-M
# Cohen J (1988) Statistical Power Analysis for the Behavioral Sciences, 2nd ed.
# Echeverri Lab (2026) Survey_methods, Step 09 example (e).
