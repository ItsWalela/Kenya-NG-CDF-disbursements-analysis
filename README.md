# Kenya NG-CDF Disbursements Analysis

Analysis of National Government Constituencies Development Fund (NG-CDF) disbursements to all 290 Kenyan constituencies, from 2014 to 2026.

## Table of Contents

* [Description](#description)
* [Project Aim](#project-aim)
* [Problem Statement](#problem-statement)
* [Aim of the Analysis](#aim-of-the-analysis)
* [Processes](#processes)
* [Insights](#insights)
* [Recommendations](#recommendations)
* [How to Use the Scripts](#how-to-use-the-scripts)

---

## Description

The National Government Constituencies Development Fund (NG-CDF) is a public fund through which the national government finances local development projects in each of Kenya's 290 constituencies. Typical uses include school infrastructure, bursaries, security and other community projects. Money reaches each constituency in instalments (disbursements) over the course of a financial year, which runs from 1 July to 30 June.

The NG-CDF Board publishes a disbursement register on its website. This project uses that register as its dataset.

**Dataset at a glance**

| Item | Detail |
|---|---|
| Source | NG-CDF Board disbursement register, [ngcdf.go.ke/disbursement](https://ngcdf.go.ke/disbursement) |
| Retrieved | 7 September 2026 |
| Coverage | All 290 constituencies |
| Records | 22,804 disbursement records (before cleaning) |
| Format | Nested JSON from the Board's public API, flattened to a tidy CSV |

**Columns in the flattened file** (`ngcdf_disbursements_clean.csv`)

| Column | Description |
|---|---|
| `constituency_id` | Numeric identifier of the constituency in the source system |
| `constituency` | Constituency name |
| `disbursement_date` | Date the money was disbursed (`YYYY-MM-DD`) |
| `financial_year` | Financial year the disbursement is labelled against (for example `2023/2024`) |
| `amount_kes` | Amount disbursed, in Kenya shillings |

The raw data holds several quality problems (duplicate records, mislabelled financial years, garbled characters in names and dates after the retrieval date). These are documented and resolved in the [Processes](#processes) section.

---

## Project Aim

To clean and analyse NG-CDF disbursement records and find out whether constituencies are funded evenly and on time, so that the results can inform fairer and more predictable allocation of development money.

---

## Problem Statement

NG-CDF is meant to fund every constituency under a set formula, yet the money does not always arrive in the year it is meant for, or in the same pattern for every constituency. Late or erratic funding delays projects, leaves bursary and school budgets unpredictable, and makes it hard for constituencies to plan. This project looks at the disbursement record to answer:

1. Which constituencies received consistently lower or more erratic funding than their peers?
2. How much of each financial year's money arrived in a later financial year (arrears), and which constituencies are most affected?
3. How have total disbursements and the number of instalments changed from year to year?
4. Is the timing of disbursements within a financial year consistent, or do payments bunch up late in the year?

---

## Aim of the Analysis

* Clean the raw register: remove duplicates, correct mislabelled financial years, repair garbled names and handle records dated after the retrieval date.
* Build a consistent measure of total disbursement per constituency per financial year.
* Compare each constituency with the national average and median, and rank constituencies from lowest to highest funded.
* Measure funding variability (for example the coefficient of variation) to identify erratic funding patterns.
* Identify arrears by comparing the financial year a payment is labelled against with the financial year in which it was actually paid.
* Summarise national trends in total funding, instalment count and payment timing.
* Present the findings in clear tables and charts, with recommendations.

---

## Processes

_To be completed as the analysis progresses._

---

## Insights

_To be completed as the analysis progresses._

---

## Recommendations

_To be completed as the analysis progresses._

---

## How to Use the Scripts

_To be completed as the analysis progresses._
