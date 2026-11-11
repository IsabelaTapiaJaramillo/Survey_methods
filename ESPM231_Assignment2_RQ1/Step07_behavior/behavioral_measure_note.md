# Step 07 — Behavioral Measure: Community Tortoise-Monitoring Day

*ESPM 231 Assignment 2 (RQ1 only), Isabela Tapia-Jaramillo. Code: [`rq1_models.R`](rq1_models.R), adapted from `Step_07_Measuring_Behavior_Beyond_Self_Report/code/analyze_behavior_data.R`. Demo output from simulated data is in [`output/`](output/).*

---

## 1. Why measure behavior

RQ1 asks how relational values, identification and trust predict both what residents **intend** and what they **actually do**. The central claim is that some residents care about tortoises but do not take part, for example because they distrust the institution. Testing it requires observing behavior, not only intentions. Self-reported intentions overestimate pro-environmental behavior (the attitude–behavior gap; ElHaffar et al., 2020), and a survey about a national symbol invites socially desirable answers.

## 2. The measure

At the **end of the survey**, after every self-report question, each resident is invited to a **real community tortoise-monitoring day in the Santa Cruz highlands, about two weeks later**. Participants record the tortoises they see along a route with local guides, as in the *Guardians of the Giant Tortoises* program on Isabela.

| Outcome | Definition | Source | Variable |
|---|---|---|---|
| **Sign-up** | Agrees on the spot to join (date, time slot, pickup point) | Tablet (B6-01) | `signed_up` (0/1) |
| **Attendance = Y2** | Present on the day | **Sign-in sheet**, matched by participant ID | `attended_monitor` (0/1) |
| Stated counterpart | Willingness to join a monitoring day (INT2, 1–5), asked earlier in the same survey | Likert block (B3-02) | `int_monitor` |

The day is **unpaid**, so attending costs a morning or afternoon and reflects a real choice. The survey payment is the same for everyone and does not depend on signing up.

### Lowering practical barriers (Wilkie et al., 2026)

| Lever | Implementation |
|---|---|
| **Reward** (lower the costs) | Free transport from Puerto Ayora, with pickup points in Bellavista and Santa Rosa; breakfast and lunch; families welcome, with a children's activity |
| **Nudge** (make it simple) | Two weekend dates, with morning and afternoon options; sign-up on the spot; a WhatsApp or text reminder two days before |
| **Influence** (respected messengers) | Local guides and community partners help share the invitation |

**No-shows.** Residents who sign up but do not attend get a short follow-up call (≤ 5 min) about what made it hard to come, using the same barrier categories as the survey. This separates *could not* from *did not want to*.

## 3. Links to the repo's examples (`examples/behavioral_measurement_examples.md`)

| Repo example | What it measured | How this study relates |
|---|---|---|
| **B-02**: Salazar et al. (2022), virtual pledges | A low-cost public commitment | **Sign-up** is the pledge-like step. Pledges overestimate commitment, so **attendance** (the costly step) is the outcome Y2. |
| **B-04**: Veríssimo et al. (2024), intentions on a 5-point likelihood scale | Hypothetical intentions, an upper bound | **INT1–INT5** use the same format; INT2 names the exact behavior later observed. |
| **B-09**: de Goede et al. (2025), actual vs. self-reported behavior in the same people | Matched self-report and behavior | Same logic: each person's stated intention is compared with their own attendance. |

## 4. Analysis (`rq1_models.R`)

1. **Model 1 (intention, linear):** Y1 = identity + trust + RV + RV × trust + identity × trust + covariates.
2. **Model 2 (attendance, logistic):** the same predictors, with attendance (0/1) as the outcome. Odds ratios are reported.
3. **Moderation:** focal predictors are mean-centered (Aiken & West, 1991). Significant interactions are shown with simple slopes (the effect of RV and identity at low vs. high trust) and a plot of predicted attendance.
4. **Intention–behavior link:** the point-biserial correlation between Y1 and Y2; the funnel from intending (INT2 = 4–5) to signing up to attending; the share of high intenders who did not attend; and a comparison of which predictors matter for intention vs. attendance.
5. **Group differences:** covariate estimates (area, occupation, origin) and attendance by occupation.
6. **Sensitivity:** without GNPD staff; with form version and recent shocks added; with only people who passed both attention checks.

## 5. Validity and ethics

- **Placement.** The invitation comes last, so it cannot affect self-reports.
- **Reactivity.** The sign-in sheet is a routine part of the event (needed for transport and meals). Residents learn that it was also a study measure at the **community debriefing session after the monitoring day**, which is open to everyone.
- **No penalties.** Not signing up or not attending has no consequence.
- **Data protection.** The sign-in sheet links only to the participant ID. Names are stored separately, and the GNPD never sees individual data.
- **Limitation.** One event measures one behavior. Lowering barriers makes this a conservative test of motivation; it does not capture long-term participation.

---

### References

Aiken, L. S., & West, S. G. (1991). *Multiple regression: Testing and interpreting interactions*. Sage.

de Goede, M., Leukfeldt, E. R., van der Wagen, W., & van de Weijer, S. (2025). Does protection motivation predict self-protective online behaviour? Comparing self-reported and actual online behaviour using a population-based survey experiment. *Computers in Human Behavior Reports*, 100649. https://doi.org/10.1016/j.chbr.2025.100649

ElHaffar, G., Durif, F., & Dubé, L. (2020). Towards closing the attitude-intention-behavior gap in green consumption: A narrative review of the literature and an overview of future research directions. *Journal of Cleaner Production*, *275*, 122556. https://doi.org/10.1016/j.jclepro.2020.122556

Salazar, G., Monroe, M. C., Ennes, M., Jones, J. A., & Veríssimo, D. (2022). Testing the influence of visual framing on engagement and pro-environmental action. *Conservation Science and Practice*, *4*(10), e12812. https://doi.org/10.1111/csp2.12812

Veríssimo, D., Fiennes, S., & Dunn, M. (2024). Using digital mobile games to increase the support for nature conservation. *Conservation Science and Practice*, *6*(11), e13236. https://doi.org/10.1111/csp2.13236

Wilkie, D. S., Robinson, J. G., Bennett, E. L., & The WCS Wild Meat Group. (2026). Using behavioral science to end the tropical forest wild meat crisis, illustrated by a case example from Central Africa. *Conservation Science and Practice*, *8*(2), e70220. https://doi.org/10.1111/csp2.70220
