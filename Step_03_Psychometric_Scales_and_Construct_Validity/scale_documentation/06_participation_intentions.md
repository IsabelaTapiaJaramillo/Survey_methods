# Scale documentation — Participation Intentions (INT)

*Status: **new** measure (behavior-specific intentions are always written for the target behavior; format follows Step 07 example B-04, Veríssimo et al., 2024). Wording and the 3-month time frame reviewed and approved by the author, 2026-11-10.*

- **Construct name:** Intentions to participate in giant tortoise conservation on Santa Cruz over the next three months. This is the main self-reported **dependent variable**.
- **Source / citation:** The structure follows behavioral-intention items (Fishbein & Ajzen, 2010) and the B-04 example in `Step_07/examples/` (intentions to donate, volunteer or support policy, rated on a 5-point likelihood scale). The specific behaviors reflect local forms of participation identified in my 2024 *Guardians of the Giant Tortoises* program.
- **Items (numbered):** Stem: *"In the next three months, how likely is it that you will…"* / *"En los próximos tres meses, ¿qué tan probable es que usted…"*

| # | Variable | English | Spanish draft |
|---|---|---|---|
| INT1 | `int_activity` | …take part in a community activity to care for giant tortoises? | …participe en una actividad comunitaria para cuidar a las tortugas gigantes? |
| INT2 | `int_monitor` | …join a community tortoise-monitoring day in the highlands? **(monitoring-day willingness; compared with actual sign-up and attendance in Step 07)** | …se una a un día comunitario de monitoreo de tortugas en la parte alta? |
| INT3 | `int_talk` | …talk with your family or neighbors about caring for tortoises? | …converse con su familia o vecinos sobre el cuidado de las tortugas? |
| INT4 | `int_report` | …report an injured or lost tortoise, or one in danger on a road, to the authorities? | …reporte a las autoridades una tortuga herida, perdida o en peligro en la carretera? |
| INT5 | `int_meeting` | …attend a meeting or event about tortoise conservation organized by community groups or the GNPD? | …asista a una reunión o evento sobre la conservación de tortugas organizado por grupos de la comunidad o la DPNG? |

- **Response format:** 5-point likelihood scale (1 = *Nada probable* / Very unlikely … 5 = *Muy probable* / Very likely).
- **Scoring rules:**
  - Mean of INT1–INT5 (range 1–5), computed if at least 4 of 5 items are answered.
  - **INT2 is also analyzed on its own** as the stated counterpart of the behavioral measure: high intention = 4–5 on INT2 (Step 07).
- **Known reliability:** New measure. The pilot target is α/ω ≥ .70, with a one-factor CFA.
- **Validation notes:**
  - Predictive validity is tested directly: INT2 → monitoring-day sign-up and attendance (Step 07). Intentions are expected to overestimate behavior (ElHaffar et al., 2020); the size of this gap is a finding, not a flaw.
  - INT5 mentions the GNPD. If its correlation with trust is much higher than that of the other INT items, I will report a sensitivity score without INT5.
- **Fairness / cross-group equivalence considerations:**
  - INT2 (highland monitoring) is easier for highland residents to act on; transport barriers are covariates.
  - INT4 depends on encountering tortoises, which is more common in the highlands and on farms. Area is in every model.
- **Role in this study:** **DV** for H1a–H1c (baseline) and H2b (before and after). Repeated in the second survey with identical wording, and asked of the new post-festival residents with the same wording.
