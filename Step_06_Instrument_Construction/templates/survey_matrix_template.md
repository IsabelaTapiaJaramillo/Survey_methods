# Survey Design Matrix — Festival de las Tortugas Gigantes
## For Socio-Ecological and Environmental Research

> **Instructions for use.**  
> Fill in every row before building your survey instrument. If you cannot complete the "Research Question" or "Analytic Use" columns for an item, that item should be cut or revised. This matrix is a living document — update it after cognitive interviews, piloting, and peer review.  
> Save a dated version (`survey_matrix_v1_YYYY-MM-DD.md`) at each major revision.

*ESPM 231 Assignment 2, Appendix D. Version v0.1, 2026-11-10. Full item wording (English, plus Spanish drafts) and scoring for every multi-item measure are in [`Step_03/scale_documentation/`](../../Step_03_Psychometric_Scales_and_Construct_Validity/scale_documentation/).*

**Wave codes used below:** **T0** = first survey (panel, 2–4 weeks before the festival) · **T1** = second survey (same panel, 2–6 weeks after) · **P** = ~100 *new* residents surveyed after the festival.

**Question types used (6 of the 11 in `question_types_reference.md`):** word association · image association · image heat map · Likert-scale items · multiple choice (single and multi-select) · open-ended short response.

---

## Part 1 — Study Overview

| Field | Your entry |
|---|---|
| **Study title** | Festival de las Tortugas Gigantes: relational values, group identity, institutional trust and participation in giant tortoise conservation on Santa Cruz, Galápagos |
| **Lead researcher** | Isabela Tapia-Jaramillo (UC Berkeley; Galapagueña researcher) |
| **Date (version)** | 2026-11-10 (v0.1, draft for ESPM 231) |
| **Study site / population** | Santa Cruz Island, Galápagos, Ecuador: Puerto Ayora (urban) and the highland parishes of Bellavista and Santa Rosa |
| **Target population** | Adults (18+) living on Santa Cruz |
| **Survey mode** | ☐ Online   ☐ Paper   ☒ Face-to-face (tablet; KoboToolbox; in Spanish)   ☐ Phone   ☐ Mixed. *(The follow-up call to monitoring-day no-shows is by phone or WhatsApp.)* |
| **Sampling strategy** | Non-probability **quota** sampling by area (Puerto Ayora vs. highlands) × occupation (farming, fishing, tourism, public sector, other) × origin (born in Galápagos vs. mainland). Door to door in randomly chosen blocks of Puerto Ayora and along highland roads, plus farmers' and fishers' associations. N = 440 at T0 (220 per arm), ~308 at T1, plus ~100 P (Step 09). |
| **Estimated duration** | T0: **25 min** (5 min introduction, context and consent, plus 20 min of questions) · T1: ~13 min · P: ~15 min |
| **Primary research questions** | RQ1: How do residents' relationships with nature and with conservation institutions shape their intentions to participate, and their actual participation, in tortoise conservation across social groups on Santa Cruz? <br>RQ2: Does a community festival celebrating human–tortoise relationships increase residents' intentions and actual participation, and does the effect depend on identification with local groups and trust in conservation institutions? <br>RQ3: n/a |
| **Pre-registration DOI / link** | OSF, to be registered before T0 (Step 05) |
| **IRB / Ethics approval #** | UC Berkeley CPHS: *pending*. Galápagos research permit (GNPD): *pending* |
| **Stimulus materials (if any)** | (1) Photos for image association: a giant tortoise and a park ranger. (2) A map of Santa Cruz for the heat map. (3) The **festival invitation card plus snack voucher** (randomized at the end of T0). (4) The festival itself. (5) The monitoring-day invitation (T1). |

---

## Part 2 — Full Item Matrix

*Variable roles: IV = independent variable, DV = dependent variable, Cov = covariate, Mod = moderator, Qual = qualitative, NA = not in analyses. Within-block item order is randomized wherever marked "R".*

### Block 0 — Introduction, consent and screener (T0, T1, P) · 5 min at T0

| Block ID | Item text (verbatim or draft) | Research Question(s) addressed | Theoretical Construct | Variable Role | Scale / Prior Source | Response Format | Placement / Order Notes | Justification / Cut rationale |
|---|---|---|---|---|---|---|---|---|
| B0-01 | Introduction script: who we are (UC Berkeley, **independent of the GNPD**), purpose (how residents relate to tortoises and to conservation), duration, payment for each survey | n/a | n/a | ☒ Not in analyses | Step 08 consent template | Read aloud | First | Required for informed consent. Independence from the GNPD reduces social-desirability bias on trust items. |
| B0-02 | Informed consent: "Do you agree to take part?" | n/a | n/a | ☒ Not in analyses | Step 08 | Single choice: Yes / No (No → end) | After B0-01 | Ethics |
| B0-03 | "Are you 18 or older?" · "Do you live on Santa Cruz?" | Eligibility | n/a | ☒ Not in analyses | n/a | Yes / No (No → end) | Screener | Inclusion criteria |
| B0-04 | "Where do you live?" Puerto Ayora / Bellavista / Santa Rosa / other part of Santa Cruz | RQ1, RQ2 | Group (area) | ☒ Covariate (**stratification** variable) | Step 06 demographic bank | Multiple choice | Screener; needed for the quota and the randomization stratum | Area is a quota variable, a stratum and an RQ1 term |
| B0-05 | "What is your main occupation?" Farming / fishing / tourism / public sector / other (specify) | RQ1, RQ2 | Group (occupation) | ☒ Covariate (**stratification** variable) | Step 06 demographic bank (collapsed to 5) | Multiple choice | Screener | Quota, stratum and RQ1 term. Not sensitive. |
| B0-06 | "Where were you born?" Galápagos / mainland Ecuador / another country | RQ1 | Group (origin) | ☒ Covariate | n/a | Multiple choice | Screener | Quota variable; central to the meaning of "Galapagueño/a" |
| B0-07 | *(Auto)* Enumerator ID, date, start time, `participant_id` (from `randomization.R`) | n/a | n/a | ☒ Random effect (enumerator) | n/a | Auto-filled | Hidden | Enumerator effects; links waves. **Names and phone numbers are stored in a separate file.** |

### Block 1 — Word and image association (T0) · 2.5 min

| Block ID | Item text | Research Question(s) | Theoretical Construct | Variable Role | Scale / Source | Response Format | Placement Notes | Justification |
|---|---|---|---|---|---|---|---|---|
| B1-01 | "What are three words that come to mind when you think of **giant tortoises**?" | RQ1 | Unprimed mental associations (relationships with nature) | ☒ Qualitative | Word association task (Boren & Echeverri, 2025) | 3 short text boxes | **First substantive block**, so answers are not primed by later items | Captures spontaneous meanings (e.g., identity, tourism, conflict) before any attitude item |
| B1-02 | [Photo of a giant tortoise] "What three words do you associate with this image?" | RQ1 | Relationships with nature | ☒ Qualitative | Image association task (Langhans et al., 2025) | 3 short text boxes | After B1-01 | A visual stimulus adds affective associations |
| B1-03 | [Photo of a park ranger] "What three words do you associate with this image?" | RQ1 | Relationships with institutions (spontaneous trust or distrust) | ☒ Qualitative | Image association task | 3 short text boxes | After B1-02; photo order randomized (R) | An unprimed counterpart to the trust items (B3), asked before them |

### Block 2 — Image heat map (T0) · 3 min

| Block ID | Item text | Research Question(s) | Theoretical Construct | Variable Role | Scale / Source | Response Format | Placement Notes | Justification |
|---|---|---|---|---|---|---|---|---|
| B2-01 | "On this map of Santa Cruz, tap the places where you **see giant tortoises**." (up to 5 taps) | RQ1 | Human–tortoise contact; place-based relationship | ☒ Qualitative / spatial (also a covariate: contact in own parish) | Image heat map (Prober et al., 2019); Latin American social cartography (*mapeo social*); participatory mapping on Isabela (Tapia-Jaramillo, 2022) | Taps on an offline map (Kobo `geopoint` repeat, or `image-map` on a gridded SVG) | After the association block, before Likert items | Spatial pattern of contact; links to area differences |
| B2-02 | "Now tap the places where you **take part in tortoise conservation activities** (if any)." Option: "I don't take part in any" | RQ1 | Current participation (spatial) | ☒ Covariate (prior participation) / spatial | Same | Taps, plus a "none" option | After B2-01 | Shows where participation happens vs. where tortoises are; detects access gaps for highland and urban residents |

### Block 3 — Likert items (T0; repeated at T1 and P where marked) · 7.5 min · ~28 items, 5-point

*A show card on the tablet displays the 5-point scale. Order of sub-blocks: INT → NORM → CE → ID → RV → TRUST. Item order is randomized within each sub-block (R). Trust comes last because it is the most sensitive.*

| Block ID | Item text | Research Question(s) | Theoretical Construct | Variable Role | Scale / Source | Response Format | Placement Notes | Justification |
|---|---|---|---|---|---|---|---|---|
| B3-01 to B3-05 | INT1–INT5. "In the next three months, how likely is it that you will…" (1) take part in a community activity to care for giant tortoises; **(2) join a community tortoise-monitoring day in the highlands**; (3) talk with family or neighbors about caring for tortoises; (4) report an injured or lost tortoise, or one in danger on a road; (5) attend a meeting or event about tortoise conservation | RQ1, RQ2 (H1a–c, H2b) | Participation intentions | ☒ **DV** | New (see `06_participation_intentions.md`); format follows Step 07 B-04 (Veríssimo et al., 2024) | 5-point likelihood (Very unlikely … Very likely) | First Likert sub-block (DV before predictors, to limit consistency priming). R. **Repeated at T1 and P with identical wording.** | Main self-reported DV. INT2 is compared with actual sign-up and attendance (Step 07). |
| B3-AC1 | "To make sure the tablet is recording answers correctly, please choose **'Agree'** for this statement." | n/a | n/a | ☒ Not in analyses (QC) | Template Part 8, Type 1 | 5-point agree | Inside INT/NORM, ~6 min into the questions (**first third**) | Attention check, framed as a comprehension aid (Abbey & Meloy, 2017) |
| B3-06 to B3-08 | NORM1–3. (1) Most people in my community think it is important to protect giant tortoises; (2) most people in my community take part in activities to care for giant tortoises; (3) people in my community would approve of me taking part in tortoise conservation activities. *"Community" = the people who live on Santa Cruz.* | RQ1, RQ2 (H1c, H2b) | In-group norms (injunctive and descriptive) | ☒ Mod (H1c) / **DV** (H2b) | New, written from SIMPEA definitions (Fritsche et al., 2018); related application: Johnson & Reimer (2023) | 5-point agree | After INT; R. **Repeated at T1 and P.** | Core SIMPEA moderator; a festival target |
| B3-09 to B3-11 | CE1–3. (1) Together, the people of Santa Cruz can make a real difference for giant tortoises; (2) if people in my community work together, we can protect the places where tortoises live; (3) the people of Santa Cruz have the knowledge and skills needed to help conserve tortoises | RQ2 (H2b) | Collective efficacy | ☒ **DV** (H2b); Cov (RQ1) | New, written from SIMPEA definitions (Fritsche et al., 2018) | 5-point agree | After NORM; R. **Repeated at T1 and P.** | SIMPEA lever targeted by the portrait exhibition |
| B3-12 to B3-15 | ID1–4. (1) I feel a bond with other Galapagueños; (2) I am glad to be Galapagueño/a; (3) being Galapagueño/a is an important part of how I see myself; (4) I have a lot in common with the average Galapagueño/a | RQ1, RQ2 (H1c, H2d) | Identification as Galapagueño/a | ☒ IV / Mod | Adapted from Leach et al. (2008) | 5-point agree | After CE; R. **T0 only** (stable; moderator measured before treatment) | Core SIMPEA construct. Wording version flagged if adapted for mainland-born residents. |
| B3-16 to B3-21 | RV1–6. Klain et al. (2017) relational statements: *comm, health, iden, kin, wild, other* (verbatim in `01_relational_values.md`) | RQ1 (H1a, H1b) | Relational values | ☒ IV / Mod | **Validated: Relational Values scale (Klain et al., 2017), Step 03 table** | 5-point agree | After ID; R. **T0 and P only** (stable characteristic) | The required validated scale; the "relationship with nature" pathway |
| B3-22 to B3-27 | TR1–6. GNPD competence (2), personal relationships (2), rules and procedures (2) (verbatim in `05_trust_gnpd.md`) | RQ1, RQ2 (H1b, H2d) | Trust in conservation institutions | ☒ IV / Mod; DV (descriptive change) | New, from Stern & Coleman (2015) | 5-point agree, plus a separate "I don't know" (coded missing) | **Last Likert sub-block** (most sensitive); R. **Repeated at T1 and P.** | The "relationship with institutions" pathway. Reminder before the block: "Your answers are never shared with the GNPD." |

### Block 4 — Multiple-choice items: prior participation, barriers, background (T0) · 3 min · ~10 items

| Block ID | Item text | Research Question(s) | Theoretical Construct | Variable Role | Scale / Source | Response Format | Placement Notes | Justification |
|---|---|---|---|---|---|---|---|---|
| B4-01 | "In the past 12 months, have you taken part in any of these?" Tortoise monitoring or census · releases or repatriation events · community clean-ups in tortoise areas · talks or workshops · *Guardians of the Giant Tortoises* or similar · none | RQ1 | Prior participation (past behavior) | ☒ Covariate | New | Multi-select ("none" is exclusive) | After Likert | Controls for past behavior; checks the B2-02 heat map |
| B4-02 | "How often do you see giant tortoises in your daily life?" Never / a few times a year / monthly / weekly / daily | RQ1 | Prior contact with the focal species | ☒ Covariate | New | Single choice (ordinal) | After B4-01 | A balance-check covariate (randomization plan) |
| B4-03 | BAR1–7. "Which of the following make it hard for you to take part in tortoise conservation activities?" Work schedule / caring for children or family / transport / cost / don't hear about activities in time / other / nothing | RQ1, RQ2 | Practical barriers (cf. TPB perceived behavioral control) | ☒ Covariate | New (`07_practical_barriers.md`) | Multi-select ("nothing" is exclusive) | Middle of the block | Separates *can't* from *won't*. The same categories are used in the follow-up call (Step 07). |
| B4-AC2 | "In the past month, have you traveled to the Moon?" No / yes, once / yes, several times | n/a | n/a | ☒ Not in analyses (QC) | Template Part 8, Type 2 | Single choice (correct: No) | **Final third** (~17 min) | Second attention check. Enumerators introduce it as "a question to check the tablet is working." |
| B4-04 | "Since [month], has your household been affected by any of these?" Floods / heavy rain or landslides on your road / loss of work or income / illness in the family / none | RQ1, RQ2 | Recent shocks (temporal context) | ☒ Covariate | New; Part 4 risk table (Step 04) | Multi-select | Before demographics | Shocks such as floods can lower participation regardless of motivation |
| B4-05 | "How many years have you lived in Galápagos?" | RQ1 | Residence duration | ☒ Covariate | Step 06 demographic bank | Number (years) | Background section | Distinguishes long-term mainland-born residents from recent arrivals |
| B4-06 | "What is your age?" | RQ1 | Demographic | ☒ Covariate | Step 06 demographic bank | Number (years) | **Sensitive items last** | Model covariate; balance check |
| B4-07 | "What is your gender identity?" Woman / man / non-binary / prefer to self-describe / prefer not to say | RQ1 | Demographic | ☒ Covariate | Step 06 demographic bank | Single choice with inclusive options | Last items | Covariate; care barriers |
| B4-08 | "What is the highest level of education you have completed?" (Ecuadorian categories: none / primary / secondary / technical / university / graduate / prefer not to say) | RQ1 | Demographic | ☒ Covariate | Step 06 demographic bank (adapted to Ecuador) | Single choice | Last items | Covariate; balance check |

### Block 5 — Open question (T0) · 1.5 min

| Block ID | Item text | Research Question(s) | Theoretical Construct | Variable Role | Scale / Source | Response Format | Placement Notes | Justification |
|---|---|---|---|---|---|---|---|---|
| B5-01 | "What would make it easier for you to take part in tortoise conservation?" | RQ1 | Barriers and enablers (resident voice) | ☒ Qualitative | Open-ended short response (Echeverri et al., 2019) | Short text (≤ 300 characters; the enumerator writes down the answer) | Last substantive question | Reveals barriers and enablers the checklist misses. Coded thematically and fed into the design of the monitoring day. **Note:** template Part 9 recommends open-ended before closed items on the same topic. Because B4-03 (barriers checklist) comes first, answers may be anchored. Cognitive interviews will test whether to move B5-01 ahead of B4-03. |

### Block 6 — Random assignment, payment and recontact (end of T0) · ~1 min (within the 2.5-min buffer)

| Block ID | Item text | Research Question(s) | Theoretical Construct | Variable Role | Scale / Source | Response Format | Placement Notes | Justification |
|---|---|---|---|---|---|---|---|---|
| B6-01 | *(Hidden)* Condition from `randomization.R` sequence → screen shows **"Invited"** or **"Not invited"** | RQ2 (H2a–d) | Festival invitation (encouragement) | ☒ **IV** (instrument) | Randomization plan (Step 04) | Auto (pulldata) | **Revealed only after all T0 answers are saved and locked** | Random assignment cannot affect baseline answers |
| B6-02 | *(If invited)* Enumerator hands over the personal FESTIVAL invitation card plus snack voucher; the tablet records the voucher code | RQ2 (H2a) | Encouragement delivery | ☒ Not in analyses (links attendance) | n/a | Voucher code (scan or type) | After B6-01 | Voucher redemption gives a behavioral attendance record for invited residents |
| B6-03 | Payment for the survey (everyone, equal amount); "May we contact you in a few weeks for a short second visit?" Phone or WhatsApp number | n/a | n/a | ☒ Not in analyses | Step 08 | Yes / No; phone (**stored in a separate contacts file**) | Last | Panel retention (30% attrition assumed, Step 09) |

### Block T1 — Second survey (same panel, 2–6 weeks after the festival) · ~13 min

| Block ID | Item text | Research Question(s) | Theoretical Construct | Variable Role | Scale / Source | Response Format | Placement Notes | Justification |
|---|---|---|---|---|---|---|---|---|
| T1-01 | Consent re-confirmation; `participant_id` linked | n/a | n/a | ☒ Not in analyses | Step 08 | Yes / No | First | Ethics |
| T1-02 | "Did you go to the **Festival de las Tortugas Gigantes** on [date]?" Yes / No | RQ2 (H2a–c) | Festival attendance (self-report) | ☒ **DV** (H2a) / IV (H2b, H2c) | New | Single choice | After consent | Self-reported attendance for everyone. For invited residents, combined with voucher codes. |
| T1-03 | *(If yes)* **Check question:** "Which of these were at the festival?" Portrait exhibition of residents · [two real features] · [two plausible features that were not there] | RQ2 | Attendance validation | ☒ Covariate (validated attendance flag) | New | Multi-select | Right after T1-02 | Detects over-reporting; attendance = self-report plus ≥ 2 correct, 0 foils (sensitivity: voucher records only) |
| T1-04 | *(If not invited)* "Did anyone give you a festival invitation or voucher?" No / yes, a family member / yes, a neighbor or friend / yes, other | RQ2 | Spillover | ☒ Covariate | New | Single choice | After T1-03 | Measures contamination between arms (randomization plan) |
| T1-05 to T1-AC | **Same as B3:** INT1–5, NORM1–3, CE1–3, TR1–6 (**identical wording, order and scale to T0**), plus attention check AC1 | RQ2 (H2b, H2d) | Intentions, norms, efficacy, trust | ☒ **DV** (before/after) | As in B3 | 5-point | Same order as T0 | **Only** the before/after measures are repeated, which limits burden and testing effects |
| T1-06 to T1-08 | *(If attended)* Festival experience: (1) "At the festival I felt proud to be from Galápagos"; (2) "The festival showed me that people in my community care about tortoises"; (3) "The festival showed residents as protectors of tortoises" | RQ2 | Manipulation check: identification, norm and efficacy levers | ☒ Covariate (manipulation check) | New | 5-point agree | After the Likert repeat | Checks that the festival activated the intended SIMPEA levers |
| T1-09 | *(If did not attend)* "What kept you from going?" Same categories as BAR (work, care, transport, cost, didn't hear in time, other, wasn't interested) | RQ2 | Barriers to attendance | ☒ Covariate | BAR categories | Multi-select | After T1-02 branch | Separates barriers from lack of interest |
| T1-10 | Recent shocks since the last visit (same as B4-04) | RQ2 | Temporal context | ☒ Covariate | B4-04 | Multi-select | Before the invitation | Time-varying covariate |
| T1-11 | **Monitoring-day invitation and sign-up** (Step 07): description of the real highland monitoring day (~2 weeks later; free transport with highland pickup points; breakfast and lunch; families welcome, with a children's activity; unpaid). "Would you like to sign up?" Yes / No → if yes: date (2 weekend dates × morning/afternoon), pickup point, consent to a WhatsApp or text reminder two days before | RQ1, RQ2 (H2c) | **Behavior beyond self-report** (sign-up) | ☒ **DV** (H2c) | Step 07 (B-02 sign-ups) | Yes / No; date/time; pickup | **Last**, after all self-report items, so the invitation cannot affect T1 answers | A real, costly choice (unpaid time). Compared with INT2 (intention–behavior gap). |
| T1-12 | Payment for the survey (everyone) | n/a | n/a | ☒ Not in analyses | Step 08 | n/a | Last | Ethics |

### Block P — New post-festival residents (~100; same recruitment and quotas) · ~15 min

| Block ID | Item text | Research Question(s) | Theoretical Construct | Variable Role | Scale / Source | Response Format | Placement Notes | Justification |
|---|---|---|---|---|---|---|---|---|
| P-01 | Introduction, consent, screener (B0-01 to B0-07) | n/a | n/a | ☒ Not in analyses / Cov | As in B0 | As in B0 | First | Same quotas as the panel |
| P-02 | Attendance, check question, spillover (T1-02 to T1-04) | RQ2 | Attendance | ☒ Covariate / grouping | As in T1 | As in T1 | After the screener | Attendee vs. non-attendee description |
| P-03 | INT1–5, NORM1–3, CE1–3, TR1–6, plus AC1, **worded exactly as at T1** | RQ2 | Outcomes | ☒ **DV** | As in B3 | 5-point | Same order as T1 | Compared with the T1 panel → **checks for testing effects** |
| P-04 | RV1–6 | RQ1 | Relational values | ☒ Covariate | Klain et al. (2017) | 5-point | After P-03 | Describes the wider community; allows adjusted comparison |
| P-05 | Festival experience (T1-06 to T1-08) or reasons for not attending (T1-09) | RQ2 | Festival experience | ☒ Covariate | As in T1 | As in T1 | After P-04 | Describes the wider community's experience |
| P-06 | Years in Galápagos, age, gender, education (B4-05 to B4-08) | RQ1 | Demographics | ☒ Covariate | As in B4 | As in B4 | **Last** | Adjusts the panel vs. new-resident comparison |

---

## Part 3 — Variable Summary Table

*Populate after the full matrix is complete. Every variable in your analysis plan must appear here.*

| Variable name | Role | Type | Block ID(s) | Scale/range | Missing data plan | Notes |
|---|---|---|---|---|---|---|
| `invited` | ☒ IV (instrument) | ☒ Binary | B6-01 | 0/1 | None (assigned) | Randomized 1:1, stratified |
| `attended_fest` | ☒ DV (H2a) / IV (H2b, H2c) | ☒ Binary | T1-02, T1-03, B6-02 (voucher) | 0/1 | Voucher record if T1 is missing (invited only); otherwise missing | Self-report validated by the check question |
| `int_mean` (T0, T1, P) | ☒ DV | ☒ Continuous | B3-01–05; T1-05; P-03 | 1–5 | Score if ≥ 4/5 items; multiple imputation (MI) for missing waves | H1a–c, H2b |
| `int_monitor` | ☒ DV (stated counterpart of the behavior) | ☒ Ordinal | B3-02; T1-05 | 1–5 | Item-level missing | Compared with sign-up and attendance |
| `norm_mean` | ☒ Mod / DV | ☒ Continuous | B3-06–08; T1-05; P-03 | 1–5 | Score if ≥ 2/3 items | H1c, H2b |
| `ce_mean` | ☒ DV | ☒ Continuous | B3-09–11; T1-05; P-03 | 1–5 | Score if ≥ 2/3 items | H2b |
| `id_mean` | ☒ IV / Mod | ☒ Continuous | B3-12–15 | 1–5 | Score if ≥ 3/4 items; MI | H1c, H2d |
| `rv_mean` | ☒ IV / Mod | ☒ Continuous | B3-16–21; P-04 | 1–5 | Score if ≥ 5/6 items; MI | H1a, H1b |
| `trust_mean` (and 3 subscales) | ☒ IV / Mod / DV | ☒ Continuous | B3-22–27; T1-05; P-03 | 1–5 | "I don't know" = missing; score if ≥ 4/6 items; MI | H1b, H2d |
| `signed_up` | ☒ DV (H2c) | ☒ Binary | T1-11 | 0/1 | None (no answer = 0) | Behavioral (Step 07) |
| `attended_monitor` | ☒ DV (H2c) | ☒ Binary | Sign-in sheet (Step 07) | 0/1 | None (absent from sheet = 0) | Behavioral (Step 07) |
| `bar_*` (6) and `bar_count` | ☒ Covariate | ☒ Binary / count | B4-03; T1-09 | 0/1; 0–6 | Item-level | Also used in the follow-up call |
| `prior_particip` | ☒ Covariate | ☒ Binary / count | B4-01, B2-02 | 0/1 | Item-level | Past behavior |
| `contact_freq` | ☒ Covariate | ☒ Ordinal | B4-02 | 1–5 | Item-level | Balance check |
| `area` | ☒ Covariate (stratum) | ☒ Binary | B0-04 | PA / HL | None (screener) | RQ1 term |
| `occupation` | ☒ Covariate (stratum) | ☒ Nominal | B0-05 | 5 levels (4 dummies) | None (screener) | RQ1 term |
| `origin` | ☒ Covariate | ☒ Binary | B0-06 | Galápagos / mainland (other countries reported separately) | None (screener) | RQ1 term |
| `years_gal`, `age` | ☒ Covariate | ☒ Continuous | B4-05, B4-06 | years | MI | |
| `gender`, `education` | ☒ Covariate | ☒ Nominal / ordinal | B4-07, B4-08 | categories | "Prefer not to say" kept as its own level | |
| `shock_*` | ☒ Covariate | ☒ Binary | B4-04, T1-10 | 0/1 | Item-level | Temporal context |
| `fest_exp_mean` | ☒ Covariate (manipulation check) | ☒ Continuous | T1-06–08, P-05 | 1–5 | Attendees only | |
| `spillover` | ☒ Covariate | ☒ Nominal | T1-04 | categories | Item-level | Contamination check |
| `enumerator` | ☒ Random effect | ☒ Nominal | B0-07 | E1–E3 | None | Interviewer effects |
| `sample` | ☒ Covariate (grouping) | ☒ Binary | n/a | panel T1 / new P | None | Testing-effect check |
| `ac_pass` | QC | ☒ Binary | B3-AC1, B4-AC2 | 0/1 | n/a | Pre-registered exclusion: fail **both** checks |
| Word and image associations, open answer, map taps | ☒ Qualitative | Text / spatial | B1, B2, B5 | n/a | n/a | Thematic coding; heat maps |

---

## Part 4 — Respondent Burden Audit

**T0: first survey (panel)**

| Survey block | Estimated time | Cumulative time |
|---|---|---|
| Block 0 — Introduction, project context, consent, screener | 5 min | 5 min |
| Block 1 — Word and image association (3 prompts × 3 words; 2 photos) | 2.5 min | 7.5 min |
| Block 2 — Image heat map (2 tap tasks) | 3 min | 10.5 min |
| Block 3 — ~28 Likert items (27 + AC1), ~15 s each, read aloud | 7.5 min | 18 min |
| Block 4 — ~10 multiple-choice items (prior participation, contact, barriers, AC2, shocks, background) | 3 min | 21 min |
| Block 5 — One open question | 1.5 min | 22.5 min |
| Buffer — Block 6 (assignment, voucher, payment, recontact) and unexpected delays | 2.5 min | 25 min |
| **Total** | **25 min** (20 min of questions) | |

**T1: second survey (panel), ~13 min:** consent 1.5 · attendance, check and spillover 1.5 · 17 Likert items plus AC1, 4.5 · festival experience or reasons for not attending 1.5 · shocks 0.5 · monitoring-day invitation and sign-up 2.5 · payment 1.

**P: new residents, ~15 min:** introduction, consent and screener 4 · attendance block 1.5 · 17 Likert items plus AC1, 4.5 · RV 1.5 · festival experience 1.5 · background 1 · payment 1.

**Benchmark targets:**
- Online / self-administered: ≤ 15 min preferred; ≤ 20 min acceptable
- Face-to-face with enumerator: ≤ 35 min → **all waves are within target** (T0 = 25 min)
- Phone: ≤ 10 min → the follow-up call to monitoring-day no-shows is ≤ 5 min
- With multimedia stimuli (photos, audio, video): add ~1–2 min per stimulus block → included in the 2.5 min for Block 1

---

## Part 5 — Item-level QC Checklist

For every item in the matrix, verify:

- [x] The item maps to at least one research question. *(Every substantive item lists an RQ; procedural items are marked "Not in analyses.")*
- [x] The item uses an established scale OR construction rationale is documented. *(RV is validated; ID, NORM and CE are adapted; TRUST, INT and BAR are new, with rationale in `Step_03/notes.md` and `scale_documentation/`.)*
- [x] The response options are **exhaustive**. *(Multiple-choice items include "other" and "none" options; trust has "I don't know.")*
- [x] The response options are **mutually exclusive**. *("None" and "nothing" options are exclusive in multi-selects.)*
- [x] The item is free of **double-barrelled** language. *(Check during cognitive interviews: RV3 and RV4 are long, verbatim Klain items, kept unchanged to preserve validity; INT4 "injured, lost or in danger" is one reporting behavior.)*
- [x] The item avoids **leading** or **loaded** phrasing. *(Trust items include both competence and procedure framings; balanced scale anchors.)*
- [ ] The item is readable at the education level of the target population. *(Pending: cognitive interviews with 8–15 residents, including people with primary education only. Items are read aloud with show cards.)*
- [x] Sensitive items (income, race/ethnicity, gender, health) are placed at the **end**. *(Age, gender and education come last; income and ethnicity are not asked, because they are not needed for the RQs.)*
- [x] Categories for sensitive items include **inclusive options**. *(Gender: non-binary, self-describe, prefer not to say.)*
- [x] Open-ended items have a clear **character limit** and a purpose that justifies the added burden. *(B5-01 ≤ 300 characters; association prompts are 3 words each.)*
- [x] If order is unconstrained, **randomization** within the block is planned and pre-registered. *(Within each Likert sub-block and the two photos; sub-block order is fixed and identical across waves.)*

**Study-specific QC:**
- [x] ≥ 2 attention checks, framed as comprehension aids: AC1 (first third), AC2 (final third).
- [x] No questions about the respondent's own illegal activity (e.g., no questions about personal poaching or trafficking involvement).
- [x] Names and phone numbers are stored separately from answers; the GNPD never receives individual data.
- [x] Assignment is revealed only after all T0 answers are saved.
- [x] T1 and P outcome items are worded identically to T0 (same order and scale).

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
| v0.1 — draft | 2026-11-10 | I. Tapia-Jaramillo | Initial item generation (ESPM 231 Assignment 2): blocks B0–B6, T1, P; measures documented in Step 03 |
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

- Boren, A., & Echeverri, A. (2025). Does psychic numbing apply to endangered species conservation? The case of the Peregrine Falcon in Berkeley, California. *Frontiers in Conservation Science*, *6*. https://doi.org/10.3389/fcosc.2025.1490272
- Echeverri, A., Karp, D. S., Naidoo, R., Zhao, J., & Chan, K. M. (2019). Approaching human-animal relationships from multiple angles: A synthetic perspective. *Biological Conservation*, 240, 108297.
- Klain, S. C., Olmsted, P., Chan, K. M. A., & Satterfield, T. (2017). Relational values resonate broadly and differently than intrinsic or instrumental values, or the New Ecological Paradigm. *PLOS ONE*, 12(8), e0183962.
- Langhans, K. E., Echeverri, A., Xu, M., Callahan, M., Palmeri, M. L., Nguyen, O., Ardoin, N. M., & Daily, G. C. (2025). Urban community gardens foster positive human-avian interactions across an income gradient in San Francisco. *Landscape and Urban Planning*, 261, 105391.
- Leach, C. W., et al. (2008). Group-level self-definition and self-investment. *JPSP*, 95(1), 144–165. *(Full references for the adapted measures: `Step_03/notes.md`.)*
- Prober, S. M., Raisbeck-Brown, N., Porter, N. B., Williams, K. J., Leviston, Z., & Dickson, F. (2019). Recent climate-driven ecological change across a continent as perceived through local ecological knowledge. *PLOS ONE*, 14(11), e0224625.
- Stern, M. J., & Coleman, K. J. (2015). The multidimensionality of trust. *Society & Natural Resources*, 28(2), 117–132.
- Tapia-Jaramillo, I. (2022). *Multi-criteria decision analysis and public participation GIS as a spatial tool to inform and improve giant tortoise population management in the Galapagos Islands, Ecuador* [Master's thesis, University of Southampton]. https://doi.org/10.13140/RG.2.2.34320.01283
- Veríssimo, D., Fiennes, S., & Dunn, M. (2024). Using digital mobile games to increase the support for nature conservation. *Conservation Science and Practice*, 6(11), e13236.
