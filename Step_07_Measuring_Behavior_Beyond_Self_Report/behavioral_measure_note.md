# Step 07 — Behavioral Measure: Community Tortoise-Monitoring Day
### Sign-up and attendance vs. stated intentions

*ESPM 231 Assignment 2, Appendix E. Code: [`code/intention_behavior_gap.R`](code/intention_behavior_gap.R), adapted from [`code/analyze_behavior_data.R`](code/analyze_behavior_data.R). Example output (simulated data) is in [`code/output/`](code/output/).*

---

## 1. Why a behavioral measure

The central claim of this study is that **low participation should not be read as lack of concern**. Testing it requires observing what residents actually *do*, not only what they say they intend. Self-reported intentions overestimate pro-environmental behavior (the attitude–behavior gap; ElHaffar et al., 2020). On Santa Cruz they may be inflated further by social desirability, since the survey is about a national symbol, and by hypothetical bias, since an intention costs nothing.

## 2. The measure

At the **end of the second survey (T1)**, after all self-report items, every panel member is invited to a **real community tortoise-monitoring day in the highlands, about 2 weeks later**.

| Outcome | Definition | Source | Variable |
|---|---|---|---|
| **Sign-up** | Agrees on the spot to join (chooses a date and time slot and a pickup point) | Tablet, T1-11 | `signed_up` (0/1) |
| **Attendance** | Present on the day | **Sign-in sheet** checked against `participant_id` | `attended_monitor` (0/1) |
| **Stated counterpart** | Same person's willingness to join a monitoring day, asked earlier in the same survey (INT2, 1–5) | T1 Likert block (and T0) | `int_monitor` |

**The day itself is unpaid**, so attending costs a morning or afternoon of the resident's time and reflects a real choice. Survey payments are separate and are not conditional on signing up.

### Barriers lowered using the Wilkie et al. (2026) levers

The goal is to remove *practical* barriers (Step 03, BAR), so that the remaining gap between intention and behavior reflects motivation rather than logistics:

| Lever | Implementation |
|---|---|
| **Reward** | Free transport with **highland pickup points** (and from Puerto Ayora); breakfast and lunch; **families welcome**, with a children's activity |
| **Nudge** | **Two weekend dates**, with morning and afternoon options; **on-the-spot sign-up** during the survey; **WhatsApp or text reminder two days before** (with consent) |
| **Influence** | Invitations also shared by **local guides and community partners** |

**Follow-up for no-shows.** People who sign up but don't attend get a short follow-up call (≤ 5 min) about barriers, **using the same categories as the survey checklist** (work schedule, family care, transport, cost, didn't hear in time / forgot, other). This separates *couldn't* from *didn't want to*.

## 3. Links to the repo's examples (`examples/behavioral_measurement_examples.md`)

| Repo example | What it measured | How this study relates |
|---|---|---|
| **B-02**: Salazar et al. (2022), virtual pledges | A low-cost, public behavioral-intention proxy (pledges per visitor) | **Sign-up** is this study's pledge-like step: a public, low-cost commitment. As the B-02 entry warns, pledges overestimate commitment, so I add **attendance** (the costly step, closer to B-01's donation) and analyze the difference between the two. |
| **B-04**: Veríssimo et al. (2024), behavioral intentions on a 5-point likelihood scale | Hypothetical intentions to donate, volunteer or support policy, as an "upper-bound estimate" | **INT1–INT5** use the same format. **INT2** names the *same* behavior that is later observed, which makes a direct within-person intention–behavior comparison possible. |
| *Also relevant:* **B-09**, de Goede et al. (2025) | Actual behavior vs. a matched self-report item within the same survey experiment | The same logic: the stated item and the observed behavior are matched for each person. |

Following the methodological note under B-01/B-02, the **difference between rates** (intending → signing up → attending) is used as a direct operationalization of the intention–behavior gap.

## 4. Analysis (`code/intention_behavior_gap.R`)

1. **H2c (attendees vs. non-attendees).** Logistic regressions of `signed_up` and of `attended_monitor` on `attended_fest`, controlling for baseline intentions, area and barriers. Festival attendance is self-selected, so this comparison is interpreted together with step 2.
2. **Intention-to-treat.** Sign-up and attendance rates by **random invitation** (risk difference). This estimate is unbiased but diluted by non-compliance (Step 09 §1 caveats).
3. **Intention–behavior gap:**
   - the funnel: % high intenders (INT2 = 4–5) → % signed up → % attended, overall and by festival attendance;
   - the share of high intenders who did not sign up or did not attend;
   - predictive validity: a logistic model of attendance on INT2 (OR per scale point) and the point-biserial *r*;
   - a within-person cross-tab of intention by behavior.
4. **Barriers among no-shows.** Frequencies from the follow-up call, compared with T0 barrier reports.
5. **Covariates and robustness.** The models add trust, relational values, identification and the stratification variables. A sensitivity analysis restricts the sample to people who passed both attention checks.

With simulated data, the script runs end to end and writes two figures: `intention_behavior_funnel.png` and `intention_predicts_attendance.png`. **All numbers in the output are illustrative, not results.**

## 5. Validity and ethics notes

- **Placement.** The monitoring-day invitation is the **last** item at T1, so it cannot affect T1 self-reports. The festival invitation (T0) is likewise revealed only at the end of T0.
- **Reactivity.** The sign-in sheet is a routine part of the event (needed for transport and meals). Residents are not told it is a study measure until the **debrief**, which covers the random invitations and the use of sign-in data.
- **No penalties.** Not signing up or not attending has no consequence. Survey payments are unconditional.
- **Data protection.** The sign-in sheet links to `participant_id` only. Names are kept in a separate file, and **the GNPD never sees individual data**, even though it co-organizes the event.
- **Limitation.** A single event on two possible dates measures one behavior. It is a conservative test, since practical barriers are deliberately lowered. Durable participation would need repeated events.

---

### References

de Goede, M., Leukfeldt, E. R., van der Wagen, W., & van de Weijer, S. (2025). Does protection motivation predict self-protective online behaviour? Comparing self-reported and actual online behaviour using a population-based survey experiment. *Computers in Human Behavior Reports*, 100649. https://doi.org/10.1016/j.chbr.2025.100649

ElHaffar, G., Durif, F., & Dubé, L. (2020). Towards closing the attitude-intention-behavior gap in green consumption: A narrative review of the literature and an overview of future research directions. *Journal of Cleaner Production*, *275*, 122556. https://doi.org/10.1016/j.jclepro.2020.122556

Salazar, G., Monroe, M. C., Ennes, M., Jones, J. A., & Veríssimo, D. (2022). Testing the influence of visual framing on engagement and pro-environmental action. *Conservation Science and Practice*, *4*(10), e12812. https://doi.org/10.1111/csp2.12812

Veríssimo, D., Fiennes, S., & Dunn, M. (2024). Using digital mobile games to increase the support for nature conservation. *Conservation Science and Practice*, *6*(11), e13236. https://doi.org/10.1111/csp2.13236

Wilkie, D. S., Robinson, J. G., Bennett, E. L., & The WCS Wild Meat Group. (2026). Using behavioral science to end the tropical forest wild meat crisis, illustrated by a case example from Central Africa. *Conservation Science and Practice*, *8*(2), e70220. https://doi.org/10.1111/csp2.70220
