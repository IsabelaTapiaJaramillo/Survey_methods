# Randomization Plan

Document the random assignment procedure here. This file should be completed **before** data collection begins and referenced in your pre-registration.

*ESPM 231 Assignment 2 (RQ1 only), Isabela Tapia-Jaramillo. Code: [`randomize_form_versions.R`](randomize_form_versions.R).*

> **No one is assigned to treatment groups in this study.** The design is cross-sectional (one survey followed by a behavioral measure), so there is no control or treatment arm. What *is* randomized is the **order of survey content**, to control order effects. This plan documents that procedure. *(Proposed by Claude; awaiting the author's approval.)*

---

## Study Metadata

| Field | Entry |
|---|---|
| Study title | Relational values, identity, trust and participation in giant tortoise conservation on Santa Cruz Island, Galápagos |
| Design type | ☐ RCT-BACI  ☐ Quasi-experimental BACI  ☐ ACI  ☐ Within-subjects  ☒ Other: **cross-sectional survey with a behavioral follow-up; randomized question order (form versions)** |
| Number of arms / conditions | No treatment arms. **4 form versions** = 2 photo orders × 2 item orders |
| Blocking / stratification variables (if any) | **Enumerator** (E1–E3): each enumerator follows their own balanced sequence |
| Random seed | Proposal seed **20280415** (`set.seed(20280415)`). The final seed is recorded in the OSF pre-registration. |
| Software used | ☒ R (`set.seed()`)  ☐ Python (`numpy.random.seed()`)  ☐ Qualtrics randomizer  ☒ Other: the four versions are separate KoboToolbox forms |
| Script file path | `ESPM231_Assignment2_RQ1/Step04_design/randomize_form_versions.R` |
| Person who generated assignment | Isabela Tapia-Jaramillo (PI) |
| Date generated | 2026-11-11 (proposal example; final sequence generated before fieldwork) |

---

## Condition Descriptions

| Condition label | Description | N allocated |
|---|---|---|
| Control | Not applicable: no treatment or control group | n/a |
| Version TF | Tortoise photo first; Likert items in forward order | ~113 (¼ of 450) |
| Version TB | Tortoise photo first; Likert items in reversed order | ~113 |
| Version RF | Park-ranger photo first; items forward | ~112 |
| Version RB | Park-ranger photo first; items reversed | ~112 |

**Why these two factors:**
- **Photo order.** The park-ranger photo could change the words people give for the tortoise photo, or the reverse.
- **Item order.** Within each Likert block, randomizing item order prevents primacy and recency effects and straight-lining (Step 06 template, Part 9).

The **order of the blocks** stays fixed for everyone, with intentions before the predictors and trust last because it is the most sensitive. That way every respondent answers the outcome and the sensitive items in the same context.

---

## Allocation Ratio

- Planned ratio: **1:1:1:1** across the four versions.
- Justification for unequal allocation (if applicable): not applicable.

---

## Stratification / Blocking

- [ ] No blocking — simple randomization.
- [x] Blocked randomization. Block size: **4** (each block contains every version once, in random order). Rationale: keeps the four versions balanced at every point of fieldwork.
- [x] Stratified randomization. Stratification variable(s): **enumerator**. Rationale: each enumerator's tablet holds its own sequence (fieldwork is offline), and balancing versions within enumerators keeps interviewer effects separate from order effects.
- [ ] Minimization / covariate-adaptive randomization. Variables minimized on: n/a

---

## Implementation

- [x] Assignment sequence generated before any participant is enrolled (`form_version_sequence.csv`).
- [ ] Assignment sequence stored in a locked file (not accessible to data collectors if blinding is required). *Not needed: knowing the next form version gives enumerators no reason or opportunity to change who they recruit.*
- [x] Assignment delivered to participants via: ☐ Survey platform randomizer  ☒ Researcher (the enumerator opens the form version listed for their next participant ID)  ☐ Automated system
- [x] Blinding: ☐ Participants blind to condition  ☒ Data analysts blind until lock  ☐ Not blinded (document reason). *Participants see only one version and are not told that others exist; this is not deception, and it is explained at the community debriefing session.*

---

## Balance Check (complete after enrollment closes)

Run a balance table comparing the four form versions on key covariates. This checks that version assignment followed the plan. Then test for **order effects**: add `form_version` to Models 1 and 2 in a sensitivity analysis.

| Covariate | Version TF M (SD) | TB | RF | RB | p-value |
|---|---|---|---|---|---|
| Age | | | | | |
| Gender | | | | | |
| Education | | | | | |
| Prior contact with focal species (how often they see tortoises) | | | | | |
| Area, occupation, origin | | | | | |

- [ ] No statistically significant imbalances detected (p > .05 for all covariates).
- [ ] Imbalances detected on: _______________ → will be included as covariates in primary analysis.

---

## Deviations Log

Record any deviations from the pre-specified randomization plan.

| Date | Deviation | Reason | Impact on analysis |
|---|---|---|---|
| | | | |

---

*Cross-reference: `design_decision_matrix.md` · `../Step06_survey/survey_matrix.md` · `../Step09_power/`*
