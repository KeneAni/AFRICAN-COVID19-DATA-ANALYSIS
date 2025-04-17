select *
from covidafrica..CovidDeaths

select *
from covidafrica..CovidVaccinations

-- TOTAL NUMBER OF COVID19 CASES IN EACH COUNTRY
select location, max(total_cases) as 'TOTAL CASES'
from CovidAfrica..CovidDeaths
group by location 
order by 'TOTAL CASES' desc

-- TOTAL NUMBER OF DEATHS FROM EACH COUNTRY
select location, max(total_deaths) as 'TOTAL DEATHS'
from CovidAfrica..CovidDeaths
group by location
order by 'TOTAL DEATHS' desc

-- HIGHLIGHTING THE DEATH PERCENTAGE AND RECOVERY RATE FOR EACH COUNTRY
select location, max(total_cases) as Total_Cases, max(total_deaths) as Total_Deaths,
case 
when max(total_cases) = 0 then null 
else max(total_deaths)/max(total_cases)*100 end Death_Percentage, 
case
when max(total_cases) = 0 then null 
else (max(total_cases)-max(total_deaths))/max(total_cases)*100 end Recovery_Rate
from CovidAfrica..CovidDeaths
group by location
order by location

-- SHOWING THE NUMBER OF PEOPLE THAT GOT COVID19 IN EACH COUNTRY
select location, avg(population) as Average_Population, max(total_cases) as Total_Cases, max(total_cases)/avg(population)*100 as Infection_Rate
from CovidAfrica..CovidDeaths
group by location
order by Infection_Rate desc

-- SHOWING THE NUMBER OF PEOPLE THAT DIED FROM COVID19 IN EACH COUNTRY
select location, avg(population) as Average_Population, max(total_deaths) as Total_Deaths, max(total_deaths)/avg(population)*100 as Death_Rate
from CovidAfrica..CovidDeaths
group by location
order by Death_Rate desc

-- SHOWING THE TOTAL NUMBER OF PEOPLE TESTED IN EACH COUNTRY
select location, max(new_tests) as New_Tests, max(total_tests) as Total_Tests
from CovidAfrica..CovidVaccinations
group by location
order by Total_Tests desc

-- SHOWING THE TOTAL NUMBER OF PEOPLE VACCINATED IN EACH COUNTRY
select location, max(people_vaccinated) as People_Vaccinated, max(people_fully_vaccinated) as People_Fully_Vaccincated
from CovidAfrica..CovidVaccinations
group by location
order by People_Fully_Vaccincated desc

-- SHOWING THE RELATIONSHIP BETWEEN THE TOTAL DEATHS AND THE FULL VACCINATIONS
select cd.location, max(cd.total_deaths) as Total_Deaths, max(cv.people_fully_vaccinated) as People_Fully_Vaccincated
from CovidAfrica..CovidDeaths as cd
join CovidAfrica..CovidVaccinations as cv
on cd.location = cv.location
group by cd.location
order by cd.location

-- SHOWING THE TIMEFRAME OF THE PANDEMIC IN AFRICA IN MONTHS
select cd.location, datediff(month, '2020-02-08','2021-04-30') as 'Time(Months)', avg(cd.population) as Avergae_Population, max(cd.total_cases) as Total_Cases, max(cd.total_deaths) as Total_Deaths, max(cv.people_fully_vaccinated) as People_Fully_Vaccincated
from CovidAfrica..CovidDeaths as cd
join CovidAfrica..CovidVaccinations as cv
on cd.location = cv.location
group by cd.location
order by cd.location

-- SHOWING THE TREND OF THE PANDEIC IN AFRICA OVER TIME
select cd.location, date as 'Time(Days)', cd.population as Population, cd.total_cases as Total_Cases, cd.total_deaths as Total_Deaths, cv.people_fully_vaccinated as People_Fully_Vaccincated, (cd.total_cases/cd.population)*100 as Infection_Rate
from CovidAfrica..CovidDeaths as cd
join CovidAfrica..CovidVaccinations as cv
on cd.location = cv.location

-- SHOWING THE TREND OF THE PANDEIC IN SELECTED COUNTRIES OVER TIME
-- 1. ALGERIA
select cd.location, date as 'Time(Days)', cd.population as Population, cd.total_cases as Total_Cases, cd.total_deaths as Total_Deaths, cv.people_fully_vaccinated as People_Fully_Vaccincated, (cd.total_cases/cd.population)*100 as Infection_Rate
from CovidAfrica..CovidDeaths as cd
join CovidAfrica..CovidVaccinations as cv
on cd.location = cv.location
where cd.location = 'Algeria'

-- 2. EGYPT
select cd.location, date as 'Time(Days)', cd.population as Population, cd.total_cases as Total_Cases, cd.total_deaths as Total_Deaths, cv.people_fully_vaccinated as People_Fully_Vaccincated, (cd.total_cases/cd.population)*100 as Infection_Rate
from CovidAfrica..CovidDeaths as cd
join CovidAfrica..CovidVaccinations as cv
on cd.location = cv.location
where cd.location = 'Egypt'

-- 3. MALI
select cd.location, date as 'Time(Days)', cd.population as Population, cd.total_cases as Total_Cases, cd.total_deaths as Total_Deaths, cv.people_fully_vaccinated as People_Fully_Vaccincated, (cd.total_cases/cd.population)*100 as Infection_Rate
from CovidAfrica..CovidDeaths as cd
join CovidAfrica..CovidVaccinations as cv
on cd.location = cv.location
where cd.location = 'Mali'

-- 4. NIGERIA
select cd.location, date as 'Time(Days)', cd.population as Population, cd.total_cases as Total_Cases, cd.total_deaths as Total_Deaths, cv.people_fully_vaccinated as People_Fully_Vaccincated, (cd.total_cases/cd.population)*100 as Infection_Rate
from CovidAfrica..CovidDeaths as cd
join CovidAfrica..CovidVaccinations as cv
on cd.location = cv.location
where cd.location = 'Nigeria'

-- 5. CHAD
select cd.location, date as 'Time(Days)', cd.population as Population, cd.total_cases as Total_Cases, cd.total_deaths as Total_Deaths, cv.people_fully_vaccinated as People_Fully_Vaccincated, (cd.total_cases/cd.population)*100 as Infection_Rate
from CovidAfrica..CovidDeaths as cd
join CovidAfrica..CovidVaccinations as cv
on cd.location = cv.location
where cd.location = 'Chad'

-- 6. DEMOCRATIC REPUBLIC OF CONGO
select cd.location, date as 'Time(Days)', cd.population as Population, cd.total_cases as Total_Cases, cd.total_deaths as Total_Deaths, cv.people_fully_vaccinated as People_Fully_Vaccincated, (cd.total_cases/cd.population)*100 as Infection_Rate
from CovidAfrica..CovidDeaths as cd
join CovidAfrica..CovidVaccinations as cv
on cd.location = cv.location
where cd.location = 'Democratic Republic of Congo'

-- 7. ETHIOPIA
select cd.location, date as 'Time(Days)', cd.population as Population, cd.total_cases as Total_Cases, cd.total_deaths as Total_Deaths, cv.people_fully_vaccinated as People_Fully_Vaccincated, (cd.total_cases/cd.population)*100 as Infection_Rate
from CovidAfrica..CovidDeaths as cd
join CovidAfrica..CovidVaccinations as cv
on cd.location = cv.location
where cd.location = 'Ethiopia'

-- 8. KENYA
select cd.location, date as 'Time(Days)', cd.population as Population, cd.total_cases as Total_Cases, cd.total_deaths as Total_Deaths, cv.people_fully_vaccinated as People_Fully_Vaccincated, (cd.total_cases/cd.population)*100 as Infection_Rate
from CovidAfrica..CovidDeaths as cd
join CovidAfrica..CovidVaccinations as cv
on cd.location = cv.location
where cd.location = 'Kenya'

-- 9. BOTSWANA
select cd.location, date as 'Time(Days)', cd.population as Population, cd.total_cases as Total_Cases, cd.total_deaths as Total_Deaths, cv.people_fully_vaccinated as People_Fully_Vaccincated, (cd.total_cases/cd.population)*100 as Infection_Rate
from CovidAfrica..CovidDeaths as cd
join CovidAfrica..CovidVaccinations as cv
on cd.location = cv.location
where cd.location = 'Botswana'

-- 10. SOUTH AFRICA
select cd.location, date as 'Time(Days)', cd.population as Population, cd.total_cases as Total_Cases, cd.total_deaths as Total_Deaths, cv.people_fully_vaccinated as People_Fully_Vaccincated, (cd.total_cases/cd.population)*100 as Infection_Rate
from CovidAfrica..CovidDeaths as cd
join CovidAfrica..CovidVaccinations as cv
on cd.location = cv.location
where cd.location = 'South Africa'



