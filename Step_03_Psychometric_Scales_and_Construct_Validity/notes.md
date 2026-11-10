# Scale Decisions and Population Equivalence

*Notes on selection of psychometric scales, adaptations made, and considerations for equivalence across different populations.*

**Study:** Festival de las Tortugas Gigantes, Santa Cruz, Galápagos (ESPM 231, Assignment 2, Appendix B)

---

## 1. Summary of measures

| Measure | Items | Status | Source | Documentation |
|---|---|---|---|---|
| Relational Values (RV) | 6 | **Validated, from the Step 03 table** | Klain et al. (2017) | [`01_relational_values.md`](scale_documentation/01_relational_values.md) |
| Identification as Galapagueño/a (ID) | 4 | Adapted | Leach et al. (2008) | [`02_identification_galapagueno.md`](scale_documentation/02_identification_galapagueno.md) |
| In-group norms (NORM) | 3 | Adapted | SIMPEA studies (e.g., Johnson & Reimer, 2023) | [`03_ingroup_norms.md`](scale_documentation/03_ingroup_norms.md) |
| Collective efficacy (CE) | 3 | Adapted | SIMPEA studies (e.g., Johnson & Reimer, 2023) | [`04_collective_efficacy.md`](scale_documentation/04_collective_efficacy.md) |
| Trust in the GNPD (TRUST) | 6 (2 × 3 types) | New, built from theory | Stern & Coleman (2015) | [`05_trust_gnpd.md`](scale_documentation/05_trust_gnpd.md) |
| Participation intentions (INT) | 5 | New (behavior-specific) | Fishbein & Ajzen (2010); Step 07 B-04 | [`06_participation_intentions.md`](scale_documentation/06_participation_intentions.md) |
| Practical barriers (BAR) | 7 options | New formative checklist | Assignment 1; COM-B "opportunity" | [`07_practical_barriers.md`](scale_documentation/07_practical_barriers.md) |

This meets the assignment requirement: **at least one construct is measured with a validated scale from the Step 03 reference table** (Relational Values, Klain et al., 2017). The other measures are adapted or new, for the reasons below.

## 2. Why adapted and new measures are needed

The Step 03 reference table covers values and worldviews (NEP, RV, WVO, EVBS), environmental identity, nature connectedness, attitudes toward animals, affect and wellbeing. It contains **no scales for social (group) identification, in-group norms, collective efficacy or institutional trust**, the core constructs of SIMPEA and of the trust extension. Two near neighbors were considered and rejected:

- **EID / EID-R** (Clayton, 2003; Clayton et al., 2021) measures *environmental* identity: identity with nature. SIMPEA requires identification with a *social group* (Galapagueños). Using the EID would confuse the "relationship with nature" pathway (already captured by RV) with the "relationship with groups" pathway.
- **Kellert, BAtSS and the bird attitude scales** measure attitudes toward species, not participation in collective action.

I therefore:
1. **adapted** established items for identification (Leach et al., 2008), norms and collective efficacy (SIMPEA studies), changing only the target group and behavior;
2. **built** the trust items directly from Stern and Coleman's (2015) definitions of trust types, because no published scale measures trust in a park authority across all three types;
3. **wrote** behavior-specific intention items, as is standard: intentions must match the target behavior in action, target, context and time (Fishbein & Ajzen, 2010).

## 3. Adaptations made

| Adaptation | Measures affected | Reason |
|---|---|---|
| 5-point response format throughout | ID (originally 7-point) | One show card for all face-to-face Likert blocks, which lowers burden and confusion on tablets |
| Shortened to one item per component | ID | Keeps the survey within 20 minutes of questions while covering all four Leach et al. components |
| "No sé / I don't know" option, coded as missing | TRUST | Some residents have little contact with the GNPD, and a forced midpoint would bias trust toward neutral |
| In-group anchored to "las personas que viven en Santa Cruz" | NORM, CE | Ensures norms and efficacy refer to the same group as identification |
| Wording-version flag for ID | ID | In case cognitive interviews show that mainland-born residents reject the "Galapagueño/a" label |

## 4. Translation and pre-testing

1. **Forward translation** into Galápagos Spanish by a bilingual translator, reviewed by me (Galapagueña researcher) for local idiom (e.g., *"la parte alta"* for the highlands, *"DPNG"* for the GNPD).
2. **Independent back-translation** into English by a second translator who has not seen the original (Brislin, 1970). Discrepancies are reconciled by the team, and every change is logged.
3. **Cognitive interviews (8–15 residents)** across quota cells, using think-aloud and verbal probing (Willis, 2005). Priority probes:
   - the meaning of "Galapagueño/a";
   - *"kin"/familia* in RV4;
   - whether trust items assume personal contact;
   - whether collective efficacy is read as *ability* or *permission*;
   - whether attention checks feel like comprehension aids.
4. **Pilot (50–100 residents)**, excluded from the main sample. For each multi-item measure: α and ω (`psych`), item–total correlations and CFA (`lavaan`). Decision rules are listed in `Step_09/sampling_and_pilot_plan.md` §3.

## 5. Cross-group equivalence

Group comparisons are part of RQ1 (area, occupation, origin), so equivalence must be shown, not assumed:

- **Measurement invariance** is tested in multi-group CFA across area (Puerto Ayora vs. highlands), origin (island-born vs. mainland-born) and, where cell sizes allow, occupation. Observed group means are compared only if **metric and scalar invariance** hold (ΔCFI ≤ .01). Otherwise latent means or partial invariance are reported.
- **Expected sources of non-equivalence:**
  - the contested meaning of "Galapagueño/a" across origin groups;
  - different exposure to GNPD rules across occupations (fishers, farmers);
  - possible ceiling effects on RV in rural groups (Klain et al., 2017: mean 4.4 among Costa Rican farmers).
- **Enumerator effects.** Three enumerators administer the survey face to face. Enumerator ID is recorded and modeled as a random effect or fixed effect in sensitivity analyses.

---

### References

Bandura, A. (2000). Exercise of human agency through collective efficacy. *Current Directions in Psychological Science*, *9*(3), 75–78. https://doi.org/10.1111/1467-8721.00064

Brislin, R. W. (1970). Back-translation for cross-cultural research. *Journal of Cross-Cultural Psychology*, *1*(3), 185–216. https://doi.org/10.1177/135910457000100301

Cialdini, R. B., Reno, R. R., & Kallgren, C. A. (1990). A focus theory of normative conduct: Recycling the concept of norms to reduce littering in public places. *Journal of Personality and Social Psychology*, *58*(6), 1015–1026. https://doi.org/10.1037/0022-3514.58.6.1015

Clayton, S. (2003). Environmental identity: A conceptual and an operational definition. In S. Clayton & S. Opotow (Eds.), *Identity and the natural world* (pp. 45–65). MIT Press.

Eisinga, R., te Grotenhuis, M., & Pelzer, B. (2013). The reliability of a two-item scale: Pearson, Cronbach, or Spearman-Brown? *International Journal of Public Health*, *58*(4), 637–642. https://doi.org/10.1007/s00038-012-0416-3

ElHaffar, G., Durif, F., & Dubé, L. (2020). Towards closing the attitude-intention-behavior gap in green consumption: A narrative review of the literature and an overview of future research directions. *Journal of Cleaner Production*, *275*, 122556. https://doi.org/10.1016/j.jclepro.2020.122556

Fishbein, M., & Ajzen, I. (2010). *Predicting and changing behavior: The reasoned action approach*. Psychology Press.

Fritsche, I., Barth, M., Jugert, P., Masson, T., & Reese, G. (2018). A social identity model of pro-environmental action (SIMPEA). *Psychological Review*, *125*(2), 245–269. https://doi.org/10.1037/rev0000090

Johnson, & Reimer. (2023). *[Full reference to be completed by author.]*

Klain, S. C., Olmsted, P., Chan, K. M. A., & Satterfield, T. (2017). Relational values resonate broadly and differently than intrinsic or instrumental values, or the New Ecological Paradigm. *PLOS ONE*, *12*(8), e0183962. https://doi.org/10.1371/journal.pone.0183962

Leach, C. W., van Zomeren, M., Zebel, S., Vliek, M. L. W., Pennekamp, S. F., Doosje, B., Ouwerkerk, J. W., & Spears, R. (2008). Group-level self-definition and self-investment: A hierarchical (multicomponent) model of in-group identification. *Journal of Personality and Social Psychology*, *95*(1), 144–165. https://doi.org/10.1037/0022-3514.95.1.144

Michie, S., van Stralen, M. M., & West, R. (2011). The behaviour change wheel: A new method for characterising and designing behaviour change interventions. *Implementation Science*, *6*, 42. https://doi.org/10.1186/1748-5908-6-42

Postmes, T., Haslam, S. A., & Jans, L. (2013). A single-item measure of social identification: Reliability, validity, and utility. *British Journal of Social Psychology*, *52*(4), 597–617. https://doi.org/10.1111/bjso.12006

Stern, M. J., & Coleman, K. J. (2015). The multidimensionality of trust: Applications in collaborative natural resource management. *Society & Natural Resources*, *28*(2), 117–132. https://doi.org/10.1080/08941920.2014.945062

Veríssimo, D., Fiennes, S., & Dunn, M. (2024). Using digital mobile games to increase the support for nature conservation. *Conservation Science and Practice*, *6*(11), e13236. https://doi.org/10.1111/csp2.13236

Willis, G. B. (2005). *Cognitive interviewing: A tool for improving questionnaire design*. SAGE.
