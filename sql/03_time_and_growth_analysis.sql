-- Q1: Monthly average engagement trend

SELECT DATE_FORMAT(p.post_datetime, '%Y-%m') AS month, COUNT(*) AS total_posts, ROUND(AVG(e.engagement_rate), 4) AS avg_engagement_rate
FROM posts p JOIN engagement e ON p.post_id = e.post_id GROUP BY month
ORDER BY month;

-- Q2: Monthly impressions vs engagement

SELECT DATE_FORMAT(p.post_datetime, '%Y-%m') AS month, ROUND(AVG(e.impressions), 0) AS avg_impressions, ROUND(AVG(e.engagement_rate), 4) AS avg_engagement_rate
FROM posts p JOIN engagement e ON p.post_id = e.post_id GROUP BY month
ORDER BY month;

-- Q3: Platform-wise engagement growth

SELECT p.platform, COUNT(*) AS total_posts, ROUND(AVG(e.user_engagement_growth), 4) AS avg_user_engagement_growth
FROM posts p JOIN engagement e ON p.post_id = e.post_id GROUP BY p.platform
ORDER BY avg_user_engagement_growth DESC;

-- Q4: Engagement by day of week

SELECT p.day_of_week, COUNT(*) AS total_posts, ROUND(AVG(e.engagement_rate), 4) AS avg_engagement_rate
FROM posts p JOIN engagement e ON p.post_id = e.post_id GROUP BY p.day_of_week
ORDER BY avg_engagement_rate DESC;

-- Q5: High impressions but low engagement (potential content quality issues)

SELECT p.platform, COUNT(*) AS total_posts, ROUND(AVG(e.impressions), 0) AS avg_impressions, ROUND(AVG(e.engagement_rate), 4) AS avg_engagement_rate
FROM posts p JOIN engagement e ON p.post_id = e.post_id GROUP BY p.platform
HAVING AVG(e.impressions) > (SELECT AVG(impressions) FROM engagement)
ORDER BY avg_engagement_rate ASC;


