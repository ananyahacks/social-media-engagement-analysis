
# Social Media Engagement Analysis | SQL + Power BI

## Project Overview
This project analyzes social media engagement and sentiment data to identify key drivers of user engagement and assess how sentiment and toxicity impact content performance. The analysis is designed to support content strategy, platform growth, and user experience improvements.

## Business Problem
Social media platforms aim to maximize meaningful user engagement while maintaining healthy community interactions. Understanding which platforms and content categories drive engagement — and how negative sentiment and toxicity affect performance — is critical for growth, retention, and trust & safety initiatives.

This project answers key business questions to help stakeholders optimize content strategy and improve overall platform health.

## Dataset
Kaggle dataset : https://www.kaggle.com/datasets/subashmaster0411/social-media-engagement-dataset

The dataset contains synthetic but realistic social media post-level data, including:
- Post metadata (platform, topic category, location, language)
- Engagement metrics (likes, shares, comments, impressions, engagement rate)
- Sentiment and emotion indicators
- Toxicity scores
- Brand and campaign information

## Data Modeling & SQL Design
The original dataset was provided as a denormalized flat table. To enable scalable SQL analysis and demonstrate relational database design, the data was normalized into multiple tables.
The schema design and data preparation steps — including table creation, data type standardization, and normalization — are documented in:

- `sql/schema_and_setup.sql`

This step enables modular analysis and reflects real-world analytics database design practices.

- `posts` — core post metadata  
- `engagement` — post-level engagement metrics  
- `sentiment` — sentiment, emotion, and toxicity indicators  
- `campaigns` — brand and campaign attributes  

This design enables multi-table JOINs and modular analysis. Schema creation and setup queries are available in `sql/schema_and_setup.sql`.

## Key Business Questions
- Which platforms drive the highest average engagement and sustained performance over time?
- Which content topic categories consistently perform best in terms of engagement?
- How does user sentiment and emotional tone impact engagement rates?
- Does higher toxicity correlate with lower user engagement and growth?
- How has overall engagement changed over time, and are there signs of growth or decline?
- Which days and time periods show the strongest engagement performance?
- Are high-impression posts effectively converting reach into meaningful engagement?

## Analysis Approach
KPI and performance analysis queries are implemented using multi-table JOINs and aggregations in:

- `sql/02_kpi_analysis.sql`  
- `sql/03_time_and_growth_analysis.sql`

The analysis evaluates engagement performance across platforms and content categories, and examines how sentiment and toxicity attributes impact overall engagement. Time-based queries are used to assess growth trends and changes in engagement patterns over time.

## Tools & Technologies
- MySQL
- SQL (joins, aggregations, CASE statements, schema design)
- Power BI (planned for dashboard visualization)

## Repository Structure
- `/sql`
  - `schema_and_setup.sql`
  -  `02_kpi_analysis.sql`
  - `03_time_and_growth_analysis.sql`
- `/screenshots`
  - `kpi_dashboards.png`
- `README.md`

