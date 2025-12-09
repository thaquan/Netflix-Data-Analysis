USE Netflix;
GO

-- Rename the current table 'netflix_titles' to 'netflix_titles_temp'
EXEC sp_rename 'netflix.netflix_titles', 'netflix_titles_temp';
GO

CREATE TABLE netflix.netflix_titles (
    show_id         VARCHAR(5),
    type            VARCHAR(10),
    title           VARCHAR(250),
    director        VARCHAR(550),
    casts           VARCHAR(1050), -- Standard column name is 'casts'
    country         VARCHAR(550),
    date_added      VARCHAR(55),
    release_year    INT,
    rating          VARCHAR(15),
    duration        VARCHAR(15),
    listed_in       VARCHAR(250),
    description     VARCHAR(550)
);
GO

INSERT INTO netflix.netflix_titles (
    show_id, type, title, director, casts, country, 
    date_added, release_year, rating, duration, listed_in, description
)
SELECT 
    LEFT(show_id, 5),               -- Trim to fit VARCHAR(5)
    LEFT(type, 10),
    LEFT(title, 250),
    LEFT(director, 550),
    LEFT(cast, 1050),               -- Take data from 'cast' column (temp table) into 'casts'
    LEFT(country, 550),
    LEFT(date_added, 55),
    release_year,                   -- Keep original INT value

    -- HANDLE NULL COLUMNS THAT CAUSED ISSUES
    COALESCE(rating, 'NR'),         -- Replace NULL rating with 'NR' (Not Rated)
    COALESCE(duration, 'Unknown'),  -- Replace NULL duration with 'Unknown'

    LEFT(listed_in, 250),
    LEFT(description, 550)
FROM netflix.netflix_titles_temp;   -- Retrieve data from the renamed temp table
GO

SELECT * FROM netflix.netflix_titles;
