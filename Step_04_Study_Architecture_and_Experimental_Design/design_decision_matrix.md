# Design Decision Matrix

Use this matrix to select the appropriate study design given your construct type, research goal, and practical constraints. Circle or highlight the row that matches your situation and carry that design code into `study_design_checklist.md`.

### Key Terms
- **BACI (Before-After Control-Impact):** A classic experimental design where you measure both a treatment group (Impact) and a comparison group (Control) both *before* and *after* an intervention. This allows you to account for pre-existing differences and environmental changes over time.
- **ACI (After Control-Impact):** A design where measurements are only taken *after* the intervention across both a treatment and control group. Used when baseline (before) measurements are impossible or would tip off participants.

---

## Part 1: Construct × Design Compatibility

| Construct stability | Research goal | Intervention present? | Recommended design | Notes |
|---|---|---|---|---|
| Trait-like (values, worldviews) | Describe population distribution | No | **Cross-sectional** | Single snapshot is sufficient |
| Trait-like (values, worldviews) | Detect change over time | No | **Longitudinal panel (multi-year)** | Weeks are insufficient; plan for years |
| Attitude (policy support, wildlife attitudes) | Describe and predict | No | **Cross-sectional** | Add covariates for temporal context |
| ✅ **Attitude** | **Test causal effect of stimulus** | **Yes — pre-measurement feasible** | **BACI** ← *selected (randomized-encouragement RCT-BACI)* | Gold standard; randomize if possible. *This study: intentions, norms, collective efficacy and trust measured before and after; invitation randomized.* |
| Attitude | Test causal effect — pre-measurement impossible or sensitizing | Yes | **ACI / natural experiment** | Cannot estimate within-individual change |
| State (affect, mood, situational emotion) | Capture real-time fluctuation | No | **Experience sampling / diary** | Single survey misses variation |
| State | Test immediate effect of stimulus | Yes | **Within-subjects BACI** | Control order effects; short inter-trial interval |
| Mixed (attitude + affect) | Test stimulus effect | Yes | **BACI with immediate + delayed post** | Separate timing for state vs. attitude outcomes |

---

## Part 2: Intervention Design Decision Tree

```
Is there a stimulus / treatment?
│
├─ NO → Cross-sectional or longitudinal panel
│         └─ Is the construct stable (trait-like)?
│               ├─ YES → Single wave cross-sectional is valid
│               └─ NO  → Repeated measures panel required
│
└─ YES
      │
      ├─ Is pre-measurement feasible?
      │     │
      │     ├─ YES → BACI
      │     │         ├─ Can participants be randomly assigned? → RCT-BACI (strongest)
      │     │         └─ No random assignment possible?       → Quasi-experimental BACI
      │     │
      │     └─ NO (pre-measurement impossible OR would sensitize)
      │               └─ ACI / Natural experiment
      │                   └─ Argue baseline equivalence via matching or auxiliary data
      │
      └─ Is the expected change DURABLE or TRANSIENT?
              ├─ Durable  → Include delayed follow-up (T2 at ≥ 3 months)
              └─ Transient → Immediate post only; note decay expected
```

---

## Part 3: Within-Subjects vs. Between-Subjects Trade-offs

*Note on **Washout**: A washout period is a designated gap in time between treatments in a within-subjects design. It allows the psychological or behavioral effects of the earlier treatment to dissipate so they do not "carry over" and contaminate the measurement of the next treatment.*

| Criterion | Within-subjects | Between-subjects |
|---|---|---|
| Statistical power | Higher (participant = own control) | Lower (requires larger N) |
| Testing / carry-over effects | **Vulnerable** — must counterbalance or use washout | Not applicable |
| Attrition risk | Higher (multiple contacts required) | Lower |
| Demand characteristics | Higher (purpose more transparent) | Lower |
| Suitable for | State constructs, short studies | Trait/attitude constructs, sensitive topics |
| Recommended mitigation | Counterbalancing; filler tasks; long washout | Random assignment; covariate balance check |

---

## Part 4: Temporal Context Risk Assessment

**How to use this section:** Human attitudes and behaviors do not exist in a vacuum; they interact closely with transient environmental and social events. If external events—like a highly publicized local human-wildlife conflict or unseasonable weather—coincide with your data collection, they can severely confound the signals you are trying to measure. 
Use the table below BEFORE launch to actively map out these risks. Rate each one based on its likelihood to overlap with your study. If you mark any factor as Medium or High, commit to the recommended action to either statistically control for the event (via covariates) or chronologically avoid it.

Rate each factor Low / Medium / High for your data collection window.

| Factor | Risk level | Action if Medium/High |
|---|---|---|
| Data collection during hunting / culling season | **Low–Medium.** There is no tortoise hunting, but GNPD invasive-species control (e.g., feral animal or rodent eradication) may run in June–Aug. The garúa (cool, dry) season is also when tortoises move into the highlands and onto farms, so human–tortoise contact and farm conflicts (fence and crop damage, road encounters) peak during fieldwork. | Record GNPD control campaigns and season as covariates. Ask about recent tortoise encounters on the respondent's property or road. All waves fall in the same season, so season is held constant across the panel. |
| Active depredation conflict or rewilding event nearby | **Medium.** Farmer–tortoise conflicts in the highlands; possible tortoise reintroduction or translocation news from other islands. | Log events with dates and parish. Add an event-proximity covariate (event in own parish within 4 weeks before the interview). |
| National or regional media spike on focal species | **Medium.** Tortoise **trafficking or poaching** news (smuggling seizures at airports) recurs and draws national attention. | Log news items (national press, *El Colono*, local radio and Facebook pages) and Google Trends for "tortugas Galápagos". Add a media-spike indicator for interview dates. |
| Extreme weather affecting outdoor activity | **Medium.** **Floods** and other shocks (heavy rain, El Niño-related events, landslides on highland roads) can affect mood, access to the highlands and attendance at the monitoring day. | Record daily weather (INAMHI / Charles Darwin Station). The survey asks about recent shocks such as floods. If a major event happens, add a wave-period indicator. |
| Major policy announcement (listing, delisting, quota change) | **Medium.** Possible announcements on the Special Law, the park entry fee or tourism quotas, GNPD management-plan changes, or new rules on tortoise movement across farms. | Log announcements. Flag affected interview windows. Because trust is an outcome, run a sensitivity analysis excluding interviews within 2 weeks after a major announcement. |

**Overall temporal-context risk: Medium.** All events, shocks such as floods, trafficking or poaching news, and policy announcements are recorded during each wave in `temporal_context_log.md` and used as covariates.

---

## Part 4b: Discrete Choice Experiments (DCE) — a stated-preference alternative to BACI

**When to use:** DCEs ask respondents to repeatedly choose between hypothetical
alternatives (e.g., management scenarios, land-use options, policy packages)
that vary systematically across attributes and levels. Unlike a single-item
willingness-to-pay question, a DCE decomposes preferences into the
contribution of each attribute (e.g., cost, distance, species affected),
and is well suited to socio-ecological trade-off questions (habitat
restoration design, protected-area management, payment-for-ecosystem-service
scheme design) where no real-world BACI intervention is feasible.

| Consideration | Guidance |
|---|---|
| Attribute and level selection | Ground in qualitative/expert pre-work (focus groups, Step 1) before fielding; over-large attribute sets increase cognitive burden and attribute non-attendance |
| Attribute non-attendance (ANA) | Respondents may ignore one or more attributes when making choices, biasing willingness-to-pay estimates if unaddressed; test for and model ANA explicitly (Notaro et al., 2022) |
| Experimental design | Use an efficient (D-optimal or Bayesian-efficient) design rather than a full factorial to keep the number of choice tasks tractable |
| Model choice | Conditional/mixed logit is standard; report willingness-to-pay space vs. preference space estimates and justify the choice |
| Review of applications | See Cop & Njavro (2022) for a systematic review of DCE applications specifically in agricultural/environmental risk management, useful for benchmarking attribute choices against the published literature |

---

## Part 5: Selected Design Summary (fill in)

| Field | Your entry |
|---|---|
| Focal constructs | **Outcomes (before and after):** participation intentions (including monitoring-day willingness), perceived in-group norms, collective efficacy, trust in the GNPD. **Moderators and predictors (baseline only):** relational values, identification as Galapagueño/a. **Behavior:** festival attendance (voucher codes plus self-report); monitoring-day sign-up and attendance (sign-in sheet). **Covariates:** practical barriers, area, occupation, origin, demographics, recent shocks. |
| Stability classification | **Mixed.** *Trait-like / stable:* relational values, identification. *Attitude / mid-range:* intentions, norms, collective efficacy, trust. *Behavior:* attendance, sign-up. |
| Intervention present | **Yes.** Festival de las Tortugas Gigantes: one day in Puerto Ayora, June–Aug 2028, co-organized with the GNPD, the Municipality of Santa Cruz, Cooking Sections and local partners. The **randomized** element is a personal invitation card plus snack voucher. |
| Pre-measurement feasible | **Yes.** First survey 2–4 weeks before the festival. |
| Design type selected | **Mixed:** between-subjects (randomly invited vs. not invited; 1:1, stratified by area × occupation) × within-subjects (the same residents before and after). BACI logic with **randomized encouragement** (Gerber & Green, 2012). Plus ~100 **new** post-festival residents (an after-only comparison) to describe the wider community and check for testing effects. |
| Expected change type | **Transient to short-term** for norms, collective efficacy and intentions. Durable change (> 3 months) is **not** tested. This is acknowledged as a limitation, and a delayed follow-up is recommended for future work. |
| Post-measurement occasions | **T1:** second survey, 2–6 weeks after the festival (repeats only the before/after measures, plus attendance with a check question and festival experience). **T2 (behavioral):** community tortoise-monitoring day in the highlands, ~2 weeks after T1 (sign-up at T1; attendance from the sign-in sheet). |
| Temporal context risks | **Medium** (see Part 4): floods and other shocks, trafficking or poaching news, policy announcements, highland farm–tortoise contact in the garúa season. All are recorded as covariates. |
| Pre-registration platform | **OSF** (Step 05), before the first survey begins. |

**Causal logic.** (1) The random invitation gives an **intention-to-treat** estimate. (2) Using the invitation as an **instrument** for attendance estimates the effect of attending among compliers (Angrist et al., 1996). (3) The attendee vs. non-attendee **ANCOVA** (controlling for baseline) is weaker, because attendance is self-selected, and is interpreted alongside (1) and (2).

---

*Cross-reference: `study_design_checklist.md` · `design_docs/randomization_plan.md` · `../Step_05_PreRegistration/` · `../Step_09_Power_and_Sampling/`*

*References: Notaro, De Salvo, & Raffaelli (2022); Cop & Njavro (2022); Angrist, Imbens, & Rubin (1996); Gerber & Green (2012).*
