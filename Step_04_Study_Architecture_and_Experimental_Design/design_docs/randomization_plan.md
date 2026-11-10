# Randomization Plan

Document the random assignment procedure here. This file should be completed **before** data collection begins and referenced in your pre-registration.

*ESPM 231 Assignment 2, Appendix C (part 2). Code: [`../code/randomization.R`](../code/randomization.R).*

---

## Study Metadata

| Field | Entry |
|---|---|
| Study title | Festival de las Tortugas Gigantes: Does a community festival celebrating human–tortoise relationships increase residents' participation in giant tortoise conservation? (Santa Cruz, Galápagos) |
| Design type | ☒ RCT-BACI (**randomized encouragement**; Gerber & Green, 2012)  ☐ Quasi-experimental BACI  ☐ ACI  ☒ Within-subjects (the same residents before and after)  ☐ Other: |
| Number of arms / conditions | 2: personal festival invitation plus snack voucher vs. no invitation |
| Blocking / stratification variables (if any) | **Area** (Puerto Ayora vs. highlands) × **occupation** (farming, fishing, tourism, public sector, other) = 10 strata, each further blocked by **enumerator** (E1–E3) = 30 cells |
| Random seed | Proposal seed **20280415** (`set.seed(20280415)`). The fieldwork seed is generated on the day the sequence is locked, recorded in the embargoed OSF pre-registration, and published once enrollment closes. |
| Software used | ☒ R (`set.seed()`)  ☐ Python (`numpy.random.seed()`)  ☐ Qualtrics randomizer  ☒ Other: KoboToolbox delivers the pre-generated R sequence through `pulldata()` |
| Script file path | `Step_04_Study_Architecture_and_Experimental_Design/code/randomization.R` |
| Person who generated assignment | Isabela Tapia-Jaramillo (PI) |
| Date generated | 2026-11-10 (proposal example). Final sequence: before the first survey begins (2028). |

---

## Condition Descriptions

| Condition label | Description | N allocated |
|---|---|---|
| Control (**Not invited**) | Completes the first survey and receives the standard payment for that survey. Receives no personal invitation and no voucher. **Can still attend the festival**: it is public and advertised island-wide, so this is an encouragement design, not a ban. | 220 |
| Treatment 1 (**Invited**) | At the end of the first survey, the tablet reveals the assignment and the enumerator hands over a **personal FESTIVAL invitation card plus a small snack voucher** with a unique code. The voucher is separate from the payment everyone receives for each survey. | 220 |
| Treatment 2 (if any) | n/a | n/a |

---

## Allocation Ratio

- Planned ratio: **1:1** (invited : not invited).
- Justification for unequal allocation (if applicable): Not applicable. A 1:1 ratio maximizes power for H2a, the test that drives the sample size: 152 per group at follow-up ÷ 0.70 → 216 per group → 440 at baseline (Step 09).

---

## Stratification / Blocking

- [ ] No blocking — simple randomization.
- [x] Blocked randomization. Block size: **randomly 2 or 4** (permuted blocks). Rationale: keeps the arms balanced within each cell at every point in enrollment, while random block sizes stop enumerators from predicting the next assignment.
- [x] Stratified randomization. Stratification variable(s): **area × occupation** (10 strata), each also blocked by **enumerator**. Rationale: area and occupation are quota variables and RQ1 moderators, and festival access differs by area (the festival is in Puerto Ayora, so highland residents face a longer trip). Blocking by enumerator balances interviewer effects and works offline, because each tablet holds its own sequence.
- [ ] Minimization / covariate-adaptive randomization. Variables minimized on: n/a

**Delivery mechanics (offline tablets):**
1. The enumerator selects area and occupation from the first-survey screen.
2. KoboToolbox looks up the next unused `participant_id` for that enumerator × stratum in the CSV produced by `randomization.R` (e.g., `PA-TOU-E2-014`).
3. The condition is held in a hidden field and shown **only on the last screen**, after every first-survey item has been saved and can no longer be edited. This means assignment cannot influence any baseline answer.
4. IDs are used strictly in order. Skipped or voided IDs are recorded in the deviations log.

Origin (born in Galápagos vs. mainland) is a quota variable but **not** a stratification variable, to avoid 60 sparse cells. It is checked in the balance table and added as a covariate.

---

## Implementation

- [x] Assignment sequence generated before any participant is enrolled.
- [x] Assignment sequence stored in a locked file (not accessible to data collectors if blinding is required). The CSV is loaded inside the Kobo form media and is not visible to enumerators. The master copy is held by the PI. The committed `assignment_sequence_example.csv` is a demonstration only.
- [x] Assignment delivered to participants via: ☒ Survey platform randomizer (KoboToolbox, pre-generated R sequence)  ☒ Researcher (the enumerator hands over the card and voucher)  ☐ Automated system
- [x] Blinding: ☐ Participants blind to condition  ☒ Data analysts blind until lock  ☐ Not blinded (document reason)
  - **Participants:** They are not told that a comparison group exists until the debrief, so they cannot be fully blind to their own condition. **Debrief:** after the monitoring day, a community debriefing session, open to everyone, explains what happened in the study, including that invitations were assigned at random and why.
  - **Enumerators:** They cannot be blind, because they deliver the invitation. To limit the impact, assignment is revealed only after all baseline answers are saved, and the second-survey scripts are identical for both arms.
  - **Analysts:** The condition is masked ("A"/"B") until the analysis plan is locked on OSF and the data are cleaned.

---

## Balance Check (complete after enrollment closes)

Run `balance_table()` in `../code/randomization.R` on the first-survey data. Expected structure below. The script includes a demonstration on simulated data; real values are filled in after enrollment.

| Covariate | Control M (SD) | Treatment M (SD) | p-value |
|---|---|---|---|
| Age | *after enrollment* | | |
| Gender | *χ² test* | | |
| Education | *χ² test* | | |
| Prior contact with focal species (tortoise encounters, prior participation in tortoise activities) | | | |
| Baseline attitude score (participation intentions INT; also norms, collective efficacy, trust, relational values, identification) | | | |
| Origin (born in Galápagos vs. mainland); years in Galápagos | | | |

- [ ] No statistically significant imbalances detected (p > .05 for all covariates).
- [ ] Imbalances detected on: _______________ → will be included as covariates in primary analysis.

*Pre-registered rule:* All primary models already adjust for the stratification variables (area, occupation) and for baseline scores (ANCOVA). Any other covariate with p < .05 is added in a sensitivity model.

---

## Threats specific to randomized encouragement (pre-registered)

| Threat | Mitigation |
|---|---|
| **Non-compliance** (invited people not attending; non-invited people attending) | Expected by design. Report ITT (effect of the invitation) and the complier average causal effect, using the invitation as an instrument for attendance (Angrist et al., 1996). |
| **Spillover / contamination** (invited people share cards or vouchers, or bring non-invited neighbors) | Vouchers are personal and coded. The second survey asks non-invited people whether someone invited them, and how. Report it, and run a sensitivity analysis excluding non-invited people in the same household or block as an invited person. |
| **Differential attrition** between arms | Compare retention by arm. Use inverse-probability weights or bounds if retention differs by > 5 points. |
| **Testing effects** (the first survey itself changes answers) | ~100 new post-festival residents answer the same outcome items; compare them with the second panel survey. |

---

## Deviations Log

Record any deviations from the pre-specified randomization plan.

| Date | Deviation | Reason | Impact on analysis |
|---|---|---|---|
| | | | |

---

*Cross-reference: `study_design_checklist.md` §5 · `../Step_05_PreRegistration/` · `../Step_09_Power_and_Sampling/`*

*References: Angrist, J. D., Imbens, G. W., & Rubin, D. B. (1996). Identification of causal effects using instrumental variables. JASA, 91(434), 444–455. · Gerber, A. S., & Green, D. P. (2012). Field experiments: Design, analysis, and interpretation. W. W. Norton.*
