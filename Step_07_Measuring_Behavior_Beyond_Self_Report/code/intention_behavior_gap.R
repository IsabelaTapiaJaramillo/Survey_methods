# =============================================================================
# intention_behavior_gap.R
# Step 07 — Monitoring-day sign-up and attendance vs. stated intentions
# Study: Festival de las Tortugas Gigantes (Santa Cruz, Galápagos)
# Author: Isabela Tapia-Jaramillo
#
# Adapted from analyze_behavior_data.R (logistic regression for a binary
# behavioral outcome; group plots). Extended to:
#   (1) H2c — attendees vs non-attendees: sign-up and attendance (logistic)
#   (2) ITT — effect of the random INVITATION on sign-up and attendance
#   (3) Intention–behavior gap — INT2 (stated willingness) vs sign-up vs
#       attendance, the "funnel" from intending to doing (cf. B-02 vs B-01)
#   (4) Barriers reported in the follow-up call by sign-ups who did not attend
#
# DATA ARE SIMULATED so the pipeline can be run and checked before fieldwork.
# Replace the simulation block with the real merged file (T1 survey +
# sign-in sheet + follow-up call), keeping the same variable names.
#
# Run from the repository root:
#   Rscript Step_07_Measuring_Behavior_Beyond_Self_Report/code/intention_behavior_gap.R
# =============================================================================

suppressPackageStartupMessages({
  library(dplyr)
  library(ggplot2)
})

out_dir <- file.path("Step_07_Measuring_Behavior_Beyond_Self_Report", "code", "output")
dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)

# -----------------------------------------------------------------------------
# 0. Simulated T1 panel (n ≈ 308) — DELETE when real data exist
# -----------------------------------------------------------------------------
set.seed(2028)
n <- 308
d <- tibble(
  participant_id = sprintf("ID%03d", 1:n),
  invited        = rbinom(n, 1, 0.5),
  area           = sample(c("Puerto Ayora", "Highlands"), n, TRUE, c(.6, .4)),
  bar_transport  = rbinom(n, 1, 0.3),
  int_baseline   = pmin(5, pmax(1, round(rnorm(n, 3.3, 0.9), 1)))
) |>
  mutate(
    attended_fest = rbinom(n, 1, ifelse(invited == 1, 0.40, 0.25)),
    # INT2 at T1: stated willingness to join a monitoring day (1–5)
    int_monitor   = pmin(5, pmax(1, round(int_baseline + 0.3 * attended_fest +
                                          rnorm(n, 0, 0.7)))),
    p_signup      = plogis(-2.2 + 0.55 * int_monitor + 0.5 * attended_fest -
                             0.4 * bar_transport),
    signed_up     = rbinom(n, 1, p_signup),
    p_attend      = plogis(-0.4 + 0.25 * int_monitor - 0.6 * bar_transport +
                             0.4 * (area == "Highlands")),
    attended_monitor = ifelse(signed_up == 1, rbinom(n, 1, p_attend), 0)
  ) |>
  select(-p_signup, -p_attend)

# Follow-up call for sign-ups who did not attend (same categories as BAR)
noshow <- d |> filter(signed_up == 1, attended_monitor == 0)
barrier_levels <- c("Work schedule", "Family care", "Transport", "Cost",
                    "Didn't hear in time / forgot", "Other")
noshow$call_barrier <- sample(barrier_levels, nrow(noshow), TRUE,
                              c(.35, .2, .15, .05, .15, .1))

# -----------------------------------------------------------------------------
# 1. H2c — Attendees more likely to sign up and attend the monitoring day
# -----------------------------------------------------------------------------
cat("=== H2c: festival attendance -> monitoring-day sign-up ===\n")
m_signup <- glm(signed_up ~ attended_fest + int_baseline + area + bar_transport,
                data = d, family = binomial)
print(round(cbind(OR = exp(coef(m_signup)), exp(confint.default(m_signup))), 2))

cat("\n=== H2c: festival attendance -> monitoring-day attendance ===\n")
m_attend <- glm(attended_monitor ~ attended_fest + int_baseline + area + bar_transport,
                data = d, family = binomial)
print(round(cbind(OR = exp(coef(m_attend)), exp(confint.default(m_attend))), 2))
cat("NOTE: attendance at the festival is self-selected; interpret with the ITT below.\n")

# -----------------------------------------------------------------------------
# 2. ITT — effect of the random invitation (unbiased, but diluted)
# -----------------------------------------------------------------------------
cat("\n=== ITT: invitation -> sign-up / attendance (risk difference) ===\n")
itt <- d |> group_by(invited) |>
  summarise(n = n(), signup_rate = mean(signed_up), attend_rate = mean(attended_monitor),
            .groups = "drop")
print(itt)
cat(sprintf("ITT on sign-up: %+.3f | ITT on attendance: %+.3f\n",
            diff(itt$signup_rate), diff(itt$attend_rate)))

# -----------------------------------------------------------------------------
# 3. Intention–behavior gap
# -----------------------------------------------------------------------------
d <- d |> mutate(intend_high = as.integer(int_monitor >= 4))

cat("\n=== Intention-behavior funnel ===\n")
funnel <- d |>
  summarise(`Intend (INT2 = 4-5)` = mean(intend_high),
            `Signed up`           = mean(signed_up),
            `Attended`            = mean(attended_monitor))
print(round(funnel, 3))

gap <- d |> filter(intend_high == 1) |>
  summarise(n_intenders = n(),
            pct_not_signed_up  = mean(signed_up == 0),
            pct_not_attended   = mean(attended_monitor == 0))
cat(sprintf(paste0("Among %d high intenders: %.0f%% did not sign up; ",
                   "%.0f%% did not attend (intention-behavior gap).\n"),
            gap$n_intenders, 100 * gap$pct_not_signed_up, 100 * gap$pct_not_attended))

# Predictive validity of the stated intention
m_pred <- glm(attended_monitor ~ int_monitor, data = d, family = binomial)
cat(sprintf("Predictive validity: OR per 1-point INT2 = %.2f; point-biserial r(INT2, attended) = %.2f\n",
            exp(coef(m_pred)[2]), cor(d$int_monitor, d$attended_monitor)))

# Same-person consistency table
cat("\nCross-tab: stated intention x behavior\n")
print(with(d, table(Intention = ifelse(intend_high == 1, "High (4-5)", "Low/mid (1-3)"),
                    Behavior  = case_when(attended_monitor == 1 ~ "Attended",
                                          signed_up == 1 ~ "Signed up, no-show",
                                          TRUE ~ "Did not sign up"))))

# -----------------------------------------------------------------------------
# 4. Barriers among sign-ups who did not attend (follow-up call)
# -----------------------------------------------------------------------------
cat("\n=== Follow-up call: barriers among no-shows ===\n")
print(sort(table(noshow$call_barrier), decreasing = TRUE))

# -----------------------------------------------------------------------------
# 5. Plots
# -----------------------------------------------------------------------------
funnel_grp <- d |>
  mutate(group = ifelse(attended_fest == 1, "Festival attendee", "Non-attendee")) |>
  group_by(group) |>
  summarise(`1 Intend (INT2 4-5)` = mean(intend_high),
            `2 Signed up`         = mean(signed_up),
            `3 Attended`          = mean(attended_monitor), .groups = "drop") |>
  tidyr::pivot_longer(-group, names_to = "stage", values_to = "prop") |>
  mutate(stage = sub("^[0-9] ", "", stage),
         stage = factor(stage, levels = c("Intend (INT2 4-5)", "Signed up", "Attended")))

p_funnel <- ggplot(funnel_grp, aes(stage, prop, fill = group)) +
  geom_col(position = position_dodge(width = 0.75), width = 0.7) +
  geom_text(aes(label = scales::percent(prop, accuracy = 1)),
            position = position_dodge(width = 0.75), vjust = -0.4, size = 3.5) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  labs(title = "From intending to doing: community tortoise-monitoring day",
       subtitle = "SIMULATED data. Stated willingness (INT2) vs sign-up vs sign-in sheet",
       x = NULL, y = "Share of panel", fill = NULL) +
  theme_minimal(base_size = 12) + theme(legend.position = "top")
ggsave(file.path(out_dir, "intention_behavior_funnel.png"), p_funnel,
       width = 7, height = 4.5, dpi = 200)

p_pred <- ggplot(d, aes(int_monitor, attended_monitor)) +
  geom_jitter(height = 0.05, width = 0.15, alpha = 0.3) +
  geom_smooth(method = "glm", method.args = list(family = binomial), formula = y ~ x) +
  labs(title = "Does stated willingness predict actual attendance?",
       subtitle = "SIMULATED data. Logistic fit",
       x = "INT2: willingness to join a monitoring day (1-5)",
       y = "Attended (sign-in sheet)") +
  theme_minimal(base_size = 12)
ggsave(file.path(out_dir, "intention_predicts_attendance.png"), p_pred,
       width = 7, height = 4.5, dpi = 200)

cat("\nPlots saved to", out_dir, "\n")
