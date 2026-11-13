# Step 03 — Scale Decisions and Population Equivalence

*Filled-in version of `Step_03_Psychometric_Scales_and_Construct_Validity/notes.md` ("notes on selection of psychometric scales, adaptations made, and considerations for equivalence across different populations"). Each measure has a completed `scale_documentation_template.md` in [`scale_documentation/`](scale_documentation/).*

---

## 1. Measures

| Measure | Items | Status | Source | Documentation |
|---|---|---|---|---|
| Relational Values (RV) | 6 | **Validated, from the Step 03 reference table** | Klain et al. (2017) | [`01_relational_values.md`](scale_documentation/01_relational_values.md) |
| Identification as Galapagueño/a (ID) | 4 | Adapted | Leach et al. (2008) | [`02_identification_galapagueno.md`](scale_documentation/02_identification_galapagueno.md) |
| Trust in the GNPD (TRUST) | 6 (2 × 3 types) | New, built from theory | Stern & Coleman (2015) | [`03_trust_gnpd.md`](scale_documentation/03_trust_gnpd.md) |
| Participation intentions (INT, outcome Y1) | 5 | New (behavior-specific) | Fishbein & Ajzen (2010); Step 07 example B-04 | [`04_participation_intentions.md`](scale_documentation/04_participation_intentions.md) |
| Practical barriers (BAR) | 7 options | New checklist | COM-B "opportunity" (Michie et al., 2011) | [`05_practical_barriers.md`](scale_documentation/05_practical_barriers.md) |

The wording of every item was reviewed and approved by the author on 2026-11-10. The behavioral outcome (Y2, monitoring-day attendance) is documented in Step 07.

**Assignment requirement (i):** at least one construct is measured with a validated scale from the Step 03 reference table: **Relational Values (Klain et al., 2017)**.

## 2. Why adapted and new measures are needed

The Step 03 reference table covers values and worldviews, environmental identity, nature connectedness, attitudes toward animals, affect and wellbeing. It has **no scale for social (group) identification or for trust in an institution**.
- **Why not the Environmental Identity scale (EID / EID-R; Clayton, 2003)?** It measures identity *with nature*. This study needs identification *with a social group* (Galapagueños), so using the EID would mix up the "relationship with nature" pathway (already measured by RV) with the "relationship with group" pathway.
- **Identification** therefore uses one item from each of four components of Leach et al.'s (2008) model. Johnson and Reimer (2023) used three Leach items in a SIMPEA study and found α = .81.
- **Trust** items were written from Stern and Coleman's (2015) definitions of three trust types, because no published scale measures trust in a park authority across competence, personal relationships and rules and procedures.
- **Intentions** must match the target behavior (Fishbein & Ajzen, 2010), so they are written for this study. INT2 names the same behavior that is observed in Step 07.

## 3. Translation and pre-testing

1. **Forward translation** into Galápagos Spanish, reviewed by the author for local wording (e.g., *"la parte alta"*, *"DPNG"*).
2. **Independent back-translation** (Brislin, 1970), with discrepancies reconciled and logged.
3. **Cognitive interviews with 8 residents** across quota groups (Willis, 2005).
4. **Pilot survey with 30 residents** (not in the main sample): α and ω and item–total correlations for each multi-item measure, as a rough check. CFA for each measure is run on the main sample before hypothesis testing, because 30 people is too few (Step 09 plan).

## 4. Cross-group equivalence

Groups (area, occupation, origin) are covariates in every model, so it matters that the scales mean the same thing in each group. In the main data, multi-group CFA tests whether loadings and intercepts are equal across area and origin before group means are compared. Expected sources of difference:
- the meaning of "Galapagueño/a" for island-born vs. mainland-born residents;
- contact with GNPD rules, which differs across occupations;
- possible ceiling effects on RV (Klain et al., 2017: mean 4.4 among Costa Rican farmers).

*Items still awaiting the author's review:* the invariance testing. *(Cognitive-interview probes reviewed and approved by the author, 2026-11-12.)*

---

### References

Brislin, R. W. (1970). Back-translation for cross-cultural research. *Journal of Cross-Cultural Psychology*, *1*(3), 185–216. https://doi.org/10.1177/135910457000100301

Clayton, S. (2003). Environmental identity: A conceptual and an operational definition. In S. Clayton & S. Opotow (Eds.), *Identity and the natural world* (pp. 45–65). MIT Press.

Fishbein, M., & Ajzen, I. (2010). *Predicting and changing behavior: The reasoned action approach*. Psychology Press.

Johnson, N., & Reimer, T. (2023). Using the social identity model of pro-environmental behavior to predict support for the adoption of solar panels. *Journal of Environmental Studies and Sciences*, *13*(4), 587–601. https://doi.org/10.1007/s13412-023-00850-9

Klain, S. C., Olmsted, P., Chan, K. M. A., & Satterfield, T. (2017). Relational values resonate broadly and differently than intrinsic or instrumental values, or the New Ecological Paradigm. *PLOS ONE*, *12*(8), e0183962. https://doi.org/10.1371/journal.pone.0183962

Leach, C. W., van Zomeren, M., Zebel, S., Vliek, M. L. W., Pennekamp, S. F., Doosje, B., Ouwerkerk, J. W., & Spears, R. (2008). Group-level self-definition and self-investment: A hierarchical (multicomponent) model of in-group identification. *Journal of Personality and Social Psychology*, *95*(1), 144–165. https://doi.org/10.1037/0022-3514.95.1.144

Michie, S., van Stralen, M. M., & West, R. (2011). The behaviour change wheel: A new method for characterising and designing behaviour change interventions. *Implementation Science*, *6*, 42. https://doi.org/10.1186/1748-5908-6-42

Stern, M. J., & Coleman, K. J. (2015). The multidimensionality of trust: Applications in collaborative natural resource management. *Society & Natural Resources*, *28*(2), 117–132. https://doi.org/10.1080/08941920.2014.945062

Willis, G. B. (2005). *Cognitive interviewing: A tool for improving questionnaire design*. SAGE.
