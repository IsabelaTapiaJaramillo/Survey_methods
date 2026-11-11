# Scale documentation — Practical Barriers Checklist (BAR)

*Status: **new** formative checklist (an index, not a reflective scale; reliability coefficients do not apply).*

- **Construct name:** Practical barriers to participating in tortoise conservation activities. This works like the TPB's perceived behavioral control, but it records concrete constraints rather than beliefs.
- **Source / citation:** The categories (work schedule, family care, transport, cost) come from the Assignment 1 problem analysis; "not hearing about activities in time" was added and approved by the author. They map onto the "opportunity" component of COM-B (Michie et al., 2011).
- **Items (numbered):** *"Which of the following make it hard for you to take part in tortoise conservation activities? (Select all that apply)"* / *"¿Cuáles de las siguientes cosas le dificultan participar en actividades de conservación de tortugas? (Puede marcar varias)"*

| # | Variable | English | Spanish draft |
|---|---|---|---|
| BAR1 | `bar_work` | My work schedule | Mi horario de trabajo |
| BAR2 | `bar_care` | Caring for children or other family members | El cuidado de hijos u otros familiares |
| BAR3 | `bar_transport` | Transport (getting to the activity) | El transporte (llegar a la actividad) |
| BAR4 | `bar_cost` | Cost (money for transport, food, lost income) | El costo (dinero para transporte, comida, ingresos que dejo de ganar) |
| BAR5 | `bar_info` | I don't hear about activities in time | No me entero a tiempo de las actividades |
| BAR6 | `bar_other` | Other: ______ | Otro: ______ |
| BAR7 | `bar_none` | Nothing makes it hard for me *(exclusive option)* | Nada me lo dificulta *(opción excluyente)* |

- **Response format:** Multiple-select (check all that apply). BAR7 is exclusive, so it cannot be combined with other options. Each option is stored as a binary variable.
- **Scoring rules:** Barrier count = BAR1 + … + BAR6 (0–6). Each binary barrier is also kept for descriptive use and for the follow-up call (Step 07).
- **Known reliability:** Not applicable (formative index; the items are not expected to correlate). Stability can be checked for no-shows by comparing survey answers with the follow-up call.
- **Validation notes:** "Other" text is coded inductively. Categories mentioned by ≥ 5% of the pilot are added as options in the main survey.
- **Fairness / cross-group equivalence considerations:** BAR2 (care) is expected to be reported more by women, and BAR3 (transport) more by Puerto Ayora residents for highland activities. These are substantive differences, not bias. They motivate the free transport and the family-friendly design of the monitoring day (Step 07).
- **Role in this study:** **Covariate** (barrier count) in both models, so the analysis can separate residents who did not want to take part from those who could not. The individual barriers are also described and compared across groups. The same categories structure the follow-up call to people who sign up for the monitoring day but don't attend.
