# Step 09 — Power, Sampling and Pilot Plan
### Festival de las Tortugas Gigantes: randomized-encouragement study, Santa Cruz, Galápagos

*Appendix F, ESPM 231 Assignment 2. Code: [`scripts/power_analysis.R`](scripts/power_analysis.R). Output: [`output/power_results.txt`](output/power_results.txt) and the three power curves in [`output/`](output/).*

---

## 1. Power analysis

**Software.** R 4.5.2, `pwr` 1.3.0 (Champely, 2020). The repo's `power_example.py` is a Python placeholder, so this analysis replaces it with R code.

**Shared assumptions**

| Parameter | Value | Justification |
|---|---|---|
| α (two-sided) | .05 | Convention |
| Power (1 − β) | .80 | Convention |
| Effect size, average | *d* = 0.31 | Bergquist et al. (2023): mean effect of field behavior-change interventions |
| Effect size, bias-corrected | *d* = 0.18 | Bergquist et al. (2023), after correction for publication bias |
| Attrition between surveys | 30% | Alderman et al. (2001) report 3–23% loss per year in developing-country panels. In my 2024 *Guardians of the Giant Tortoises* program, 15 of 18 residents (83%) stayed active over 6 months and were easy to reach on WhatsApp. The gap here is only 6–10 weeks, so 30% is conservative. |
| Before–after correlation | *r* = 0.50 | Walters et al. (2019), *Trials* 20:566: mean baseline–follow-up correlation 0.50 across 20 trials |
| ANCOVA adjustment | *n* × (1 − *r*²) = *n* × 0.75 | Borm et al. (2007) |

**Results** (reproduced by `power_analysis.R`)

| Test | `pwr` call | Effect | Required | Power at planned N |
|---|---|---|---|---|
| **RQ1 / H1a–H1c**: one tested term (e.g., RV × trust) in a 16-predictor regression* | `pwr.f2.test(u = 1, f2 = .02)` → *v* = 392.4 | *f*² = .02 | **N = 410** at baseline (*v* + *k* + 1 = 393 + 16 + 1) | .83 (N = 440) |
| **H2a**: attendance, invited vs. not invited | `pwr.2p.test(h = ES.h(.40, .25))` | 25% vs. 40% (*h* = 0.32) | **152 per group** at follow-up; 151.2 / 0.70 = **216 per group (432 total)** at baseline | .81 (154 per arm) |
| **H2b**: ANCOVA on follow-up, controlling for baseline | `pwr.t.test(d)` × 0.75 | *d* = 0.31 | 164.3 × 0.75 → **124 per group** at follow-up (if groups were equal) | .84 (~100 attendees vs. ~208 non-attendees) |
| H2b (sensitivity) | same | *d* = 0.18 | 485.5 × 0.75 → **365 per group** | .40 (~100 vs. ~208) |

\* The 16 predictors are relational values, trust, identification and in-group norms (4); the RV × trust and identification × norms interactions (2); area (1); origin (1); occupation as 4 dummies (4); and age, gender, education and years in Galápagos (4).

**H2b sensitivity at the minimum 124 per group:** power = .37 (*d* = 0.18), .62 (*d* = 0.25), .80 (*d* = 0.31).

### Which test drives the sample size?

> **H2a is the binding constraint.** It needs 152 per group at follow-up. Divided by 0.70 (30% attrition), that is 216 per group, or **432 at baseline**, which I round up to **N = 440 (220 per arm)** as a small buffer. That baseline N also covers RQ1 (410 needed; RQ1 uses baseline data) and H2b at *d* = 0.31. H2b compares **attendees with non-attendees**, not the invitation groups. Under the H2a assumptions, about 100 of the ~308 follow-up residents attend (25% of 154 + 40% of 154) and ~208 do not. With these unequal groups, power at *d* = 0.31 is .84, because the larger non-attendee group makes up for fewer attendees.

| | Baseline | Follow-up (expected) |
|---|---|---|
| Panel, invited | 220 | ~154 |
| Panel, not invited | 220 | ~154 |
| **Panel total** | **440** | **~308** |
| New post-festival residents | n/a | ~100 (not powered; used to describe the community and check for testing effects) |

### Caveats to report honestly
1. **H2b at the bias-corrected *d* = 0.18 is not powered** (.40 with ~100 attendees vs. ~208 non-attendees). I report it as a sensitivity result, not as a confirmatory test.
2. **ITT and IV estimates for H2b are supplementary.** The invitation raises attendance by only 15 points (25% → 40%). The intention-to-treat effect of the *invitation* on H2b outcomes is therefore about 0.15 × *d* (ITT *d* ≈ 0.05), and power for it is ≈ .08. The IV (complier) estimate (Angrist et al., 1996) recovers *d*, but its standard error is inflated by roughly 1/0.15. The attendee vs. non-attendee ANCOVA is the powered comparison, but attendees self-select, so I interpret it alongside the ITT and IV estimates and never on its own.
3. **H2c (monitoring-day sign-up and attendance) is not separately powered**, because no local base rate exists. The pilot (§3) gives a first estimate of sign-up rates, and if needed H2c is re-checked with `pwr.2p.test` before the main survey.
4. **The pilot will re-estimate *r* and attrition.** If the observed pre–post *r* is below .50, or attrition is above 30%, the curves in `output/` show the resulting loss of power.

---

## 2. Sampling plan

**Target population.** Adults (18+) who live on Santa Cruz Island: Puerto Ayora (urban) and the highland parishes of Bellavista and Santa Rosa.

**Inferential goal.** Group comparison and theory testing (Step 01), not population estimates. The scheme is **non-probability quota sampling**, so results describe the groups sampled, not the whole island. I state this bias openly in the limitations.

**Quota cells** (targets are set in proportion to the most recent INEC Galápagos census and adjusted after the pilot)

| Quota dimension | Levels |
|---|---|
| Area | Puerto Ayora vs. highlands (Bellavista + Santa Rosa) |
| Occupation | Farming · fishing · tourism · public sector · other |
| Origin | Born in Galápagos vs. born in mainland Ecuador |

**Recruitment.** Three trained local enumerators recruit as follows:
- **Puerto Ayora:** door to door in **randomly chosen blocks**. Blocks are drawn in R with a recorded seed from the municipal block map; within a block, every *k*-th dwelling, one adult per household.
- **Highlands:** door to door **along highland roads**, which reach the dispersed farms that block sampling misses.
- **Associations:** through **farmers' and fishers' associations**, to fill occupation quotas that door-to-door contact under-covers.

Enumerators record refusals and non-contacts by quota cell so that response rates can be reported.

**Field effort.** At ~8 surveys per enumerator per day, three enumerators need **~18 field days** for the first survey (440 / 24) and **~17 days** for the second (re-contacting the panel plus ~100 new residents).

**Known biases (limitations).**
- Association members and people who are at home are likely over-represented.
- Residents most distrustful of institutions may refuse. To reduce this, consent states that the research team is independent of the GNPD.
- Residents with practical barriers (long work hours, care duties) are harder to reach. To reduce this, visits include evenings and weekends.

---

## 3. Pilot plan

| Stage | n | Who | What I check | Decision rules |
|---|---|---|---|---|
| **Translation** | n/a | Two bilingual translators, plus me as a Galapagueña reviewer | Forward translation into Galápagos Spanish, independent back-translation (Brislin, 1970), and reconciliation | Any item whose back-translation changes its meaning is revised and re-translated |
| **Cognitive interviews** | **8–15** | Residents spread across the quota cells: Puerto Ayora and highlands, born in Galápagos and on the mainland, at least two farmers and two fishers | Think-aloud and verbal probing (Willis, 2005), focused on: the meaning of "Galapagueño/a" for mainland-born residents; whether trust items about GNPD staff assume contact the person never had; the wording of the relational-values items; and whether the attention checks read as comprehension aids rather than traps | An item misunderstood by ≥ 2 of 8 people is revised; the revised version is retested with the next interviews |
| **Pilot survey** | **50–100** | Residents from all quota cells, *excluded* from the main sample | Completion time per block (target ≤ 20 min of questions); item non-response; attention-check pass rate; **reliability (Cronbach's α and McDonald's ω, `psych::omega`)** for each multi-item scale; **factor structure (CFA in `lavaan`)**: RV (1 factor); identification (1 factor); norms and collective efficacy (2 factors); trust (3 correlated factors: competence, relationships, procedures); intentions (1 factor); base rate of monitoring-day sign-up; KoboToolbox randomization and invitation delivery | Keep a scale if α or ω ≥ .70. Drop or revise items with loadings < .40 or item–total *r* < .30. If a block runs > 25% over its time budget, cut items. If < 80% pass the attention checks, revise the checks and the enumerator training. Re-run `power_analysis.R` with pilot estimates of *r* and the sign-up rate. |

All pilot decisions are logged in the survey matrix version log (Step 06, Part 10) and reported transparently. The pilot → revise → re-pilot loop is repeated if a scale fails.

---

## References

Alderman, H., Behrman, J. R., Kohler, H.-P., Maluccio, J. A., & Watkins, S. C. (2001). Attrition in longitudinal household survey data. *Demographic Research*, *5*, 79–124. https://doi.org/10.4054/DemRes.2001.5.4

Angrist, J. D., Imbens, G. W., & Rubin, D. B. (1996). Identification of causal effects using instrumental variables. *Journal of the American Statistical Association*, *91*(434), 444–455. https://doi.org/10.1080/01621459.1996.10476902

Bergquist, M., Thiel, M., Goldberg, M. H., & van der Linden, S. (2023). Field interventions for climate change mitigation behaviors: A second-order meta-analysis. *Proceedings of the National Academy of Sciences*, *120*(13), e2214851120. https://doi.org/10.1073/pnas.2214851120

Borm, G. F., Fransen, J., & Lemmens, W. A. J. G. (2007). A simple sample size formula for analysis of covariance in randomized clinical trials. *Journal of Clinical Epidemiology*, *60*(12), 1234–1238. https://doi.org/10.1016/j.jclinepi.2007.02.006

Brislin, R. W. (1970). Back-translation for cross-cultural research. *Journal of Cross-Cultural Psychology*, *1*(3), 185–216. https://doi.org/10.1177/135910457000100301

Champely, S. (2020). *pwr: Basic functions for power analysis* (R package version 1.3-0). https://CRAN.R-project.org/package=pwr

Walters, S. J., Jacques, R. M., dos Anjos Henriques-Cadby, I. B., Candlish, J., Totton, N., & Xian, M. T. S. (2019). Sample size estimation for randomised controlled trials with repeated assessment of patient-reported outcomes: What correlation between baseline and follow-up outcomes should we assume? *Trials*, *20*, 566. https://doi.org/10.1186/s13063-019-3671-2

Willis, G. B. (2005). *Cognitive interviewing: A tool for improving questionnaire design*. SAGE.
