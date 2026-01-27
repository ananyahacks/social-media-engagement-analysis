create database social_media_project;
SHOW VARIABLES LIKE 'secure_file_priv';
use social_media_project;
CREATE TABLE dataset (
  post_id TEXT, `timestamp` TEXT, day_of_week TEXT, platform TEXT, user_id TEXT, location TEXT, language TEXT, text_content TEXT, hashtags TEXT, 
  mentions TEXT, keywords TEXT, topic_category TEXT, sentiment_score DOUBLE, sentiment_label TEXT, emotion_type TEXT, toxicity_score DOUBLE, 
  likes_count INT, shares_count INT, comments_count INT, impressions INT, engagement_rate DOUBLE, brand_name TEXT, product_name TEXT, 
  campaign_name TEXT, campaign_type TEXT, user_past_engagement DOUBLE, user_engagement_growth DOUBLE, buzz_change DOUBLE
);

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/social_media.csv'
INTO TABLE dataset
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

select * from dataset;
select count(*) from dataset;

ALTER TABLE dataset ADD COLUMN post_datetime DATETIME;
set sql_safe_updates=0;
UPDATE dataset SET post_datetime = STR_TO_DATE(`timestamp`, '%d-%m-%Y %H:%i');

SELECT `timestamp`, post_datetime FROM dataset LIMIT 5;

SELECT 
  COUNT(*) AS total_rows,
  COUNT(DISTINCT post_id) AS unique_posts,
  COUNT(DISTINCT user_id) AS unique_users
FROM dataset;

CREATE TABLE posts (
  post_id VARCHAR(100) PRIMARY KEY,
  post_datetime DATETIME,
  platform VARCHAR(50),
  day_of_week VARCHAR(15),
  location VARCHAR(100),
  language VARCHAR(10),
  topic_category VARCHAR(50),
  text_content TEXT,
  hashtags TEXT,
  mentions TEXT,
  keywords TEXT
);
INSERT INTO posts
SELECT DISTINCT
  post_id,
  post_datetime,
  platform,
  day_of_week,
  location,
  language,
  topic_category,
  text_content,
  hashtags,
  mentions,
  keywords
FROM dataset;

CREATE TABLE engagement (
  post_id VARCHAR(100),
  likes_count INT,
  shares_count INT,
  comments_count INT,
  impressions INT,
  engagement_rate DOUBLE,
  user_past_engagement DOUBLE,
  user_engagement_growth DOUBLE,
  buzz_change DOUBLE
);
INSERT INTO engagement
SELECT
  post_id,
  likes_count,
  shares_count,
  comments_count,
  impressions,
  engagement_rate,
  user_past_engagement,
  user_engagement_growth,
  buzz_change
FROM dataset;

CREATE TABLE sentiment (
  post_id VARCHAR(100),
  sentiment_score DOUBLE,
  sentiment_label VARCHAR(20),
  emotion_type VARCHAR(30),
  toxicity_score DOUBLE
);
INSERT INTO sentiment
SELECT
  post_id,
  sentiment_score,
  sentiment_label,
  emotion_type,
  toxicity_score
FROM dataset;

CREATE TABLE campaigns (
  post_id VARCHAR(100),
  brand_name VARCHAR(50),
  product_name VARCHAR(100),
  campaign_name VARCHAR(100),
  campaign_type VARCHAR(50)
);
INSERT INTO campaigns
SELECT
  post_id,
  brand_name,
  product_name,
  campaign_name,
  campaign_type
FROM dataset;

SELECT COUNT(*) FROM posts;
SELECT COUNT(*) FROM engagement;
SELECT COUNT(*) FROM sentiment;
SELECT COUNT(*) FROM campaigns;














