-- Are there any campaigns that stand out among clicks and spend?

WITH results_campaign AS (
	SELECT 
		xyz_campaign_id,
		ROUND(SUM(Spent),2) AS Spent,
		SUM(Impressions) AS Impressions,
		SUM(Clicks) AS Clicks,
		SUM(Total_Conversion) AS Total_Conversion
	FROM
		kag_conversion_data
	GROUP BY
		xyz_campaign_id
)
	SELECT
		*,
        ROUND(Spent / Clicks, 2) AS CPC,
        ROUND(Spent / Total_Conversion, 2) AS CPA
	FROM
		results_campaign;

-- How did the campaigns perform among different age groups?
        
WITH age_groups AS (
	SELECT 
		age,
		ROUND(SUM(Spent),2) AS Spent,
		SUM(Impressions) AS Impressions,
		SUM(Clicks) AS Clicks,
		SUM(Total_Conversion) AS Total_Conversion
	FROM
		kag_conversion_data
	GROUP BY
		age
)
	SELECT
		*,
        ROUND(Spent / Clicks, 2) AS CPC,
        ROUND(Spent / Total_Conversion, 2) AS CPA
	FROM
		age_groups;

-- Is there a demographic group that responded better to campaigns?

WITH demographic_groups AS (
	SELECT 
		age,
        gender,
		ROUND(SUM(Spent),2) AS Spent,
		SUM(Impressions) AS Impressions,
		SUM(Clicks) AS Clicks,
		SUM(Total_Conversion) AS Total_Conversion
	FROM
		kag_conversion_data
	GROUP BY
        age,
        gender
)
	SELECT
		*,
        ROUND(Spent / Clicks, 2) AS CPC,
        ROUND(Spent / Total_Conversion, 2) AS CPA
	FROM
		demographic_groups
	ORDER BY
		age,
        gender;
        
-- How is the funnel between impressions, clicks, total conversions and approved conversions? At what stage can we improve?

SELECT
	SUM(Clicks) AS Clicks,
    SUM(Total_Conversion) AS Total_Conversions,
    SUM(Approved_Conversion) AS Approved_Conversions
FROM
	kag_conversion_data;

-- Which ads performed best in each campaign? (based on "Total_Conversions")

-- Campaign 916

SELECT
	xyz_campaign_id,
    ad_id,
    Impressions,
    Clicks,
    ROUND(Spent, 2) AS Spent,
    Total_Conversion
FROM
	kag_conversion_data
WHERE
	xyz_campaign_id = 916 and
    Clicks > 1
ORDER BY
	Total_Conversion desc,
    Clicks desc
LIMIT 5;
    
-- Campaign 916

SELECT
	xyz_campaign_id,
    ad_id,
    Impressions,
    Clicks,
    ROUND(Spent, 2) AS Spent,
    Total_Conversion
FROM
	kag_conversion_data
WHERE
	xyz_campaign_id = 936 and
    Clicks > 1
ORDER BY
	Total_Conversion desc,
    Clicks desc
LIMIT 5;

-- Campaign 1178

SELECT
	xyz_campaign_id,
    ad_id,
    Impressions,
    Clicks,
    ROUND(Spent, 2) AS Spent,
    Total_Conversion
FROM
	kag_conversion_data
WHERE
	xyz_campaign_id = 1178 and
    Clicks > 1
ORDER BY
	Total_Conversion desc,
    Clicks desc
LIMIT 5;

-- Which interest brought the best return in terms of total conversion?

WITH interest_result AS (
	SELECT 
		interest,
		SUM(Impressions) AS Impressions,
		SUM(Clicks) AS Clicks,
		ROUND(SUM(Spent),2) AS Spent,
		SUM(Total_Conversion) AS Total_Conversion
	FROM
		kag_conversion_data
	GROUP BY
		interest
	ORDER BY
		 Total_Conversion desc
)
		SELECT
		*,
        ROUND(Spent / Clicks, 2) AS CPC,
        ROUND(Spent / Total_Conversion, 2) AS CPA
	FROM
		interest_result;
    
    
    
    
    
    