# Step 09 — Sampling and Pilot Plan

*ESPM 231 Assignment 2 (RQ1 only), Isabela Tapia-Jaramillo. Sample size: see [`power_analysis_worksheet.md`](power_analysis_worksheet.md): **recruit 450 for 425 complete surveys**.*

---

## 1. Target population and inferential goal

- **Population:** adults (18+) who live on Santa Cruz Island: Puerto Ayora and the highland parishes of Bellavista and Santa Rosa.
- **Goal:** test hypotheses about how relational values, identity and trust predict intentions and participation, and describe differences between groups (Step 01). There is no complete public list of residents, so the study uses **non-probability quota sampling**. Results describe the groups sampled, not the whole island, and this is stated openly.

## 2. Quotas

| Quota dimension | Levels |
|---|---|
| Area | Puerto Ayora vs. highlands (Bellavista + Santa Rosa) |
| Occupation | Farming · fishing · tourism · naturalist guide · conservation & research · education & public services · other |
| Origin | Born in Galápagos vs. born in mainland Ecuador (other countries recorded) |

Quota targets are set in proportion to the most recent Galápagos census and adjusted after the pilot. There is no minimum per occupation: occupation is a control variable, not a group being compared. Any occupation with fewer than 10 people in the final sample is merged with the most similar category before the main analysis (e.g., naturalist guide into tourism), and the final count for each occupation is reported. *(Merge rule and the cutoff of 10 proposed by Claude as a rule of thumb, approved by the author 2026-11-11.)* Occupation is classified by the **type of work**, not the employer, so teachers in public and private schools are both in "education & public services". GNPD employees are flagged with a separate question.

## 3. Recruitment

Three trained local enumerators recruit through:
- **Puerto Ayora:** door to door in **randomly chosen blocks** (drawn in R with a recorded seed from the municipal block map; one adult per household);
- **Highlands:** door to door **along highland roads**;
- **Associations:** **farmers' and fishers' associations**; and **schools**, including the two private schools, to fill the education quota if needed.

Visits include evenings and weekends, so people with long working hours can take part. Refusals and non-contacts are recorded by quota group so response rates can be reported. At ~8 surveys per enumerator per day, 450 surveys take **about 19 field days**.

**Known biases (limitations):**
- Association members and people at home may be over-represented.
- Residents who distrust institutions may be more likely to refuse. To reduce this, consent stresses that the team is independent of the GNPD.

## 4. Pilot plan

| Stage | n | What is checked | Decision rules |
|---|---|---|---|
| **Translation** | n/a | Forward translation and independent back-translation (Brislin, 1970) | Items whose meaning changes are revised and translated again |
| **Cognitive interviews** | **8–15** residents across quota groups | Think-aloud and verbal probing (Willis, 2005): the meaning of "Galapagueño/a"; trust items for people with little GNPD contact; long relational-values items; attention checks as comprehension aids; the occupation categories | An item misunderstood by 2 or more of the first 8 people is revised and retested |
| **Pilot survey** | **50–100** residents, not in the main sample | Completion time per block; item non-response; attention-check pass rate; **reliability (Cronbach's α and McDonald's ω)** and **factor structure (CFA)** for RV, ID, TRUST and INT; correlation among identity, trust and RV (assumed .30); monitoring-day sign-up and attendance rates (assumed 30%) | Keep a scale if α or ω ≥ .70. Revise items with loadings < .40. Cut items if a block runs > 25% over time. Re-run `power_analysis_rq1.R` if the attendance rate or the predictor correlation differs a lot from the assumptions. |

*The decision-rule thresholds were proposed by Claude and await the author's review.*

---

### References

Brislin, R. W. (1970). Back-translation for cross-cultural research. *Journal of Cross-Cultural Psychology*, *1*(3), 185–216. https://doi.org/10.1177/135910457000100301

Willis, G. B. (2005). *Cognitive interviewing: A tool for improving questionnaire design*. SAGE.
