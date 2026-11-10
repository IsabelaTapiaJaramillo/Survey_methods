# =============================================================================
# power_analysis.R
# Step 09 — A priori power analysis
# Study: Festival de las Tortugas Gigantes — randomized-encouragement BACI,
#        Santa Cruz Island, Galápagos (ESPM 231, Assignment 2)
# Author: Isabela Tapia-Jaramillo
#
# Replaces the Python placeholder (power_example.py) with R, using `pwr`.
# Run from the repository root:
#   Rscript Step_09_Power_Analysis_Sampling_and_Pilots/scripts/power_analysis.R
# Outputs (written to Step_09_Power_Analysis_Sampling_and_Pilots/output/):
#   power_results.txt, power_curve_RQ1.png, power_curve_H2a.png,
#   power_curve_H2b.png
# =============================================================================

suppressPackageStartupMessages({
  library(pwr)      # Champely (2020)
  library(ggplot2)
})

out_dir <- file.path("Step_09_Power_Analysis_Sampling_and_Pilots", "output")
dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)
sink(file.path(out_dir, "power_results.txt"), split = TRUE)

# -----------------------------------------------------------------------------
# 0. Shared assumptions
# -----------------------------------------------------------------------------
alpha     <- 0.05
power_tgt <- 0.80
attrition <- 0.30  # Alderman et al. (2001): 3–23% loss/yr in developing-country
                   # panels; Guardians of the Giant Tortoises (2024): 15/18 (83%)
                   # retained over 6 months; here the gap is only 6–10 weeks.
r_prepost <- 0.50  # Walters et al. (2019), Trials 20:566: mean baseline–
                   # follow-up correlation 0.50 across 20 trials.
d_avg     <- 0.31  # Bergquist et al. (2023): average effect of
d_corr    <- 0.18  #   behavior-change interventions; 0.18 after correction
                   #   for publication bias.

cat("=== Assumptions ===\n")
cat(sprintf("alpha = %.2f | power = %.2f | attrition = %.0f%% | r(pre,post) = %.2f\n",
            alpha, power_tgt, 100 * attrition, r_prepost))
cat(sprintf("Effect sizes (Bergquist et al., 2023): d = %.2f (average), d = %.2f (bias-corrected)\n\n",
            d_avg, d_corr))

# -----------------------------------------------------------------------------
# 1. RQ1 (H1a–H1c) — multiple regression, ONE tested term (e.g., RV x trust)
#    16 predictors in the full model:
#      relational values, trust, identification, in-group norms (4)
#      RV x trust, identification x norms (2)
#      area (1), origin (1), occupation (4 dummies)
#      age, gender, education, years in Galápagos (4)
#    f2 = .02 (Cohen's "small"; conservative for an interaction term)
# -----------------------------------------------------------------------------
k_pred <- 16
u_rq1  <- 1
f2_rq1 <- 0.02
rq1    <- pwr.f2.test(u = u_rq1, f2 = f2_rq1, sig.level = alpha, power = power_tgt)
N_rq1  <- ceiling(rq1$v) + k_pred + 1      # N = v + k + 1

cat("=== RQ1: multiple regression (pwr.f2.test) ===\n")
cat(sprintf("u = %d tested term, f2 = %.2f, %d predictors in model\n", u_rq1, f2_rq1, k_pred))
cat(sprintf("Required denominator df v = %.1f  ->  N = ceiling(v) + k + 1 = %d\n", rq1$v, N_rq1))
cat("RQ1 uses baseline (first-survey) data, so N applies at baseline.\n\n")

# -----------------------------------------------------------------------------
# 2. H2a — invitation raises festival attendance: 25% (not invited) vs 40%
#    (invited). Two-proportion test (pwr.2p.test), Cohen's h.
# -----------------------------------------------------------------------------
p_ctrl <- 0.25
p_trt  <- 0.40
h_h2a  <- ES.h(p_trt, p_ctrl)
h2a    <- pwr.2p.test(h = h_h2a, sig.level = alpha, power = power_tgt)
n_h2a_follow   <- ceiling(h2a$n)
n_h2a_baseline <- ceiling(h2a$n / (1 - attrition))

cat("=== H2a: attendance, invited vs not invited (pwr.2p.test) ===\n")
cat(sprintf("p = %.2f vs %.2f -> Cohen's h = %.3f\n", p_trt, p_ctrl, h_h2a))
cat(sprintf("n per group at follow-up = %.1f -> %d\n", h2a$n, n_h2a_follow))
cat(sprintf("n per group at baseline (/ (1 - %.2f)) = %.1f -> %d  (total %d)\n\n",
            attrition, h2a$n / (1 - attrition), n_h2a_baseline, 2 * n_h2a_baseline))

# -----------------------------------------------------------------------------
# 3. H2b — change in intentions / norms / efficacy, ANCOVA on follow-up
#    controlling for baseline. Two-sample t-test n, deflated by (1 - r^2)
#    (Borm et al., 2007).
# -----------------------------------------------------------------------------
ancova_n <- function(d, r = r_prepost) {
  n_t <- pwr.t.test(d = d, sig.level = alpha, power = power_tgt,
                    type = "two.sample")$n
  c(n_ttest = n_t, n_ancova = n_t * (1 - r^2))
}
ancova_power <- function(n_per_group, d, r = r_prepost) {
  # ANCOVA with n per group has the power of a t-test with n / (1 - r^2)
  pwr.t.test(n = n_per_group / (1 - r^2), d = d, sig.level = alpha,
             type = "two.sample")$power
}

h2b_avg  <- ancova_n(d_avg)
h2b_corr <- ancova_n(d_corr)
n_h2b    <- ceiling(h2b_avg["n_ancova"])

cat("=== H2b: ANCOVA (pwr.t.test with n x (1 - r^2)) ===\n")
cat(sprintf("d = %.2f: t-test n = %.1f -> ANCOVA n = %.1f -> %d per group\n",
            d_avg, h2b_avg[1], h2b_avg[2], ceiling(h2b_avg[2])))
cat(sprintf("d = %.2f: t-test n = %.1f -> ANCOVA n = %.1f -> %d per group\n",
            d_corr, h2b_corr[1], h2b_corr[2], ceiling(h2b_corr[2])))
cat(sprintf("\nSensitivity — power with %d per group:\n", n_h2b))
for (d in c(0.18, 0.25, 0.31)) {
  cat(sprintf("  d = %.2f : power = %.2f\n", d, ancova_power(n_h2b, d)))
}

# -----------------------------------------------------------------------------
# 4. Planned sample and which test drives it
# -----------------------------------------------------------------------------
N_base_planned   <- 440                     # 220 per arm
n_arm_planned    <- N_base_planned / 2
n_arm_follow_exp <- n_arm_planned * (1 - attrition)

cat("\n=== Planned sample ===\n")
cat(sprintf("Planned baseline N = %d (%d per arm); expected follow-up = %d (%.0f per arm)\n",
            N_base_planned, n_arm_planned, round(N_base_planned * (1 - attrition)),
            n_arm_follow_exp))
cat("Plus ~100 new post-festival residents (testing-effect check; not powered).\n\n")

driver <- data.frame(
  Test = c("RQ1 regression (1 term, 16 predictors)",
           "H2a attendance 25% vs 40%",
           "H2b ANCOVA, d = 0.31",
           "H2b ANCOVA, d = 0.18"),
  Needed = c(sprintf("N = %d at baseline", N_rq1),
             sprintf("%d/group follow-up = %d/group baseline (%d total)",
                     n_h2a_follow, n_h2a_baseline, 2 * n_h2a_baseline),
             sprintf("%d/group follow-up = %d/group baseline",
                     ceiling(h2b_avg[2]), ceiling(ceiling(h2b_avg[2]) / (1 - attrition))),
             sprintf("%d/group follow-up = %d/group baseline",
                     ceiling(h2b_corr[2]), ceiling(ceiling(h2b_corr[2]) / (1 - attrition)))),
  Power_at_planned = c(
    pwr.f2.test(u = u_rq1, v = N_base_planned - k_pred - 1, f2 = f2_rq1)$power,
    pwr.2p.test(h = h_h2a, n = n_arm_follow_exp)$power,
    ancova_power(n_arm_follow_exp, d_avg),
    ancova_power(n_arm_follow_exp, d_corr))
)
driver$Power_at_planned <- round(driver$Power_at_planned, 2)
options(width = 200)
cat("=== Which test drives the sample size? ===\n")
print(driver, row.names = FALSE, right = FALSE)
cat(sprintf(paste0(
  "\nH2a is the binding constraint: %.1f (-> 152) per group at follow-up / 0.70 = %d per group\n",
  "= %d minimum at baseline, rounded up to %d (220 per arm) as a small buffer.\n",
  "That N also covers RQ1 (needs %d) and H2b at d = 0.31 (needs %d per group at follow-up).\n",
  "H2b at the bias-corrected d = 0.18 is NOT powered at .80; report it as a sensitivity result.\n"),
  h2a$n, n_h2a_baseline, 2 * n_h2a_baseline, N_base_planned, N_rq1, ceiling(h2b_avg[2])))

# -----------------------------------------------------------------------------
# 4b. Caveat: intention-to-treat (ITT) and IV estimates for H2b
#     The H2b power above is for the attendee vs non-attendee ANCOVA. Under
#     randomized encouragement, the ITT effect of the INVITATION on outcomes is
#     diluted by the compliance gap (40% - 25% = 15 points): ITT d = 0.15 x d.
#     The IV (complier) estimate recovers d but its SE is inflated ~1/0.15.
#     These estimates are reported but are not expected to be powered.
# -----------------------------------------------------------------------------
compliance_gap <- p_trt - p_ctrl
cat(sprintf("\n=== Caveat: ITT on H2b outcomes (compliance gap = %.2f) ===\n", compliance_gap))
for (d in c(d_avg, d_corr)) {
  d_itt <- compliance_gap * d
  cat(sprintf("  attendance effect d = %.2f -> ITT d = %.3f -> power with %.0f/arm = %.2f\n",
              d, d_itt, n_arm_follow_exp, ancova_power(n_arm_follow_exp, d_itt)))
}
cat("  => ITT/IV estimates for H2b are supplementary; the attendee ANCOVA is the powered (but\n",
    "    self-selected) comparison. Interpret it alongside the ITT/IV results.\n")

# -----------------------------------------------------------------------------
# 5. Power curves (power vs sample size)
# -----------------------------------------------------------------------------
theme_set(theme_minimal(base_size = 12))
ref_line <- geom_hline(yintercept = power_tgt, linetype = "dashed", colour = "grey40")

# RQ1: power vs total N for three f2 values
Ns <- seq(100, 900, by = 10)
rq1_curve <- expand.grid(N = Ns, f2 = c(0.01, 0.02, 0.035))
rq1_curve$power <- mapply(function(N, f2)
  pwr.f2.test(u = u_rq1, v = N - k_pred - 1, f2 = f2, sig.level = alpha)$power,
  rq1_curve$N, rq1_curve$f2)
p1 <- ggplot(rq1_curve, aes(N, power, colour = factor(f2))) +
  geom_line(linewidth = 1) + ref_line +
  geom_vline(xintercept = N_rq1, linetype = "dotted") +
  geom_vline(xintercept = N_base_planned, colour = "firebrick") +
  annotate("text", x = N_rq1, y = 0.02, hjust = 0, label = paste0("required N = ", N_rq1),
           angle = 90, vjust = -0.5, size = 3.5) +
  annotate("text", x = N_base_planned, y = 0.02, hjust = 0, label = "planned N = 440",
           angle = 90, vjust = 1.5, size = 3.5, colour = "firebrick") +
  labs(title = "RQ1: one tested term in a 16-predictor regression",
       x = "Total N (baseline)", y = "Power", colour = expression(f^2))
ggsave(file.path(out_dir, "power_curve_RQ1.png"), p1, width = 7, height = 4.5, dpi = 200)

# H2a: power vs n per group at follow-up for three invited-arm attendance rates
ns <- seq(20, 400, by = 5)
h2a_curve <- expand.grid(n = ns, p_trt = c(0.35, 0.40, 0.45))
h2a_curve$power <- mapply(function(n, p)
  pwr.2p.test(h = ES.h(p, p_ctrl), n = n, sig.level = alpha)$power,
  h2a_curve$n, h2a_curve$p_trt)
p2 <- ggplot(h2a_curve, aes(n, power, colour = paste0("25% vs ", 100 * p_trt, "%"))) +
  geom_line(linewidth = 1) + ref_line +
  geom_vline(xintercept = n_h2a_follow, linetype = "dotted") +
  geom_vline(xintercept = n_arm_follow_exp, colour = "firebrick") +
  annotate("text", x = n_h2a_follow, y = 0.02, hjust = 0, label = paste0("required n = ", n_h2a_follow),
           angle = 90, vjust = -0.5, size = 3.5) +
  annotate("text", x = n_arm_follow_exp, y = 0.02, hjust = 0, label = "expected n = 154",
           angle = 90, vjust = 1.5, size = 3.5, colour = "firebrick") +
  labs(title = "H2a: festival attendance, invited vs not invited",
       x = "n per group at follow-up", y = "Power", colour = "Attendance")
ggsave(file.path(out_dir, "power_curve_H2a.png"), p2, width = 7, height = 4.5, dpi = 200)

# H2b: power vs n per group (ANCOVA) for d = .18 / .25 / .31
h2b_curve <- expand.grid(n = ns, d = c(0.18, 0.25, 0.31))
h2b_curve$power <- mapply(ancova_power, h2b_curve$n, h2b_curve$d)
p3 <- ggplot(h2b_curve, aes(n, power, colour = factor(d))) +
  geom_line(linewidth = 1) + ref_line +
  geom_vline(xintercept = n_h2b, linetype = "dotted") +
  geom_vline(xintercept = n_arm_follow_exp, colour = "firebrick") +
  annotate("text", x = n_h2b, y = 0.02, hjust = 0, label = paste0("required n = ", n_h2b, " (d = .31)"),
           angle = 90, vjust = -0.5, size = 3.5) +
  annotate("text", x = n_arm_follow_exp, y = 0.02, hjust = 0, label = "expected n = 154",
           angle = 90, vjust = 1.5, size = 3.5, colour = "firebrick") +
  labs(title = "H2b: ANCOVA on follow-up, controlling for baseline (r = .50)",
       x = "n per group at follow-up", y = "Power", colour = "Cohen's d")
ggsave(file.path(out_dir, "power_curve_H2b.png"), p3, width = 7, height = 4.5, dpi = 200)

cat("\nPower curves saved to", out_dir, "\n")
sink()
