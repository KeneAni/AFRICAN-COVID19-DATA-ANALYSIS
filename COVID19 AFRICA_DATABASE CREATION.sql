-- CREATE DATABASE FOR COVID19 IN AFRICA
create database if not exists CovidAfrica;

use CovidAfrica;

create table coviddeaths
(
iso_code text(22256),
continent text(22256),
location text(22256),
date_ date,
population int,
total_cases int,
new_cases int,
new_cases_smoothed double,
total_deaths int,
new_deaths int,
new_deaths_smoothed double,
total_cases_per_million double,
new_cases_per_million double,
new_cases_smoothed_per_million double,
total_deaths_per_million double,
new_deaths_per_million double,
new_deaths_smoothed_per_million double,
reproduction_rate double,
icu_patients int,
icu_patients_per_million double,
hosp_patients int,
hosp_patients_per_million double,
weekly_icu_admissions int,
weekly_icu_admissions_per_million double,
weekly_hosp_admissions int,
weekly_hosp_admissions_per_million double
);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\CovidDeaths_Africa.csv" into table coviddeaths
fields terminated by ','
ignore 1 rows;

create table covidvaccinations
(
iso_code text,
continent text,
location text,
date_ date,
new_tests double,
total_tests double,
total_tests_per_thousand double,
new_tests_per_thousand double,
new_tests_smoothed double,
new_tests_smoothed_per_thousand double,
positive_rate double,
tests_per_case double,
tests_units double,
total_vaccinations double,
people_vaccinated double,
people_fully_vaccinated double,
new_vaccinations double,
new_vaccinations_smoothed double,
total_vaccinations_per_hundred double,
people_vaccinated_per_hundred double,
people_fully_vaccinated_per_hundred double,
new_vaccinations_smoothed_per_million double,
stringency_index double,
population_density double,
median_age double,
aged_65_older double,
aged_70_older double,
gdp_per_capita double,
extreme_poverty double,
cardiovasc_death_rate double,
diabetes_prevalence double,
female_smokers double,
male_smokers double,
handwashing_facilities double,
hospital_beds_per_thousand double,
life_expectancy double,
human_development_index double
);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\CovidVaccinations_Africa.csv" into table covidvaccinations
fields terminated by ','
ignore 1 rows;

select * from coviddeaths;
select * from covidvaccinations;

