# Netflix Data Analysis 📺

![Netflix Logo](docs/logo.png)

## 📊 Project Overview

This project provides a comprehensive SQL-based analysis of Netflix content data using T-SQL (Transact-SQL). The repository contains scripts for database setup, data cleaning, and solving 15 business-oriented analytical problems to gain insights into Netflix's content catalog.

## 🗂️ Repository Structure

```
Netflix-Data-Analysis/
├── datasets/
│   └── netflix_titles.csv          # Raw Netflix content data
├── docs/
│   └── logo.png                     # Project logo
├── scripts/
│   ├── init_database.sql            # Database and schema creation
│   └── netflix/
│       ├── create_netflix_titles.sql              # Table DDL scripts
│       ├── modify_fix_data_type_after_import.sql  # Data type corrections
│       ├── handle_missing_data.sql                # Data cleaning operations
│       ├── business problems. sql                  # List of 15 analytical questions
│       └── solution_business_analysis.sql         # Solutions to business problems
```

## 🎯 Business Problems Solved

This project addresses 15 key business questions: 

1. **Content Distribution**:  Count the number of Movies vs TV Shows
2. **Rating Analysis**: Find the most common rating for movies and TV shows
3. **Release Year Filter**: List all movies released in a specific year (e.g., 2020)
4. **Geographic Analysis**: Find the top 5 countries with the most content on Netflix
5. **Duration Analysis**: Identify the longest movie
6. **Recent Content**: Find content added in the last 5 years
7. **Director Search**: Find all movies/TV shows by specific directors (e.g., 'Victor Vu')
8. **Series Analysis**: List all TV shows with more than 5 seasons
9. **Genre Distribution**: Count the number of content items in each genre
10. **Country Performance**: Analyze yearly average content release by country
11. **Documentary Filter**: List all movies that are documentaries
12. **Data Quality**: Find all content without a director
13. **Actor Analysis**: Track actor appearances over time (e.g., 'Son Tung M-TP')
14. **Top Actors**: Find the top 10 actors in Vietnamese productions
15. **Content Categorization**: Categorize content based on keywords ('kill', 'violence')

## 🚀 Getting Started

### Prerequisites

- Microsoft SQL Server (2016 or later)
- SQL Server Management Studio (SSMS) or Azure Data Studio
- Basic knowledge of T-SQL

### Installation & Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/thaquan/Netflix-Data-Analysis.git
   cd Netflix-Data-Analysis
   ```

2. **Create the database**
   ```sql
   -- Run the initialization script
   -- WARNING: This will drop the Netflix database if it exists
   -- Execute:  scripts/init_database.sql
   ```

3. **Create tables**
   ```sql
   -- Execute: scripts/netflix/create_netflix_titles.sql
   ```

4. **Import data**
   - Import `datasets/netflix_titles.csv` into the `netflix. netflix_titles` table
   - Use SQL Server Import/Export Wizard or BULK INSERT command

5. **Fix data types and clean data**
   ```sql
   -- Execute: scripts/netflix/modify_fix_data_type_after_import.sql
   -- Execute: scripts/netflix/handle_missing_data.sql
   ```

6. **Run analytics**
   ```sql
   -- Execute: scripts/netflix/solution_business_analysis.sql
   ```

## 📋 Database Schema

### Table: `netflix.netflix_titles`

| Column        | Data Type     | Description                          |
|---------------|---------------|--------------------------------------|
| show_id       | VARCHAR(5)    | Unique identifier for each title     |
| type          | VARCHAR(10)   | Movie or TV Show                     |
| title         | VARCHAR(250)  | Title of the content                 |
| director      | VARCHAR(550)  | Director(s) of the content           |
| casts         | VARCHAR(1050) | Cast members                         |
| country       | VARCHAR(550)  | Country/countries of production      |
| date_added    | VARCHAR(55)   | Date added to Netflix                |
| release_year  | INT           | Year of release                      |
| rating        | VARCHAR(15)   | Content rating (TV-MA, PG-13, etc.)  |
| duration      | VARCHAR(15)   | Duration (minutes or seasons)        |
| listed_in     | VARCHAR(250)  | Genres/categories                    |
| description   | VARCHAR(550)  | Content description                  |

## 🔍 Key Features

- **Comprehensive Data Cleaning**: Handles NULL values, standardizes whitespace, and fixes data type issues
- **Advanced SQL Techniques**: Uses CTEs, window functions, STRING_SPLIT, and ranking functions
- **Business-Focused Analytics**: Addresses real-world questions about content distribution and trends
- **Scalable Design**: Schema and scripts designed for easy extension and modification

## 📈 Sample Insights

- Analysis of content distribution across different countries
- Trending genres and content categories
- Director and actor performance metrics
- Content rating patterns for movies vs TV shows
- Historical trends in content additions

## ⚠️ Important Notes

- Running `init_database.sql` will **drop the existing Netflix database** if it exists.  Ensure you have backups!
- The data cleaning scripts handle NULL values by replacing them with default values ('Unknown', 'NR', etc.)
- Some columns contain comma-separated values (e.g., country, director, listed_in) and require `STRING_SPLIT` for analysis

## 🛠️ Technologies Used

- **Database**: Microsoft SQL Server
- **Language**: T-SQL (Transact-SQL)
- **Tools**: SQL Server Management Studio (SSMS)

## 📝 License

This project is available for educational and analytical purposes. 

## 👤 Author

**thaquan**
- GitHub: [@thaquan](https://github.com/thaquan)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!  Feel free to check the [issues page](https://github.com/thaquan/Netflix-Data-Analysis/issues).

---

⭐ If you found this project helpful, please consider giving it a star! 
```
