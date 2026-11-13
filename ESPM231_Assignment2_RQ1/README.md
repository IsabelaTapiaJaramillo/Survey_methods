# ESPM 231 — Assignment 2: Repository Appendices (RQ1)

**Isabela Tapia-Jaramillo** · Behavioral Foundations of Conservation Psychology (Prof. Alejandra Echeverri), Fall 2026

**Study:** Relational values, identity, trust and participation in giant tortoise conservation on Santa Cruz Island, Galápagos

> **RQ1.** How do residents' relational values, identification as Galapagueño/a and trust in conservation institutions predict their intentions to participate, and their actual participation, in tortoise conservation across social groups on Santa Cruz Island, Galápagos?

Everything for this assignment is in this folder.

---

## The four required appendices

| Required appendix | File |
|---|---|
| **(i)** At least one validated scale from the Step 03 table, or a justification for new measures | [`Step03_scales/scale_notes.md`](Step03_scales/scale_notes.md) and [`Step03_scales/scale_documentation/`](Step03_scales/scale_documentation/): **Relational Values (Klain et al., 2017)** is the validated scale; identification is adapted; trust, intentions and barriers are new, with justification |
| **(ii)** Step 04 design decision matrix and randomization plan | [`Step04_design/design_decision_matrix.md`](Step04_design/design_decision_matrix.md) · [`Step04_design/randomization_plan.md`](Step04_design/randomization_plan.md) (+ [`randomize_form_versions.R`](Step04_design/randomize_form_versions.R)) |
| **(iii)** Step 06 survey matrix (≥ 2 question types) and a Step 07 behavioral measure | [`Step06_survey/survey_matrix.md`](Step06_survey/survey_matrix.md) (6 question types) · [`Step07_behavior/behavioral_measure_note.md`](Step07_behavior/behavioral_measure_note.md) (+ [`rq1_models.R`](Step07_behavior/rq1_models.R)) |
| **(iv)** Step 09 power analysis in R, with the assumed effect size | [`Step09_power/power_analysis_worksheet.md`](Step09_power/power_analysis_worksheet.md) · [`Step09_power/power_analysis_rq1.R`](Step09_power/power_analysis_rq1.R) · [`Step09_power/output/`](Step09_power/output/) |

**Also included:** the Step 02 theory memo ([`Step02_theory/theory_notes.md`](Step02_theory/theory_notes.md)) and the Step 09 sampling and pilot plan ([`Step09_power/sampling_and_pilot_plan.md`](Step09_power/sampling_and_pilot_plan.md)).

## The study in five lines

1. **Design:** one face-to-face survey in Spanish (25 min, tablets), then a real invitation to a community tortoise-monitoring day about two weeks later. There is no intervention, so results are associations, not causes.
2. **Models:**
   - Intention (Y1) = identity + trust + relational values + RV × trust + identity × trust + covariates (linear).
   - Attendance (Y2), with the same predictors (logistic).
   - Plus the correlation between Y1 and Y2.
3. **Hypotheses:** relational values (H1) and identity (H2) predict intentions and attendance; trust in the GNPD **moderates** the link from relational values to participation (H3). Identity × trust is exploratory.
4. **Covariates:** area, occupation (7 categories), origin, age, gender, education, years in Galápagos, practical-barrier count.
5. **Sample:** quota sampling, **recruit 450 for 425 complete surveys**. That N gives 80% power for a small effect (f² = .02 / OR = 1.44), assuming 30% of residents attend.

## Reproduce the R results (from the repository root)

```bash
Rscript ESPM231_Assignment2_RQ1/Step09_power/power_analysis_rq1.R
Rscript ESPM231_Assignment2_RQ1/Step04_design/randomize_form_versions.R
Rscript ESPM231_Assignment2_RQ1/Step07_behavior/rq1_models.R
```

Packages: `pwr`, `MASS` (included with R). The power script takes a few minutes (1,000 simulations per setting).

## Earlier version

An earlier, larger version of this proposal also tested a community festival (RQ2). It is saved for future work on the branch [`assignment-2-tortoise-festival`](https://github.com/IsabelaTapiaJaramillo/Survey_methods/tree/assignment-2-tortoise-festival).
