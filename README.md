
# Social Media Engagement & Sentiment Analysis | SQL + Power BI

## Project Overview
This project analyzes social media engagement and sentiment data to identify key drivers of user engagement and assess how sentiment and toxicity impact content performance. The analysis is designed to support content strategy, platform growth, and user experience improvements.

## Business Problem
Social media platforms aim to maximize meaningful user engagement while maintaining healthy community interactions. Understanding which platforms and content categories drive engagement — and how negative sentiment and toxicity affect performance — is critical for growth, retention, and trust & safety initiatives.

This project answers key business questions to help stakeholders optimize content strategy and improve overall platform health.

## Dataset
The dataset contains synthetic but realistic social media post-level data, including:
- Post metadata (platform, topic category, location, language)
- Engagement metrics (likes, shares, comments, impressions, engagement rate)
- Sentiment and emotion indicators
- Toxicity scores
- Brand and campaign information

## Data Modeling & SQL Design
The original dataset was provided as a denormalized flat table. To enable scalable SQL analysis and demonstrate relational database design, the data was normalized into multiple tables:

- `posts` — core post metadata  
- `engagement` — post-level engagement metrics  
- `sentiment` — sentiment, emotion, and toxicity indicators  
- `campaigns` — brand and campaign attributes  

This design enables multi-table JOINs and modular analysis. Schema creation and setup queries are available in `sql/schema_and_setup.sql`.

## Key Business Questions
- Which platforms drive the highest average engagement?
- Which content topic categories perform best?
- How does sentiment impact engagement rates?
- Does higher toxicity correlate with lower engagement?
- What is the overall engagement health of the platform?

## Analysis Approach
KPI and performance analysis queries are implemented using multi-table JOINs and aggregations in:
- `sql/02_kpi_analysis.sql`

These queries evaluate engagement trends by platform, topic category, and sentiment attributes.

## Key Insights (Work in Progress)
🚧 Insights will be finalized as additional analysis is completed. Initial findings focus on platform-level engagement differences and sentiment-driven performance patterns.

## Tools & Technologies
- MySQL
- SQL (joins, aggregations, CASE statements, schema design)
- Power BI (planned for dashboard visualization)

## Repository Structure
- /sql
  - schema_and_setup.sql
  -  02_kpi_analysis.sql
- README.md
