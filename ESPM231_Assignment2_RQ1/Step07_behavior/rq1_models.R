# =============================================================================
# rq1_models.R
# ESPM 231 Assignment 2 (RQ1) - Isabela Tapia-Jaramillo
#
# Analysis pipeline for RQ1, adapted from
# Step_07_Measuring_Behavior_Beyond_Self_Report/code/analyze_behavior_data.R
# (logistic regression for a binary behavioral outcome).
#
#   Model 1 (intention, linear):
#     Y1 = ID + TRUST + RV + RV x TRUST + ID x TRUST + covariates + e
#   Model 2 (behavior, logistic): attended the monitoring day (0/1)
#     logit P(Y2 = 1) = same predictors
#   Link: point-biserial correlation r(Y1, Y2); intention-behavior funnel.
#   Covariates: area, occupation (7), origin, age, gender, education,
#   years in Galapagos, barrier count.
#
# DATA ARE SIMULATED so the code can be checked before fieldwork. Replace the
# simulation block with the real merged file (survey + sign-in sheet), keeping
# the variable names in Step06_survey/survey_matrix.md (Part 3).
#
# Run from the repository root:
#   Rscript ESPM231_Assignment2_RQ1/Step07_behavior/rq1_models.R
# =============================================================================

out_dir <- file.path("ESPM231_Assignment2_RQ1", "Step07_behavior", "output")
dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)
sink(file.path(out_dir, "rq1_models_demo_output.txt"), split = TRUE)
cat("*** SIMULATED DATA - numbers below are illustrative, not results ***\n\n")

# ---- 0. Simulated data (DELETE when real data exist) -------------------------
set.seed(2028)
n <- 425
occ_levels <- c("Farming", "Fishing", "Tourism", "Naturalist guide",
                "Conservation & research", "Education & public services", "Other")
d <- data.frame(
  occupation = factor(sample(occ_levels, n, TRUE), levels = occ_levels),
  area       = sample(c("Puerto Ayora", "Highlands"), n, TRUE, c(.6, .4)),
  origin     = sample(c("Galapagos", "Mainland"), n, TRUE),
  age        = round(runif(n, 18, 75)),
  gender     = sample(c("Woman", "Man", "Other/NR"), n, TRUE, c(.49, .49, .02)),
  education  = sample(1:6, n, TRUE),
  years_gal  = round(runif(n, 1, 60)),
  bar_count  = rpois(n, 1.5)
)
S <- matrix(.3, 3, 3); diag(S) <- 1
X <- MASS::mvrnorm(n, rep(0, 3), S)
d$id_mean    <- pmin(5, pmax(1, 3.8 + 0.7 * X[, 1]))
d$trust_mean <- pmin(5, pmax(1, 3.0 + 0.9 * X[, 2]))
d$rv_mean    <- pmin(5, pmax(1, 4.0 + 0.6 * X[, 3]))
z <- function(x) (x - mean(x)) / sd(x)
lin <- 0.25 * z(d$rv_mean) + 0.2 * z(d$id_mean) + 0.25 * z(d$trust_mean) +
       0.15 * z(d$rv_mean) * z(d$trust_mean) - 0.15 * d$bar_count
d$int_mean   <- pmin(5, pmax(1, 3.3 + 0.6 * lin + rnorm(n, 0, 0.6)))
d$int_monitor <- pmin(5, pmax(1, round(d$int_mean + rnorm(n, 0, 0.6))))
d$signed_up  <- rbinom(n, 1, plogis(-1.2 + 0.9 * (d$int_monitor - 3)))
d$attended_monitor <- ifelse(d$signed_up == 1,
                             rbinom(n, 1, plogis(0.2 + 0.6 * lin)), 0)

# ---- 1. Prepare: center the focal predictors for the interactions -------------
# Centering makes each main effect the effect at AVERAGE trust (Aiken & West, 1991).
d$rv_c    <- d$rv_mean    - mean(d$rv_mean)
d$id_c    <- d$id_mean    - mean(d$id_mean)
d$trust_c <- d$trust_mean - mean(d$trust_mean)
covs <- "area + occupation + origin + age + gender + education + years_gal + bar_count"

# ---- 2. Model 1: intention (linear regression) --------------------------------
f1 <- as.formula(paste("int_mean ~ id_c + trust_c + rv_c + rv_c:trust_c + id_c:trust_c +", covs))
m1 <- lm(f1, data = d)
cat("=== Model 1: intention (Y1), focal terms ===\n")
print(round(coef(summary(m1))[c("id_c", "trust_c", "rv_c", "trust_c:rv_c", "id_c:trust_c"), ], 3))
cat(sprintf("R2 = %.3f\n\n", summary(m1)$r.squared))

# ---- 3. Model 2: behavior (logistic regression) ------------------------------
f2 <- as.formula(paste("attended_monitor ~ id_c + trust_c + rv_c + rv_c:trust_c + id_c:trust_c +", covs))
m2 <- glm(f2, data = d, family = binomial)
cat("=== Model 2: attendance (Y2), focal terms as odds ratios ===\n")
foc <- c("id_c", "trust_c", "rv_c", "trust_c:rv_c", "id_c:trust_c")
print(round(cbind(OR = exp(coef(m2))[foc], exp(confint.default(m2))[foc, ],
                  p = coef(summary(m2))[foc, 4]), 3))
cat("\n")

# ---- 4. Moderation: simple slopes of RV at low / high trust (Model 2) --------
cat("=== Simple slopes: odds ratio for +1 point of RV at low vs high trust ===\n")
for (lv in c(-1, 1)) {
  tval <- lv * sd(d$trust_c)
  b <- coef(m2)["rv_c"] + coef(m2)["trust_c:rv_c"] * tval
  cat(sprintf("  trust = mean %+d SD: OR(RV) = %.2f\n", lv, exp(b)))
}
cat("\n")

# ---- 5. Intention-behavior link ---------------------------------------------
cat("=== Intention-behavior link ===\n")
cat(sprintf("Point-biserial r(INT mean, attended) = %.2f\n", cor(d$int_mean, d$attended_monitor)))
cat(sprintf("Point-biserial r(INT2 monitoring item, attended) = %.2f\n",
            cor(d$int_monitor, d$attended_monitor)))
hi <- d$int_monitor >= 4
cat(sprintf("Funnel: intend (INT2 4-5) %.0f%% -> signed up %.0f%% -> attended %.0f%%\n",
            100 * mean(hi), 100 * mean(d$signed_up), 100 * mean(d$attended_monitor)))
cat(sprintf("Among high intenders: %.0f%% did not attend (intention-behavior gap)\n\n",
            100 * mean(d$attended_monitor[hi] == 0)))

# ---- 6. Group differences (covariates) ----------------------------------------
cat("=== Attendance by occupation (descriptive) ===\n")
print(round(tapply(d$attended_monitor, d$occupation, mean), 2))
sink()

# ---- 7. Figures ----------------------------------------------------------------
png(file.path(out_dir, "moderation_plot_demo.png"), width = 1400, height = 900, res = 200)
rv_seq <- seq(min(d$rv_c), max(d$rv_c), length.out = 50)
nd <- d[rep(1, 50), ]; nd$rv_c <- rv_seq; nd$id_c <- 0
plot(NA, xlim = range(rv_seq + mean(d$rv_mean)), ylim = c(0, 1),
     xlab = "Relational values (1-5)", ylab = "Predicted probability of attending",
     main = "SIMULATED: does trust moderate the RV -> participation link?")
cols <- c("#d95f02", "#1b9e77")
for (i in 1:2) {
  nd$trust_c <- c(-1, 1)[i] * sd(d$trust_c)
  lines(rv_seq + mean(d$rv_mean), predict(m2, nd, type = "response"), col = cols[i], lwd = 3)
}
legend("topleft", c("Low trust (-1 SD)", "High trust (+1 SD)"), col = cols, lwd = 3, bty = "n")
invisible(dev.off())
cat("Output saved to", out_dir, "\n")
