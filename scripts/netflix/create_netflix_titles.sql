/*
===============================================================================
DDL Script: Create Netflix Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'netflix' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'netflix' Tables
===============================================================================
*/


IF OBJECT_ID('netflix.netflix_titles', 'U') IS NOT NULL
    DROP TABLE netflix.netflix_titles;
GO

CREATE TABLE netflix.netflix_titles (
    show_id			VARCHAR(5),
	type			VARCHAR(10),
	title			VARCHAR(250),
	director		VARCHAR(550),
	casts			VARCHAR(1050),
	country			VARCHAR(550),
	date_added		VARCHAR(55),
	release_year	INT,
	rating			VARCHAR(15),
	duration		VARCHAR(15),
	listed_in		VARCHAR(250),
	description		VARCHAR(550)
);



