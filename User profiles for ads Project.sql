create database user_profiles_for_ads;
Use user_profiles_for_ads;
select * from user_profiles_for_ads;
select count(*) from user_profiles_for_ads;

#KPI 1 Distribution of key demographic variables
#1 Age Distribution
SELECT
    CASE
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        WHEN age >= 65 THEN '65+'
        ELSE 'Unknown'
    END AS age_group,
    COUNT(*) AS count
FROM
    user_profiles_for_ads
GROUP BY
    age_group;
    
#2 Gender Distribution
SELECT
    gender,
    COUNT(*) AS count
FROM
    user_profiles_for_ads
GROUP BY
    gender;

#3 Education Level Distribution 
SELECT
    `Education Level` AS education_level,
    COUNT(*) AS Count
FROM
    user_profiles_for_ads
WHERE
    `Education Level` IN ('Technical', 'PhD', 'Master', 'Bachelor', 'High School')
GROUP BY
    `Education Level`;
    
#4 Income Level Distribution 
SELECT `Income Level`, COUNT(*) as Count
FROM user_profiles_for_ads
GROUP BY `Income Level`;

#Device Usage Distribution
SELECT
    `Device Usage`,
    COUNT(*) AS count
FROM
    user_profiles_for_ads
WHERE
    `Device Usage` IN ('Mobile only', 'Tablet', 'Desktop only', 'Mobile + Desktop')
GROUP BY
    `Device Usage`;
    
#User Online Behaviour & Ad Interaction Metrics
#1 Time Spent Online on Weekdays
SELECT
    `Time Spent Online (hrs/weekday)`,
    COUNT(*) AS Count
FROM
    user_profiles_for_ads
GROUP BY
   `Time Spent Online (hrs/weekday)`;

#2 Time Spent Online on Weekends
SELECT
    `Time Spent Online (hrs/weekend)`,
    COUNT(*) AS Count
FROM
    user_profiles_for_ads
GROUP BY
   `Time Spent Online (hrs/weekend)`;
   
#3 Likes and Reactions 
SELECT
    CASE
        WHEN `Likes and Reactions` >= 0 AND `Likes and Reactions` < 2000 THEN '0-2000'
        WHEN `Likes and Reactions` >= 2000 AND `Likes and Reactions` < 4000 THEN '2000-4000'
        WHEN `Likes and Reactions` >= 4000 AND `Likes and Reactions` < 6000 THEN '4000-6000'
        WHEN `Likes and Reactions` >= 6000 AND `Likes and Reactions` < 8000 THEN '6000-8000'
        WHEN `Likes and Reactions` >= 8000 AND `Likes and Reactions` < 10000 THEN '8000-10000'
        ELSE 'Out of range' 
    END AS range_category,
    COUNT(*) AS count
FROM
    user_profiles_for_ads
GROUP BY
    range_category;

#3 Click Through Rates (CTR)
SELECT
    CASE
        WHEN `Click Through Rates (CTR)` >= 0 AND `Click Through Rates (CTR)` < 0.05 THEN '0.00-0.05'
        WHEN `Click Through Rates (CTR)` >= 0.05 AND `Click Through Rates (CTR)` < 0.10 THEN '0.05-0.10'
        WHEN `Click Through Rates (CTR)` >= 0.10 AND `Click Through Rates (CTR)` < 0.15 THEN '0.10-0.15'
        WHEN `Click Through Rates (CTR)` >= 0.15 AND `Click Through Rates (CTR)` < 0.20 THEN '0.15-0.20'
        WHEN `Click Through Rates (CTR)` >= 0.20 AND `Click Through Rates (CTR)` <= 0.25 THEN '0.20-0.25'
        ELSE 'Out of range' -- Optional clause for handling unexpected values
    END AS ctr_range,
    COUNT(*) AS count
FROM
    user_profiles_for_ads
GROUP BY
    ctr_range;

#5 Conversion Rates
SELECT
    CASE
       WHEN `Conversion Rates` >= 0.00 AND `Conversion Rates` < 0.02 THEN '0.00-0.02'
	   WHEN `Conversion Rates` >= 0.02 AND `Conversion Rates` < 0.04 THEN '0.02-0.04'
	   WHEN `Conversion Rates` >= 0.04 AND `Conversion Rates` < 0.06 THEN '0.04-0.06'
	   WHEN `Conversion Rates` >= 0.06 AND `Conversion Rates` < 0.08 THEN '0.06-0.08'
	   WHEN `Conversion Rates` >= 0.08 AND `Conversion Rates` <= 0.10 THEN '0.08-0.10'
        ELSE 'Out of range' -- Optional clause for handling unexpected values
    END AS conversion_rate_range,
    COUNT(*) AS count
FROM
    user_profiles_for_ads
GROUP BY
    conversion_rate_range;
    
#6 Ad Interaction Time (sec)
SELECT
    CASE
        WHEN `Ad Interaction Time (sec)` >= 0 AND `Ad Interaction Time (sec)` < 25 THEN '0-25'
        WHEN `Ad Interaction Time (sec)` >= 25 AND `Ad Interaction Time (sec)` < 50 THEN '25-50'
        WHEN `Ad Interaction Time (sec)` >= 50 AND `Ad Interaction Time (sec)` < 75 THEN '50-75'
        WHEN `Ad Interaction Time (sec)` >= 75 AND `Ad Interaction Time (sec)` < 100 THEN '75-100'
        WHEN `Ad Interaction Time (sec)` >= 100 AND `Ad Interaction Time (sec)` < 125 THEN '100-125'
        WHEN `Ad Interaction Time (sec)` >= 125 AND `Ad Interaction Time (sec)` < 150 THEN '125-150'
        WHEN `Ad Interaction Time (sec)` >= 150 AND `Ad Interaction Time (sec)` <= 175 THEN '150-175'
        ELSE 'Out of range' -- Optional clause for handling unexpected values
    END AS time_range,
    COUNT(*) AS count
FROM
    user_profiles_for_ads
GROUP BY
    time_range;
    
#7 Top 10 User Interests
SELECT
    `Top Interests`,
    CASE
        WHEN `Ad Interaction Time (sec)` >= 0 AND `Ad Interaction Time (sec)` < 25 THEN '0-25'
        WHEN `Ad Interaction Time (sec)` >= 25 AND `Ad Interaction Time (sec)` < 50 THEN '25-50'
        WHEN `Ad Interaction Time (sec)` >= 75 AND `Ad Interaction Time (sec)` < 100 THEN '75-100'
        WHEN `Ad Interaction Time (sec)` >= 100 AND `Ad Interaction Time (sec)` < 125 THEN '100-125'
        WHEN `Ad Interaction Time (sec)` >= 125 AND `Ad Interaction Time (sec)` < 150 THEN '125-150'
        WHEN `Ad Interaction Time (sec)` >= 150 AND `Ad Interaction Time (sec)` <= 175 THEN '150-175'
        ELSE 'Out of range' -- Optional clause for handling unexpected values
    END AS time_range,
    COUNT(*) AS count
FROM
    user_profiles_for_ads
GROUP BY
    `Top Interests`, time_range
ORDER BY
    count DESC
LIMIT 10;

#Subset of features that could be most indicative of user preferences and behaviour for segmentation
#1
SELECT
    `User ID`,  -- Adjust this column name as per your table's actual column name
    `Age`,
    `Gender`,
    `Location`,
    `Language`,
    `Education Level`  -- Adjust this column name as per your table's actual column name
FROM
    user_profiles_for_ads;

#2    
SELECT
    `Likes and Reactions`,
    `Followed Accounts`,
    `Device Usage`
FROM
    user_profiles_for_ads; 
    
#3
SELECT
    `Time Spent Online (hrs/weekday)`,
    `Time Spent Online (hrs/weekend)`
FROM
    user_profiles_for_ads;
    
#4
SELECT
    `Click Through Rates (CTR)`,
    `Conversion Rates`,
    `Ad Interaction Time (sec)`
FROM
    user_profiles_for_ads;
    
#5
SELECT
    `Income Level`,
    `Top Interests`,
    `Cluster`
FROM
    user_profiles_for_ads; 
 
# Cluster Groups 0 to 4
# Cluster 0 – “Weekend Warriors
SELECT *
FROM user_profiles_for_ads
WHERE CAST(`Time Spent Online (hrs/weekend)` AS DECIMAL) > 6.4 
  AND CAST(`Time Spent Online (hrs/weekday)` AS DECIMAL) < 1.1            
  AND `Click Through Rates (CTR)` > '0.15' 
  AND `Ad Interaction Time (sec)` > '150'
  AND Cluster != 'No Cluster'; -- Exclude rows where the cluster is 'No Cluster'
  
# Cluster 1 – Engaged Professionals
SELECT *
FROM user_profiles_for_ads
WHERE `Time Spent Online (hrs/weekday)` > 4.4 
  AND (`Education Level` = 'Master' OR `Education Level` = 'PhD') 
  AND `Click Through Rates (CTR)` >= 0.1 
  AND `Click Through Rates (CTR)` <= 0.2 
  AND `Conversion Rates` >= 0.04 
  AND `Conversion Rates` <= 0.08;

# Cluster 2 – Low-Key Users
SELECT *
FROM user_profiles_for_ads
WHERE `Time Spent Online (hrs/weekday)` < 2.2 
  AND `Time Spent Online (hrs/weekend)` < 4.8 
  AND `Education Level` = 'High School' 
  AND `Click Through Rates (CTR)` < 0.05 
  AND `Ad Interaction Time (sec)` < 25;

# Cluster 3 – Active Explorers
SELECT *
FROM user_profiles_for_ads
WHERE `Time Spent Online (hrs/weekday)` > 3.3 
  AND `Time Spent Online (hrs/weekend)` > 4.8 
  AND `Click Through Rates (CTR)` > 0.15 
  AND `Conversion Rates` > 0.06
  AND Cluster != 'Cluster 1';
 
 # Cluster 4 – Budget Browsers
 SELECT *
FROM user_profiles_for_ads
WHERE `Time Spent Online (hrs/weekday)` >= 2.2 
  AND `Time Spent Online (hrs/weekday)` <= 3.3 
  AND `Time Spent Online (hrs/weekend)` >= 3.2 
  AND `Time Spent Online (hrs/weekend)` <= 6.4 
  AND `Click Through Rates (CTR)` >= 0.1 
  AND `Click Through Rates (CTR)` <= 0.15 
  AND `Conversion Rates` >= 0.04 
  AND `Conversion Rates` <= 0.06;

# Cluster Assigned
ALTER TABLE user_profiles_for_ads ADD COLUMN cluster VARCHAR(50);

UPDATE user_profiles_for_ads
SET cluster = CASE
        WHEN `Time Spent Online (hrs/weekend)` > 6.4 AND `Time Spent Online (hrs/weekday)` < 1.1 AND `Click Through Rates (CTR)` > 0.15 AND `Ad Interaction Time (sec)` > 150 THEN 'Cluster 0'
        WHEN `Time Spent Online (hrs/weekday)` > 4.4 AND (`Education Level` = 'Master' OR `Education Level` = 'PhD') AND `Click Through Rates (CTR)` >= 0.1 AND `Click Through Rates (CTR)` <= 0.2 AND `Conversion Rates` >= 0.04 AND `Conversion Rates` <= 0.08 THEN 'Cluster 1'
        WHEN `Time Spent Online (hrs/weekday)` < 2.2 AND `Time Spent Online (hrs/weekend)` < 4.8 AND `Education Level` = 'High School' AND `Click Through Rates (CTR)` < 0.05 AND `Ad Interaction Time (sec)` < 25 THEN 'Cluster 2'
        WHEN `Time Spent Online (hrs/weekday)` > 3.3 AND `Time Spent Online (hrs/weekend)` > 4.8 AND `Click Through Rates (CTR)` > 0.15 AND `Conversion Rates` > 0.06 THEN 'Cluster 3'
        WHEN `Time Spent Online (hrs/weekday)` >= 2.2 AND `Time Spent Online (hrs/weekday)` <= 3.3 AND `Time Spent Online (hrs/weekend)` >= 3.2 AND `Time Spent Online (hrs/weekend)` <= 6.4 AND `Click Through Rates (CTR)` >= 0.1 AND `Click Through Rates (CTR)` <= 0.15 AND `Conversion Rates` >= 0.04 AND `Conversion Rates` <= 0.06 THEN 'Cluster 4'
        ELSE 'No Cluster'
    END;
    
SELECT * FROM user_profiles_for_ads;


    
    
    
