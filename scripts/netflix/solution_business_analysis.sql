-- Netflix Data Analysis using SQL Server
-- Solutions of 15 business problems

-- 1. Count the number of Movies vs TV Shows

SELECT 
    type,
    COUNT(*) AS total_movies_tv_shows
FROM netflix.netflix_titles
GROUP BY type;

-- 2. Find the most common rating for movies and TV shows

WITH RatingCounts AS (
    SELECT 
        type,
        rating,
        COUNT(*) AS rating_count
    FROM netflix.netflix_titles
    GROUP BY type, rating
),
RankedRatings AS (
    SELECT 
        type,
        rating,
        rating_count,
        RANK() OVER (PARTITION BY type ORDER BY rating_count DESC) AS rank
    FROM RatingCounts
)
SELECT 
    type,
    rating AS most_frequent_rating
FROM RankedRatings
WHERE rank = 1;


-- 3. List all movies released in a specific year (e.g., 2020)

SELECT 
    * 
FROM netflix.netflix_titles
WHERE release_year = 2020;


-- 4. Find the top 5 countries with the most content on Netflix

SELECT TOP 5
    country,
    total_content
FROM (
    SELECT 
        LTRIM(RTRIM(value)) AS country,
        COUNT(*) AS total_content
    FROM netflix. netflix_titles
    CROSS APPLY STRING_SPLIT(country, ',')
    WHERE country IS NOT NULL
    GROUP BY LTRIM(RTRIM(value))
) AS t
WHERE country IS NOT NULL AND country <> ''
ORDER BY total_content DESC;


-- 5.  Identify the longest movie

SELECT TOP 1
    *
FROM netflix.netflix_titles
WHERE type = 'Movie' 
    AND duration IS NOT NULL
ORDER BY CAST(LEFT(duration, CHARINDEX(' ', duration + ' ') - 1) AS INT) DESC;


-- 6. Find content added in the last 5 years

SELECT
    *
FROM netflix. netflix_titles
WHERE date_added IS NOT NULL
    AND date_added >= DATEADD(YEAR, -5, GETDATE());


-- 7. Find all the movies/TV shows by director 'Victor Vu'

SELECT 
    *
FROM (
    SELECT 
        n.*,
        LTRIM(RTRIM(value)) AS director_name
    FROM netflix.netflix_titles n
    CROSS APPLY STRING_SPLIT(director, ',')
    WHERE director IS NOT NULL
) AS t
WHERE director_name = 'Victor Vu';


-- 8. List all TV shows with more than 5 seasons

SELECT 
    *
FROM netflix. netflix_titles
WHERE type = 'TV Show'
    AND duration IS NOT NULL
    AND CAST(LEFT(duration, CHARINDEX(' ', duration + ' ') - 1) AS INT) > 5;


-- 9.  Count the number of content items in each genre

SELECT 
    LTRIM(RTRIM(value)) AS genre,
    COUNT(*) AS total_content
FROM netflix. netflix_titles
CROSS APPLY STRING_SPLIT(listed_in, ',')
WHERE listed_in IS NOT NULL
GROUP BY LTRIM(RTRIM(value))
ORDER BY total_content DESC;


-- 10. Find each year and the average numbers of content release by Vietnam on netflix. 
-- Return top 5 year with highest avg content release! 

SELECT TOP 5 
    country,
    release_year,
    COUNT(show_id) AS total_release,
    ROUND(
        CAST(COUNT(show_id) AS FLOAT) / 
        (SELECT COUNT(show_id) FROM netflix.netflix_titles WHERE country LIKE '%Vietnam%') * 100, 
        2
    ) AS avg_release
FROM netflix.netflix_titles
WHERE country LIKE '%Vietnam%'
GROUP BY country, release_year
ORDER BY avg_release DESC;


-- 11. List all movies that are documentaries

SELECT * 
FROM netflix.netflix_titles
WHERE listed_in LIKE '%Documentaries%';


-- 12. Find all content without a director

SELECT * 
FROM netflix. netflix_titles
WHERE director IS NULL OR director = '';


-- 13.  Find how many movies actor 'Son Tung M-TP' appeared in last 10 years! 

SELECT * 
FROM netflix. netflix_titles
WHERE [cast] LIKE '%Son Tung M-TP%'
    AND release_year > YEAR(GETDATE()) - 10;


-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in Vietnam. 

SELECT TOP 10
    LTRIM(RTRIM(value)) AS actor,
    COUNT(*) AS number_of_movies
FROM netflix.netflix_titles
CROSS APPLY STRING_SPLIT([cast], ',')
WHERE country LIKE '%Vietnam%'
    AND [cast] IS NOT NULL
GROUP BY LTRIM(RTRIM(value))
ORDER BY number_of_movies DESC;


-- 15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
-- the description field. Label content containing these keywords as 'Bad' and all other 
-- content as 'Good'. Count how many items fall into each category.

SELECT 
    category,
    type,
    COUNT(*) AS content_count
FROM (
    SELECT 
        *,
        CASE 
            WHEN [description] LIKE '%kill%' OR [description] LIKE '%violence%' THEN 'Bad'
            ELSE 'Good'
        END AS category
    FROM netflix.netflix_titles
) AS categorized_content
GROUP BY category, type
ORDER BY type, category;


-- End of reports
