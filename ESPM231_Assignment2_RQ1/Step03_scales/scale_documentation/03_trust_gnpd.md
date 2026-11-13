# Scale documentation — Trust in the Galápagos National Park Directorate (TRUST)

*Status: **new** measure built from theory (the Step 03 table has no trust scale; see `../scale_notes.md`). Wording and the "No sé" option reviewed and approved by the author, 2026-11-10.*

- **Construct name:** Trust in the GNPD (*Dirección del Parque Nacional Galápagos*) as the institution responsible for tortoise conservation. It has **three types** (Stern & Coleman, 2015):
  - **competence**: *rational* trust, based on the institution's ability and results;
  - **personal relationships**: *affinitive* trust, based on care, shared identity and being listened to;
  - **rules and procedures**: *procedural* trust, based on fair and transparent rules and decisions.

  (Stern & Coleman's fourth type, *dispositional* trust, is a general personality tendency and is not measured.)
- **Source / citation:** Built from the conceptual definitions in Stern & Coleman (2015), *Society & Natural Resources*, *28*(2), 117–132. **Two items per trust type.**
- **Items (numbered):**

| # | Variable | Trust type | English | Spanish draft |
|---|---|---|---|---|
| TR1 | `tr_comp_skill` | Competence | The GNPD has the knowledge and skills to protect giant tortoises effectively. | La DPNG tiene los conocimientos y la capacidad para proteger eficazmente a las tortugas gigantes. |
| TR2 | `tr_comp_results` | Competence | The GNPD's work to protect tortoises achieves good results. | El trabajo de la DPNG para proteger a las tortugas logra buenos resultados. |
| TR3 | `tr_rel_care` | Personal relationships | GNPD staff care about the wellbeing of the people who live on Santa Cruz. | El personal de la DPNG se preocupa por el bienestar de las personas que viven en Santa Cruz. |
| TR4 | `tr_rel_listen` | Personal relationships | GNPD staff listen to people like me. | El personal de la DPNG escucha a personas como yo. |
| TR5 | `tr_proc_fair` | Rules and procedures | The GNPD's rules about tortoises are applied fairly to everyone. | Las reglas de la DPNG sobre las tortugas se aplican de manera justa para todos. |
| TR6 | `tr_proc_transp` | Rules and procedures | The GNPD makes decisions about tortoise conservation in an open and transparent way. | La DPNG toma decisiones sobre la conservación de las tortugas de manera abierta y transparente. |

- **Response format:** 5-point Likert (1 = Strongly disagree … 5 = Strongly agree), plus a separate **"No sé / I don't know"** option that is coded as missing, not as the midpoint. This matters because some residents have little contact with the GNPD.
- **Scoring rules:**
  - Overall trust = mean of TR1–TR6, computed if at least 4 of 6 items are answered.
  - Subscale means (competence, relationships, procedures) are also reported for descriptive and exploratory analyses.
  - The share of "No sé" answers is reported by quota cell, as an indicator of institutional distance.
- **Known reliability:** New measure, with no prior estimates. Pilot targets: ω ≥ .70 for the total score. With only 2 items per subscale, I will report the Spearman–Brown coefficient for each subscale rather than α (Eisinga et al., 2013).
- **Validation notes:**
  - In the main sample, before hypothesis testing, I will compare two CFA models: a 3-factor model (correlated trust types) and a 1-factor model. If the 3-factor model does not fit better, the total score is used in confirmatory tests.
  - Expected convergent validity: trust correlates with prior participation in GNPD activities.
  - Expected discriminant validity: trust is distinct from relational values. A high-RV, low-trust group is predicted (H3), which itself supports discriminant validity.
- **Fairness / cross-group equivalence considerations:**
  - **Sensitivity:** Residents may fear that critical answers reach the GNPD. Consent states that the research team is independent, names are stored separately from answers, and **the GNPD never sees individual data**. Trust items come *after* the relational-values and identity blocks, not at the start.
  - The **procedural items may mean different things** to fishers and farmers, who encounter GNPD rules directly (fishing zoning, tortoise movement across farms), than to tourism workers. Occupation is a covariate in every model; invariance across occupation is not tested, because it is outside the scope of the study.
- **Role in this study:** **Focal predictor** of intentions and attendance (H4) and **moderator** of the association between relational values and participation (H3: RV × trust); identity × trust is exploratory. GNPD employees are flagged with a separate yes/no question, and results are checked with and without them, because for them the items describe their own employer.
