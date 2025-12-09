-- 1. Delete trash rows (if any row has show_id as NULL, then delete it)
DELETE FROM netflix.netflix_titles 
WHERE show_id IS NULL;

-- 2. Replace NULL values with default values (if needed)
-- Example: If rating is missing, set it to 'Unknown'; if duration is missing, set it to '0 min'
UPDATE netflix.netflix_titles
SET rating = 'Unknown'
WHERE rating IS NULL;

UPDATE netflix.netflix_titles
SET duration = '0 min'
WHERE duration IS NULL;

-- 3. Standardize whitespaces (Trim) for important columns
UPDATE netflix.netflix_titles
SET 
    title = LTRIM(RTRIM(title)),
    date_added = LTRIM(RTRIM(date_added)),
    rating = LTRIM(RTRIM(rating));
