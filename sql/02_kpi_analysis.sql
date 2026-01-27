-- Q1: What is the overall average engagement rate across all posts?

SELECT  ROUND(AVG(engagement_rate), 4) AS overall_avg_engagement_rate FROM engagement;

-- Q2: Which platforms drive the highest engagement?

SELECT p.platform, COUNT(*) AS total_posts, ROUND(AVG(e.engagement_rate), 4) AS avg_engagement_rate FROM posts p
JOIN engagement e ON p.post_id = e.post_id GROUP BY p.platform
ORDER BY avg_engagement_rate DESC;

-- Q3: Which topic categories perform best?

SELECT p.topic_category, COUNT(*) AS total_posts, ROUND(AVG(e.engagement_rate), 4) AS avg_engagement_rate FROM posts p
JOIN engagement e ON p.post_id = e.post_id GROUP BY p.topic_category
ORDER BY avg_engagement_rate DESC;

-- Q4: How does sentiment affect engagement?

SELECT s.sentiment_label, COUNT(*) AS total_posts, ROUND(AVG(e.engagement_rate), 4) AS avg_engagement_rate FROM sentiment s
JOIN engagement e ON s.post_id = e.post_id GROUP BY s.sentiment_label
ORDER BY avg_engagement_rate DESC;

-- Q5: Does higher toxicity correlate with lower engagement?

SELECT 
CASE 
    WHEN s.toxicity_score < 0.3 THEN 'Low Toxicity'
    WHEN s.toxicity_score < 0.6 THEN 'Medium Toxicity'
    ELSE 'High Toxicity'
END AS toxicity_bucket,
  COUNT(*) AS total_posts, ROUND(AVG(e.engagement_rate), 4) AS avg_engagement_rate FROM sentiment s
JOIN engagement e ON s.post_id = e.post_id GROUP BY toxicity_bucket
ORDER BY avg_engagement_rate ASC;






