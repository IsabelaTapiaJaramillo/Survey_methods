# Survey Design Matrix — RQ1: Relational Values, Identity, Trust and Participation
## For Socio-Ecological and Environmental Research

> **Instructions for use.**  
> Fill in every row before building your survey instrument. If you cannot complete the "Research Question" or "Analytic Use" columns for an item, that item should be cut or revised. This matrix is a living document — update it after cognitive interviews, piloting, and peer review.  
> Save a dated version (`survey_matrix_v1_YYYY-MM-DD.md`) at each major revision.

*ESPM 231 Assignment 2 (RQ1 only), Isabela Tapia-Jaramillo. Version v0.2, 2026-11-11. Full wording (English, with Spanish drafts) and scoring for every multi-item measure are in [`../Step03_scales/scale_documentation/`](../Step03_scales/scale_documentation/).*

**Question types used (6 of the 11 in `question_types_reference.md`):** word association · image association · image heat map · Likert-scale items · multiple choice (single and multi-select) · open-ended short response.

---

## Part 1 — Study Overview

| Field | Your entry |
|---|---|
| **Study title** | Relational values, identity, trust and participation in giant tortoise conservation on Santa Cruz Island, Galápagos |
| **Lead researcher** | Isabela Tapia-Jaramillo (UC Berkeley; Galapagueña researcher) |
| **Date (version)** | 2026-11-11 (v0.2: RQ1 only) |
| **Study site / population** | Santa Cruz Island, Galápagos, Ecuador: Puerto Ayora and the highland parishes of Bellavista and Santa Rosa |
| **Target population** | Adults (18+) living on Santa Cruz |
| **Survey mode** | ☐ Online   ☐ Paper   ☒ Face-to-face (tablet; KoboToolbox; in Spanish)   ☐ Phone   ☐ Mixed. *(A short phone or WhatsApp follow-up call goes to people who sign up for the monitoring day but do not attend.)* |
| **Sampling strategy** | Non-probability **quota** sampling by area × occupation × origin. Door to door in randomly chosen blocks of Puerto Ayora and along highland roads, plus farmers' and fishers' associations (and schools, if needed to fill the education quota). **Recruit 450 for 425 complete surveys** (Step 09). |
| **Estimated duration** | **25 min** (5 min introduction, context and consent, plus 20 min of questions) |
| **Primary research questions** | RQ1: How do residents' relational values, identification as Galapagueño/a and trust in conservation institutions predict their intentions to participate, and their actual participation, in tortoise conservation across social groups on Santa Cruz Island, Galápagos? |
| **Pre-registration DOI / link** | OSF, to be registered before data collection (Step 05) |
| **IRB / Ethics approval #** | UC Berkeley CPHS: *pending*. Galápagos research permit (GNPD): *pending* |
| **Stimulus materials (if any)** | Two photos (a giant tortoise; a park ranger); a map of Santa Cruz for the heat map; the monitoring-day invitation |

---

## Part 2 — Full Item Matrix

*IV = predictor (independent variable), DV = outcome (dependent variable). "Version" = form version (which photo comes first; see `../Step04_design/randomization_plan.md`).*

### Block 0 — Introduction, consent and screener · 5 min

| Block ID | Item text (verbatim or draft) | Research Question(s) addressed | Theoretical Construct | Variable Role | Scale / Prior Source | Response Format | Placement / Order Notes | Justification / Cut rationale |
|---|---|---|---|---|---|---|---|---|
| B0-01 | Introduction: who we are (UC Berkeley, **independent of the GNPD**), the purpose of the study, duration, and payment | n/a | n/a | ☒ Not in analyses | Step 08 consent template | Read aloud | First | Informed consent. Independence from the GNPD reduces pressure on the trust answers. |
| B0-02 | Informed consent: "Do you agree to take part?" | n/a | n/a | ☒ Not in analyses | Step 08 | Yes / No (No → end) | After B0-01 | Ethics |
| B0-03 | "Are you 18 or older?" · "Do you live on Santa Cruz?" | Eligibility | n/a | ☒ Not in analyses | n/a | Yes / No (No → end) | Screener | Inclusion criteria |
| B0-04 | "Where do you live?" Puerto Ayora / Bellavista / Santa Rosa / other part of Santa Cruz | RQ1 | Group: area | ☒ Covariate | Step 06 demographic bank | Multiple choice | Screener (quota) | Quota variable and model covariate |
| B0-05 | "What is your main occupation?" Farming / fishing / tourism (hotels, restaurants, boats, agencies) / naturalist guide / conservation & research (GNPD, Charles Darwin Foundation, NGOs, universities) / education & public services (public **or private** schools, health, municipality, other government offices) / other (retired, students, commerce, trades, unemployed…) | RQ1 | Group: occupation | ☒ Covariate | Categories set by the author (2026-11-10) | Multiple choice (7 options) | Screener (quota) | Classified by the **type of work**, not the employer |
| B0-06 | "Do you work for the Galápagos National Park Directorate (DPNG)?" | RQ1 | n/a | ☒ Covariate (sensitivity flag) | New | Yes / No | After B0-05 | Results are checked with and without GNPD staff, since for them the trust items describe their own employer |
| B0-07 | "Where were you born?" Galápagos / mainland Ecuador / another country | RQ1 | Group: origin | ☒ Covariate | n/a | Multiple choice | Screener (quota) | Quota variable; part of what "Galapagueño/a" means |
| B0-08 | *(Auto)* Enumerator ID, date, start time, `participant_id`, `form_version` | n/a | n/a | ☒ Covariate (enumerator; version) | `randomize_form_versions.R` | Auto | Hidden | Interviewer and order effects. **Names and phone numbers are stored in a separate file.** |

### Block 1 — Word and image association · 2.5 min

| Block ID | Item text | Research Question(s) | Theoretical Construct | Variable Role | Scale / Source | Response Format | Placement Notes | Justification |
|---|---|---|---|---|---|---|---|---|
| B1-01 | "What are three words that come to mind when you think of **giant tortoises**?" | RQ1 | Unprimed associations (relationship with nature) | ☒ Qualitative | Word association (Boren & Echeverri, 2025) | 3 short text boxes | **First** substantive block, so answers are not primed | Spontaneous meanings before any scale item |
| B1-02 | [Photo of a giant tortoise] "What three words do you associate with this image?" | RQ1 | Relationship with nature | ☒ Qualitative | Image association (Langhans et al., 2025) | 3 short text boxes | Photo order set by form version | Visual, affective associations |
| B1-03 | [Photo of a park ranger] "What three words do you associate with this image?" | RQ1 | Relationship with institutions | ☒ Qualitative | Image association | 3 short text boxes | Photo order set by form version | Unprimed counterpart to the trust items |

### Block 2 — Image heat map · 3 min

| Block ID | Item text | Research Question(s) | Theoretical Construct | Variable Role | Scale / Source | Response Format | Placement Notes | Justification |
|---|---|---|---|---|---|---|---|---|
| B2-01 | "On this map of Santa Cruz, tap the places where you **see giant tortoises**." (up to 5 taps) | RQ1 | Human–tortoise contact | ☒ Qualitative / spatial | Image heat map (Prober et al., 2019); social cartography (*mapeo social*); participatory mapping on Isabela (Tapia-Jaramillo, 2022) | Taps on an offline map | After Block 1 | Where people meet tortoises |
| B2-02 | "Now tap the places where you **take part in tortoise conservation activities** (if any)." Option: "I don't take part in any" | RQ1 | Current participation (spatial) | ☒ Covariate (prior participation) / spatial | Same | Taps, plus a "none" option | After B2-01 | Shows access gaps between where tortoises are and where people take part |

### Block 3 — Likert items · 5.5 min · 22 items, 5-point

*Sub-block order is the same for everyone: INT → ID → RV → TRUST (outcome first; trust last because it is the most sensitive). Items within each sub-block appear in the same order for everyone.*

| Block ID | Item text | Research Question(s) | Theoretical Construct | Variable Role | Scale / Source | Response Format | Placement Notes | Justification |
|---|---|---|---|---|---|---|---|---|
| B3-01 to B3-05 | INT1–5. "In the next three months, how likely is it that you will…" (1) take part in a community activity to care for giant tortoises; **(2) join a community tortoise-monitoring day in the highlands**; (3) talk with family or neighbors about caring for tortoises; (4) report an injured, lost or endangered tortoise to the authorities; (5) attend a meeting or event about tortoise conservation | RQ1 (H1a, H2a, H3a, H4a; descriptive gap) | Participation intentions | ☒ **DV (Y1)** | New (`04_participation_intentions.md`); format follows Step 07 B-04 | 5-point likelihood | First sub-block | Outcome 1. INT2 is the stated counterpart of the observed behavior. |
| B3-AC1 | "To make sure the tablet is recording answers correctly, please choose **'Agree'** for this statement." | n/a | n/a | ☒ Not in analyses (QC) | Template Part 8, Type 1 | 5-point agree | After INT (**first third**) | Attention check framed as a comprehension aid |
| B3-06 to B3-09 | ID1–4. (1) I feel a bond with other Galapagueños; (2) I am glad to be Galapagueño/a; (3) being Galapagueño/a is an important part of how I see myself; (4) I have a lot in common with the average Galapagueño/a | RQ1 (H2; identity × trust exploratory) | Identification as Galapagueño/a | ☒ **IV** | Adapted from Leach et al. (2008) | 5-point agree | After INT | Focal predictor |
| B3-10 to B3-15 | RV1–6. Klain et al. (2017) relational statements: *comm, health, iden, kin, wild, other* (verbatim in `01_relational_values.md`) | RQ1 (H1, H3) | Relational values | ☒ **IV** | **Validated: Relational Values scale (Klain et al., 2017), Step 03 table** | 5-point agree | After ID | The required validated scale |
| B3-16 to B3-21 | TR1–6. GNPD competence (2), personal relationships (2), rules and procedures (2) (verbatim in `03_trust_gnpd.md`) | RQ1 (H4; H3: moderator) | Trust in conservation institutions | ☒ **IV / moderator** | New, from Stern & Coleman (2015) | 5-point agree, plus "No sé" (coded missing) | **Last** sub-block. Reminder first: "Your answers are never shared with the GNPD." | Focal moderator |

### Block 4 — Multiple-choice items · 3 min · ~10 items

| Block ID | Item text | Research Question(s) | Theoretical Construct | Variable Role | Scale / Source | Response Format | Placement Notes | Justification |
|---|---|---|---|---|---|---|---|---|
| B4-01 | "In the past 12 months, have you taken part in any of these?" Tortoise monitoring or census · releases or repatriation events · clean-ups in tortoise areas · talks or workshops · *Guardians of the Giant Tortoises* or similar · none | RQ1 | Past participation | ☒ Covariate (descriptive) | New | Multi-select ("none" is exclusive) | After Likert | Describes past behavior; checks B2-02 |
| B4-02 | "How often do you see giant tortoises in your daily life?" Never / a few times a year / monthly / weekly / daily | RQ1 | Contact with the focal species | ☒ Covariate (descriptive) | New | Single choice | After B4-01 | Balance check across form versions |
| B4-03 | BAR1–7. "Which of the following make it hard for you to take part in tortoise conservation activities?" Work schedule / caring for children or family / transport / cost / don't hear about activities in time / other / nothing | RQ1 | Practical barriers | ☒ **Covariate** (barrier count) | New (`05_practical_barriers.md`) | Multi-select ("nothing" is exclusive) | Middle of the block | Separates *can't* from *won't* |
| B4-AC2 | "In the past month, have you traveled to the Moon?" No / yes, once / yes, several times | n/a | n/a | ☒ Not in analyses (QC) | Template Part 8, Type 2 | Single choice (correct: No) | **Final third** | Second attention check, introduced as "checking the tablet works" |
| B4-04 | "In the past month, has your household been affected by any of these?" Floods / heavy rain or landslides on your road / loss of work or income / illness in the family / none | RQ1 | Recent shocks (temporal context) | ☒ Covariate (sensitivity) | Step 04 Part 4 | Multi-select | Before demographics | Shocks can lower participation regardless of motivation |
| B4-05 | "How many years have you lived in Galápagos?" | RQ1 | Residence | ☒ Covariate | Step 06 demographic bank | Number | Background | Model covariate |
| B4-06 | "What is your age?" | RQ1 | Demographic | ☒ Covariate | Step 06 demographic bank | Number | **Sensitive items last** | Model covariate |
| B4-07 | "What is your gender identity?" Woman / man / non-binary / prefer to self-describe / prefer not to say | RQ1 | Demographic | ☒ Covariate | Step 06 demographic bank | Single choice, inclusive options | Last | Model covariate |
| B4-08 | "What is the highest level of education you have completed?" (Ecuadorian categories; prefer not to say) | RQ1 | Demographic | ☒ Covariate | Step 06 demographic bank | Single choice | Last | Model covariate |

### Block 5 — Open question · 1.5 min

| Block ID | Item text | Research Question(s) | Theoretical Construct | Variable Role | Scale / Source | Response Format | Placement Notes | Justification |
|---|---|---|---|---|---|---|---|---|
| B5-01 | "What would make it easier for you to take part in tortoise conservation?" | RQ1 | Barriers and enablers (resident voice) | ☒ Qualitative | Open-ended short response (Echeverri et al., 2019) | Short text (≤ 300 characters; written down by the enumerator) | Last question before the invitation | Coded into themes. *Note: Part 9 recommends open-ended before closed items on the same topic; cognitive interviews will test whether to move it before B4-03.* |

### Block 6 — Monitoring-day invitation (behavior beyond self-report; Step 07) · 2 min

| Block ID | Item text | Research Question(s) | Theoretical Construct | Variable Role | Scale / Source | Response Format | Placement Notes | Justification |
|---|---|---|---|---|---|---|---|---|
| B6-01 | Invitation to a **real community tortoise-monitoring day** in the highlands, about 2 weeks later (free transport from Puerto Ayora with pickup points in Bellavista and Santa Rosa; breakfast and lunch; families welcome, with a children's activity; unpaid). "Would you like to sign up?" Yes / No → if yes: choice of 2 weekend dates × morning/afternoon; pickup point; consent to a WhatsApp or text reminder two days before | RQ1 (H1b, H2b, H3b, H4b; descriptive gap) | **Actual participation** (sign-up) | ☒ **DV (Y2, step 1)** | Step 07 (example B-02, sign-ups) | Yes / No; date and time; pickup point | **Last**, after all self-report items | A real choice that costs time. Attendance on the day (sign-in sheet) is Y2. |
| B6-02 | Payment for the survey (everyone, equal amount; not tied to signing up) | n/a | n/a | ☒ Not in analyses | Step 08 | n/a | Last | Ethics |

---

## Part 3 — Variable Summary Table

*Populate after the full matrix is complete. Every variable in your analysis plan must appear here.*

| Variable name | Role | Type | Block ID(s) | Scale/range | Missing data plan | Notes |
|---|---|---|---|---|---|---|
| `int_mean` | ☒ DV (Y1) | ☒ Continuous | B3-01–05 | 1–5 | Score if ≥ 4/5 items | Model 1 outcome |
| `int_monitor` | ☒ DV (stated counterpart) | ☒ Ordinal | B3-02 | 1–5 | Item-level | Compared with Y2 |
| `attended_monitor` | ☒ DV (Y2) | ☒ Binary | Sign-in sheet (Step 07) | 0/1 | Not on sheet = 0 | Model 2 outcome |
| `signed_up` | ☒ DV (secondary) | ☒ Binary | B6-01 | 0/1 | No answer = 0 | Intermediate step |
| `id_mean` | ☒ IV | ☒ Continuous | B3-06–09 | 1–5 | Score if ≥ 3/4 items; multiple imputation (MI) | Focal |
| `rv_mean` | ☒ IV | ☒ Continuous | B3-10–15 | 1–5 | Score if ≥ 5/6 items; MI | Focal |
| `trust_mean` | ☒ IV / moderator | ☒ Continuous | B3-16–21 | 1–5 | "No sé" = missing; score if ≥ 4/6 items; MI | Focal; mean-centered for interactions |
| `area` | ☒ Covariate | ☒ Binary | B0-04 | Puerto Ayora / highlands | None (screener) | |
| `occupation` | ☒ Covariate | ☒ Nominal | B0-05 | 7 levels (6 dummies) | None (screener) | |
| `origin` | ☒ Covariate | ☒ Binary | B0-07 | Galápagos / mainland (other countries reported separately) | None | |
| `age`, `years_gal` | ☒ Covariate | ☒ Continuous | B4-06, B4-05 | years | MI | |
| `gender`, `education` | ☒ Covariate | ☒ Nominal / ordinal | B4-07, B4-08 | categories | "Prefer not to say" kept as its own level | |
| `bar_count` (and `bar_*`) | ☒ Covariate | ☒ Count / binary | B4-03 | 0–6 | Item-level | |
| `gnpd_staff` | ☒ Covariate (sensitivity) | ☒ Binary | B0-06 | 0/1 | n/a | Analyses with and without |
| `form_version` | ☒ Covariate (sensitivity) | ☒ Binary | B0-08 | T (tortoise first) / R (ranger first) | n/a | Photo-order effects |
| `enumerator` | ☒ Random effect | ☒ Nominal | B0-08 | E1–E3 | n/a | Interviewer effects |
| `prior_particip`, `contact_freq`, `shock_*` | ☒ Covariate (descriptive / sensitivity) | ☒ Binary / ordinal | B4-01, B4-02, B4-04, B2-02 | | Item-level | |
| `ac_pass` | QC | ☒ Binary | B3-AC1, B4-AC2 | 0/1 | n/a | Pre-registered exclusion: fail **both** checks |
| Associations, open answer, map taps | ☒ Qualitative | Text / spatial | B1, B2, B5 | | | Themes; heat maps |

---

## Part 4 — Respondent Burden Audit

| Survey block | Estimated time | Cumulative time |
|---|---|---|
| Block 0 — Introduction, context, consent, screener | 5 min | 5 min |
| Block 1 — Word and image association | 2.5 min | 7.5 min |
| Block 2 — Image heat map | 3 min | 10.5 min |
| Block 3 — 22 Likert items (21 + AC1), ~15 s each, read aloud | 5.5 min | 16 min |
| Block 4 — ~10 multiple-choice items | 3 min | 19 min |
| Block 5 — One open question | 1.5 min | 20.5 min |
| Block 6 — Monitoring-day invitation, sign-up, payment | 2 min | 22.5 min |
| Buffer | 2.5 min | 25 min |
| **Total** | **25 min** (20 min of questions) | |

**Benchmark targets:**
- Online / self-administered: ≤ 15 min preferred; ≤ 20 min acceptable
- Face-to-face with enumerator: ≤ 35 min → **within target (25 min)**
- Phone: ≤ 10 min → the no-show follow-up call is ≤ 5 min
- With multimedia stimuli (photos, audio, video): add ~1–2 min per stimulus block → included in Block 1

---

## Part 5 — Item-level QC Checklist

For every item in the matrix, verify:

- [x] The item maps to at least one research question
- [x] The item uses an established scale OR construction rationale is documented *(RV validated; ID adapted; TRUST, INT and BAR new, with rationale in `../Step03_scales/`)*
- [x] The response options are **exhaustive** *("other" and "none" options; "No sé" for trust)*
- [x] The response options are **mutually exclusive** *(exclusive "none" and "nothing" options; occupation classified by type of work)*
- [x] The item is free of **double-barrelled** language *(RV3 and RV4 are long verbatim Klain items, kept unchanged; to be checked in cognitive interviews)*
- [x] The item avoids **leading** or **loaded** phrasing
- [ ] The item is readable at the education level of the target population *(pending cognitive interviews with 8 residents; all items read aloud with show cards)*
- [x] Sensitive items (income, race/ethnicity, gender, health) are placed at the **end** *(income and ethnicity not asked)*
- [x] Categories for sensitive items include **inclusive options**
- [x] Open-ended items have a clear **character limit** and a purpose that justifies the added burden
- [x] If order is unconstrained, **randomization** within the block is planned and pre-registered *(photo order randomized by form version, `../Step04_design/randomization_plan.md`; item order within scales is kept the same for everyone)*

**Study-specific checks:**
- [x] ≥ 2 attention checks, framed as comprehension aids (AC1 first third, AC2 final third)
- [x] No questions about anyone's own illegal activity (e.g., poaching)
- [x] Names and phone numbers are stored separately; the GNPD never sees individual data
- [x] The monitoring-day invitation comes last, so it cannot affect self-reports

---
## Part 6 — Question-format Decision Guide

Use the table below to select the appropriate format for each item.

| Format | Best for | Burden | Inferential strength | Notes |
|---|---|---|---|---|
| **Likert scale** (agree–disagree, 5–7 pt) | Attitudes, beliefs, values | Low | Moderate–high | Use odd-point scale unless mid-point is theoretically meaningful to exclude |
| **Semantic differential** | Bipolar affective dimensions (e.g., like/dislike) | Low | Moderate–high | Anchors must be true opposites |
| **Ranking** | Relative preference among a small set (≤ 7 items) | Moderate | Moderate | Respondents cannot express equal preference; avoid for > 7 items |
| **Slider / Visual Analogue Scale** | Continuous preference, willingness to pay | Low–moderate | High | Requires digital delivery; avoids artificial ordinality |
| **Multiple-choice (single answer)** | Demographics, category membership | Very low | Categorical only | Ensure "other" + "prefer not to say" options |
| **Multiple-select (check all that apply)** | Behaviours, multiple identities | Low | Categorical only | Avoid if items are not independent |
| **Word association / free-list** | Cultural salience, mental models | Moderate | Qualitative | Analyse with cultural consensus or salience indices |
| **Short text (1–3 sentences)** | Mechanism, justification | High | Qualitative | Use only where depth is essential |
| **Open-ended (long text)** | Exploration, narrative | Very high | Qualitative | Consider alternatives; causes dropout |
| **Attention check** | Data quality / bot detection | Very low | Procedural | Frame as comprehension aid with community partners |
| **Forced-choice / best–worst scaling** | Preference without scale use bias | Moderate | High | Useful for cross-cultural comparisons |

---

## Part 7 — Demographic Item Bank

*Copy relevant items into your matrix. Adapt categories to your study population.*

### Age
> "What is your age?" _____ years  
> *Or:* ☐ 18–24  ☐ 25–34  ☐ 35–44  ☐ 45–54  ☐ 55–64  ☐ 65+  ☐ Prefer not to say

### Gender
> "What is your gender identity?"  
> ☐ Woman  ☐ Man  ☐ Non-binary / gender non-conforming  ☐ Two-Spirit  ☐ Prefer to self-describe: _____  ☐ Prefer not to say

### Race / Ethnicity *(adapt to country / context)*
> "Which of the following best describes your racial or ethnic background? (Select all that apply)"  
> [Add country-appropriate categories] ☐ Prefer not to say

### Education
> "What is the highest level of education you have completed?"  
> ☐ No formal schooling  ☐ Some primary school  ☐ Completed primary  ☐ Some secondary  ☐ Completed secondary  ☐ Vocational / technical  ☐ Some university  ☐ University degree  ☐ Graduate degree  ☐ Prefer not to say

### Household income *(sensitive — place at end; consider necessity)*
> "Which range best describes your total annual household income (before taxes)?"  
> [Insert country-appropriate ranges]  ☐ Prefer not to say

### Place of residence / tenure
> "Do you currently live in [community/region]?"  ☐ Yes  ☐ No  
> "How many years have you lived here?" _____ years

### Occupation / Livelihood
> "Which of the following best describes your primary occupation?"  
> ☐ Agriculture / farming  ☐ Fishing / aquaculture  ☐ Forestry  ☐ Tourism / hospitality  ☐ Government / public sector  ☐ NGO / non-profit  ☐ Business / commerce  ☐ Student  ☐ Retired  ☐ Unemployed / seeking work  ☐ Other: _____  ☐ Prefer not to say

### Proximity / dependence on natural resources *(socio-ecological studies)*
> "How much does your household depend on [forest / river / land] for your income or food?"  
> ☐ Not at all  ☐ A little  ☐ Somewhat  ☐ A lot  ☐ Almost entirely

---

## Part 8 — Attention Check Examples

*Include ≥ 2 attention checks in surveys > 10 min. Place one in the first third and one in the final third.*

### Type 1 — Instructed response item
> *"This is a question to make sure you are reading carefully. Please select **'Somewhat agree'** for this item."*  
> ☐ Strongly disagree  ☐ Disagree  ☐ Neutral  ☐ Somewhat agree  ☐ Strongly agree

### Type 2 — Screener / nonsense item
> *"In the past week, how often did you fly to the moon?"*  
> ☐ Never  ☐ Once or twice  ☐ Several times  ☐ Daily  *(correct answer: Never)*

### Type 3 — Speeder flag *(platform-level, not item-level)*
> Flag responses with total completion time < [expected time × 0.4] for review.

> **Note for community-based research:** Frame attention checks as comprehension aids:  
> *"We include a few questions like this to make sure the survey is working correctly on your device."*  
> Do not frame them as "traps" or imply distrust. See Abbey & Meloy (2017).

---

## Part 9 — Placement and Order Principles

| Principle | Rule | Rationale |
|---|---|---|
| Sensitive demographics last | Place age, gender, income, race/ethnicity at the end | Reduces social identity threat (Steele & Aronson, 1995; Danaher & Crandall, 2008) |
| Open-ended before Likert | If both probe the same construct, ask open-ended first | Prevents scale anchoring of qualitative responses |
| Topic blocks before context questions | Ask topic-specific attitudes before general context questions | Reduces question-order priming |
| Randomize within blocks | Randomize item order within blocks when order is unconstrained | Prevents primacy/recency effects and straight-lining |
| Introduce constructs before measuring them | Brief orienting text before unfamiliar construct blocks | Reduces measurement error from misunderstanding |
| Pre-register order decisions | Document randomization plan before data collection | Prevents researcher degrees of freedom |

---

## Part 10 — Version Control Log

| Version | Date | Author | Changes made |
|---|---|---|---|
| v0.1 — draft | 2026-11-10 | I. Tapia-Jaramillo | Initial item generation (festival design; branch `assignment-2-tortoise-festival`) |
| v0.2 — RQ1 only | 2026-11-11 | I. Tapia-Jaramillo | Narrowed to RQ1 after meeting with Prof. Echeverri: single survey, festival and second survey removed; norms and collective efficacy dropped; occupation categories revised; GNPD-staff flag added |
| v0.2 — post peer review | | | |
| v0.3 — post cognitive interview | | | |
| v0.4 — post pilot test | | | |
| v1.0 — final (pre-registration) | | | |

---

## References

- Abbey, J. D., & Meloy, M. G. (2017). Attention by design. *Journal of Operations Management*, 53–56, 63–70.
- Dylong, P., Setzepfand, P., & Uebelmesser, S. (2024). Priming attitudes toward immigrants: Implications for migration research and survey design. European Journal of Political Economy, 85, 102554. https://doi.org/10.1016/j.ejpoleco.2024.102554
- Galesic, M., & Bosnjak, M. (2009). Effects of questionnaire length. *Public Opinion Quarterly*, 73(2), 349–360.
- Jeong, D., Aggarwal, S., Robinson, J., Kumar, N., Spearot, A., & Park, D. S. (2023). Exhaustive or exhausting? Evidence on respondent fatigue in long surveys. Journal of Development Economics, 161, 102992. https://doi.org/10.1016/j.jdeveco.2022.102992
- Miller, A. (2025). Accessibility, disability, and inclusive instrument design: A critical literature review interrogating the user experience of online surveys and interviews. *The International Journal of Information, Diversity, & Inclusion*, *9*(1/2). https://doi.org/10.33137/ijidi.v9i1/2.43997
- Danaher, K., & Crandall, C. S. (2008). Stereotype threat in applied settings re-examined. *Journal of Applied Social Psychology*, 38(6), 1639–1655.
- Steele, C. M., & Aronson, J. (1995). Stereotype threat and the intellectual test performance of African Americans. *Journal of Personality and Social Psychology*, 69(5), 797–811.
- Tourangeau, R., Rips, L. J., & Rasinski, K. (2000). *The Psychology of Survey Response*. Cambridge University Press.

### Additional references for this study

- Boren, A., & Echeverri, A. (2025). Does psychic numbing apply to endangered species conservation? The case of the Peregrine Falcon in Berkeley, California. *Frontiers in Conservation Science*, 6. https://doi.org/10.3389/fcosc.2025.1490272
- Echeverri, A., Karp, D. S., Naidoo, R., Zhao, J., & Chan, K. M. (2019). Approaching human-animal relationships from multiple angles: A synthetic perspective. *Biological Conservation*, 240, 108297.
- Klain, S. C., Olmsted, P., Chan, K. M. A., & Satterfield, T. (2017). Relational values resonate broadly and differently than intrinsic or instrumental values, or the New Ecological Paradigm. *PLOS ONE*, 12(8), e0183962. https://doi.org/10.1371/journal.pone.0183962
- Langhans, K. E., Echeverri, A., Xu, M., Callahan, M., Palmeri, M. L., Nguyen, O., Ardoin, N. M., & Daily, G. C. (2025). Urban community gardens foster positive human-avian interactions across an income gradient in San Francisco. *Landscape and Urban Planning*, 261, 105391.
- Leach, C. W., van Zomeren, M., Zebel, S., Vliek, M. L. W., Pennekamp, S. F., Doosje, B., Ouwerkerk, J. W., & Spears, R. (2008). Group-level self-definition and self-investment: A hierarchical (multicomponent) model of in-group identification. *Journal of Personality and Social Psychology*, 95(1), 144–165.
- Prober, S. M., Raisbeck-Brown, N., Porter, N. B., Williams, K. J., Leviston, Z., & Dickson, F. (2019). Recent climate-driven ecological change across a continent as perceived through local ecological knowledge. *PLOS ONE*, 14(11), e0224625.
- Stern, M. J., & Coleman, K. J. (2015). The multidimensionality of trust: Applications in collaborative natural resource management. *Society & Natural Resources*, 28(2), 117–132.
- Tapia-Jaramillo, I. (2022). *Multi-criteria decision analysis and public participation GIS as a spatial tool to inform and improve giant tortoise population management in the Galapagos Islands, Ecuador* [Master's thesis, University of Southampton]. https://doi.org/10.13140/RG.2.2.34320.01283
- Veríssimo, D., Fiennes, S., & Dunn, M. (2024). Using digital mobile games to increase the support for nature conservation. *Conservation Science and Practice*, 6(11), e13236.
