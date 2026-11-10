# ESPM 231 — Assignment 2 Appendices
### Festival de las Tortugas Gigantes: participation in giant tortoise conservation, Santa Cruz, Galápagos
**Isabela Tapia-Jaramillo** · Behavioral Foundations of Conservation Psychology (Prof. Alejandra Echeverri) · Branch `assignment-2-tortoise-festival`

| Appendix | Repo step | Files |
|---|---|---|
| **A. Theory** | Step 02 | SIMPEA + trust + relational values row in [`theory_summary.md`](Step_02_Theory_Grounding_and_Construct_Conceptualization/theory_summary.md) (last row of the table) · memo [`notes.md`](Step_02_Theory_Grounding_and_Construct_Conceptualization/notes.md) |
| **B. Measures** | Step 03 | [`notes.md`](Step_03_Psychometric_Scales_and_Construct_Validity/notes.md) (why adapted and new measures are needed; translation; invariance) · [`scale_documentation/`](Step_03_Psychometric_Scales_and_Construct_Validity/scale_documentation/) (7 completed templates: **RV, validated from the Step 03 table**; ID, NORM, CE adapted; TRUST, INT, BAR new) |
| **C. Design** | Step 04 | [`design_decision_matrix.md`](Step_04_Study_Architecture_and_Experimental_Design/design_decision_matrix.md) (Part 1 row selected; Part 4 risk table; Part 5 summary) · [`design_docs/randomization_plan.md`](Step_04_Study_Architecture_and_Experimental_Design/design_docs/randomization_plan.md) · [`code/randomization.R`](Step_04_Study_Architecture_and_Experimental_Design/code/randomization.R) |
| **D. Instrument** | Step 06 | [`templates/survey_matrix_template.md`](Step_06_Instrument_Construction/templates/survey_matrix_template.md) (full item matrix for T0, T1 and P; variable summary; burden audit; QC checklist; **6 question types**) |
| **E. Behavior** | Step 07 | [`behavioral_measure_note.md`](Step_07_Measuring_Behavior_Beyond_Self_Report/behavioral_measure_note.md) · [`code/intention_behavior_gap.R`](Step_07_Measuring_Behavior_Beyond_Self_Report/code/intention_behavior_gap.R) |
| **F. Power and sampling** | Step 09 | [`scripts/power_analysis.R`](Step_09_Power_Analysis_Sampling_and_Pilots/scripts/power_analysis.R) · [`output/`](Step_09_Power_Analysis_Sampling_and_Pilots/output/) (results plus 3 power curves) · [`sampling_and_pilot_plan.md`](Step_09_Power_Analysis_Sampling_and_Pilots/sampling_and_pilot_plan.md) |

**Sample size in one line:** H2a (attendance 25% vs. 40%) drives N. It needs 152 per group at follow-up; ÷ 0.70 for attrition = 216 per group = 432, rounded to **440 at baseline (220 per arm)**, which also covers RQ1 (410) and H2b at *d* = 0.31 (124 per group). The assumed effect sizes are *d* = 0.31 (average) and *d* = 0.18 (bias-corrected; not powered, reported as sensitivity), from Bergquist et al. (2023).

**Reproduce (R 4.5; packages `pwr`, `ggplot2`, `dplyr`), from the repo root:**
```bash
Rscript Step_09_Power_Analysis_Sampling_and_Pilots/scripts/power_analysis.R
Rscript Step_04_Study_Architecture_and_Experimental_Design/code/randomization.R
Rscript Step_07_Measuring_Behavior_Beyond_Self_Report/code/intention_behavior_gap.R
```

**References added on 2026-11-10** (previously placeholders):

- Boren, A., & Echeverri, A. (2025). Does psychic numbing apply to endangered species conservation? The case of the Peregrine Falcon in Berkeley, California. *Frontiers in Conservation Science*, *6*. https://doi.org/10.3389/fcosc.2025.1490272
- de Goede, M., Leukfeldt, E. R., van der Wagen, W., & van de Weijer, S. (2025). Does protection motivation predict self-protective online behaviour? Comparing self-reported and actual online behaviour using a population-based survey experiment. *Computers in Human Behavior Reports*, 100649. https://doi.org/10.1016/j.chbr.2025.100649
- Johnson, N., & Reimer, T. (2023). Using the social identity model of pro-environmental behavior to predict support for the adoption of solar panels. *Journal of Environmental Studies and Sciences*, *13*(4), 587–601. https://doi.org/10.1007/s13412-023-00850-9
- Tapia-Jaramillo, I. (2022). *Multi-criteria decision analysis and public participation GIS as a spatial tool to inform and improve giant tortoise population management in the Galapagos Islands, Ecuador* [Master's thesis, University of Southampton]. https://doi.org/10.13140/RG.2.2.34320.01283
- Wilkie, D. S., Robinson, J. G., Bennett, E. L., & The WCS Wild Meat Group. (2026). Using behavioral science to end the tropical forest wild meat crisis, illustrated by a case example from Central Africa. *Conservation Science and Practice*, *8*(2), e70220. https://doi.org/10.1111/csp2.70220
