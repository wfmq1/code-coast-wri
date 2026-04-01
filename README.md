# Code & Coast — WRI (Weighted Relocation Index)

### A data-driven model to rank New Zealand regions for relocation decisions

---

## 📌 Project Overview

This project builds a Weighted Relocation Index (WRI) to evaluate and rank regions in New Zealand based on key factors that matter for families considering relocation.

The goal is to move beyond simple metrics and provide a balanced, data-driven comparison across regions.

---

## ❓ Business Problem

Which region in New Zealand offers the best balance of:

* Job opportunities
* Housing affordability
* Education quality
* Population growth

This project focuses on identifying strong alternatives beyond Auckland.

---

## 📊 Data Sources

| Dataset    | Source            | Coverage                         |
| ---------- | ----------------- | -------------------------------- |
| Education  | NZQA (2024)       | NCEA Level 3 results, 16 regions |
| Employment | Seek NZ (Q3 2025) | Job listing volume               |
| Property   | REINZ (June 2025) | Median house price               |
| Population | Stats NZ (2023)   | Growth rate (2018–2048)          |

---

## ⚙️ Methodology

1. Data loaded into PostgreSQL (raw and mart layers)
2. Log transformation applied to job data to reduce skewness (CV ≈ 193%)
3. Z-score normalization applied to all metrics for comparability
4. Weighted scoring model:

   * Job opportunities — 40%
   * Affordability — 30%
   * Education — 20%
   * Population growth — 10%

---

## 📈 Key Findings

* Canterbury ranks #1 due to strong job availability and relatively affordable housing
* Auckland has the highest job opportunities but is heavily impacted by high housing costs
* Some regions show strong population growth but lack job support, lowering overall ranking

---

## 🎯 Use Cases

This model can support:

* Families planning relocation within New Zealand
* Regional comparison for policy or planning
* High-level market analysis for housing and jobs

---

## 📁 Project Structure

* `sql/wri_view.sql`
  → Core model using CTEs and window functions (z-score + weighting)

* `sql/final_output.sql`
  → Final ranking output for reporting

* `data/`
  → Source datasets (education, jobs, property, population)

---

## 🧠 Key Skills Demonstrated

* SQL (CTEs, window functions, aggregation)
* Data transformation (log scaling, standardization)
* Feature engineering (composite scoring model)
* Analytical thinking (multi-factor decision model)

---

## 🚀 Next Steps

* Build Power BI dashboard for interactive exploration
* Add sensitivity analysis for weight adjustments
* Extend model with additional factors (e.g. transport, crime, climate)

---
