# Step 02 — Theory and Measurement Notes

*Filled-in version of `Step_02_Theory_Grounding_and_Construct_Conceptualization/notes.md` ("a short memo describing how theory informs measurement in this study").*

**Study:** Relational values, identity, trust and participation in giant tortoise conservation on Santa Cruz Island, Galápagos (ESPM 231, Assignment 2)
**Author:** Isabela Tapia-Jaramillo

---

## 1. Research question

> **RQ1.** How do residents' relational values, identification as Galapagueño/a and trust in conservation institutions **predict** their intentions to participate, and their actual participation, in tortoise conservation across social groups on Santa Cruz Island, Galápagos?

The study has one survey and no intervention, so results are described as **predictions or associations**, not causes (Step 04 checklist: "No causal inference about intervention effects is claimed").

## 2. The argument

Residents' participation in tortoise conservation is shaped by their relationships **with nature** (relational values), **with their group** (identification as Galapagueño/a) and **with conservation institutions** (trust in the Galápagos National Park Directorate, GNPD). Some residents care about tortoises but do not take part, because they distrust the institutions that run conservation or because of practical barriers. **Low participation should therefore not be read as lack of concern.**

## 3. Theoretical framework

- **Identity: Social Identity Theory** (Tajfel & Turner, 1979) and the **Social Identity Model of Pro-Environmental Action** (SIMPEA; Fritsche et al., 2018). People act on environmental issues *as group members*, so identifying as Galapagueño/a, a group for which giant tortoises are a symbol, should predict participation. SIMPEA also proposes that in-group norms and collective efficacy shape when identity leads to action. **This study tests the identity pathway only; norms and collective efficacy are left for future work.**
- **Relational values** (Chan et al., 2016): values about the *relationships* between people and nature (care, kinship, responsibility, identity), treated as a stable characteristic.
- **Trust in conservation institutions** (Stern & Coleman, 2015), with three types: **competence**, **personal relationships** and **rules and procedures**. Trust is the **moderator**. Caring (RV) and belonging (identity) lead to participation mainly when residents trust the institution through which participation happens.
- **Practical barriers** (work schedule, family care, transport, cost, not hearing in time) are measured and included as a **covariate** (barrier count). They play a role similar to perceived behavioral control in the Theory of Planned Behavior (Ajzen, 1991).

**Conceptual model** (moderation):

```
 Relational values ──┐
                     ├──► Intention (Y1) ··· correlation ··· Behavior (Y2)
 Identity ───────────┘         ▲                                ▲
                               │  trust moderates both paths    │
                      Trust in the GNPD ────────────────────────┘
 Covariates in both models: area, occupation, origin, age, gender, education, years in Galápagos, barrier count
```

## 4. Models

- **Model 1 (intention, linear regression):**
  Y1 = identity + trust + RV + **RV × trust** + **identity × trust** + covariates + ε
- **Model 2 (behavior, logistic regression; attended the monitoring day yes/no):**
  logit P(Y2 = 1) = the same predictors
- **Intention–behavior link:** the point-biserial correlation between Y1 and Y2, and a comparison of the predictors' coefficients across the two models.

**Focal terms:** RV (H1), identity (H2) and RV × trust (H3, the confirmatory moderation). Identity × trust is exploratory. The main effect of trust must be in the model for the interactions to be interpretable (Aiken & West, 1991); it is estimated and reported but carries no hypothesis. **Covariates** (no hypotheses; included so that focal estimates compare similar people, and reported to describe group differences): area, occupation (7 categories), origin, age, gender, education, years in Galápagos and practical-barrier count. In total, each model has 18 predictors.

## 5. Hypotheses *(reviewed by the author, 2026-11-11)*

- **H1.** Residents with stronger relational values will report stronger intentions to participate (H1a) and will be more likely to attend the monitoring day (H1b).
- **H2.** Residents who identify more strongly as Galapagueño/a will report stronger intentions (H2a) and will be more likely to attend (H2b).
- **H3 (moderation).** Trust in conservation institutions will moderate the association between relational values and participation: relational values will predict intentions (H3a) and attendance (H3b) more strongly among residents with higher trust. Residents with strong relational values but low trust will intend and participate less than those with strong relational values and high trust.
- **Exploratory.** Whether trust also moderates the association between identity and participation (identity × trust).
- **Descriptive.** The correlation between intentions and attendance, and the share of residents who intend to participate but do not attend (the intention–behavior gap; Step 07).

## 6. From constructs to measures

| Construct | Stability | Measure (Step 03 / Step 06) | Role |
|---|---|---|---|
| Relational values (Chan et al., 2016) | Stable | **Relational Values scale, 6 items (Klain et al., 2017): validated, from the Step 03 table** | Focal predictor |
| Identification as Galapagueño/a | Fairly stable | 4 items adapted from Leach et al. (2008) | Focal predictor |
| Trust in the GNPD (Stern & Coleman, 2015) | Mid-range | 6 items written for this study, 2 per trust type, with a "No sé" option | Focal predictor; moderator |
| Participation intentions (Y1) | Mid-range | 5 items written for this study, including willingness to join a monitoring day | **Outcome 1** |
| Monitoring-day participation (Y2) | Behavior | Sign-up and attendance (sign-in sheet; Step 07) | **Outcome 2** |
| Practical barriers | Situational | Checklist (7 options) | Covariate (barrier count); explains no-shows |
| Group and background | Stable | Area, occupation, origin, age, gender, education, years in Galápagos | Covariates |
| Unprimed associations and places | n/a | Word and image association, image heat map, one open question | Qualitative context |

---

### References

Aiken, L. S., & West, S. G. (1991). *Multiple regression: Testing and interpreting interactions*. Sage.

Ajzen, I. (1991). The theory of planned behavior. *Organizational Behavior and Human Decision Processes*, *50*(2), 179–211. https://doi.org/10.1016/0749-5978(91)90020-T

Chan, K. M. A., Balvanera, P., Benessaiah, K., Chapman, M., Díaz, S., Gómez-Baggethun, E., Gould, R., Hannahs, N., Jax, K., Klain, S., Luck, G. W., Martín-López, B., Muraca, B., Norton, B., Ott, K., Pascual, U., Satterfield, T., Tadaki, M., Taggart, J., & Turner, N. (2016). Why protect nature? Rethinking values and the environment. *Proceedings of the National Academy of Sciences*, *113*(6), 1462–1465. https://doi.org/10.1073/pnas.1525002113

Fritsche, I., Barth, M., Jugert, P., Masson, T., & Reese, G. (2018). A social identity model of pro-environmental action (SIMPEA). *Psychological Review*, *125*(2), 245–269. https://doi.org/10.1037/rev0000090

Klain, S. C., Olmsted, P., Chan, K. M. A., & Satterfield, T. (2017). Relational values resonate broadly and differently than intrinsic or instrumental values, or the New Ecological Paradigm. *PLOS ONE*, *12*(8), e0183962. https://doi.org/10.1371/journal.pone.0183962

Leach, C. W., van Zomeren, M., Zebel, S., Vliek, M. L. W., Pennekamp, S. F., Doosje, B., Ouwerkerk, J. W., & Spears, R. (2008). Group-level self-definition and self-investment: A hierarchical (multicomponent) model of in-group identification. *Journal of Personality and Social Psychology*, *95*(1), 144–165. https://doi.org/10.1037/0022-3514.95.1.144

Stern, M. J., & Coleman, K. J. (2015). The multidimensionality of trust: Applications in collaborative natural resource management. *Society & Natural Resources*, *28*(2), 117–132. https://doi.org/10.1080/08941920.2014.945062

Tajfel, H., & Turner, J. C. (1979). An integrative theory of intergroup conflict. In W. G. Austin & S. Worchel (Eds.), *The social psychology of intergroup relations* (pp. 33–47). Brooks/Cole.
