  SELECT *
FROM ProtfolioProject.coviddeaths 
order by 3, 4 ; 


  SELECT *
FROM ProtfolioProject.covidvaccine 
order by 3, 4 ; 


-- Select data that we are going to be using

SELECT location, date, population, total_cases, new_cases, total_deaths
FROM ProtfolioProject.coviddeaths ;

-- Looking at Totla Cases vs Total Deaths
-- Show likehood of dying if you contract covid in your country

SELECT location, date, total_cases,  total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM ProtfolioProject.coviddeaths 
WHERE location like '%states%'
order by 1, 2 ;


-- Looking at the total Cases vs Population
-- Show what percent of population got covid 

SELECT location,date,population,total_cases,total_deaths, (total_deaths/population)*100 as DeathPercentage
FROM ProtfolioProject.coviddeaths 
-- WHERE location like '%states%'
order by 1, 2 ;

-- Loking ate countaries with highest Infection Rate compared to population

SELECT location,population, MAX(total_cases) as HiighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
FROM ProtfolioProject.coviddeaths 
-- WHERE location like '%states%'
Group by location, Population
order by PercentPopulationInfected desc;


-- Showing Countries with Highest Death Count per Population

SELECT location, MAX(Total_deaths) as TotalDeathCount
FROM ProtfolioProject.coviddeaths 
-- WHERE location like '%states%'
Group by location
order by TotalDeathCount  desc;



-- Showing Countries with Highest Death Count per Population

SELECT location, MAX(Total_deaths) AS TotaldeathCount
FROM ProtfolioProject.coviddeaths 
Where continent is not null
GROUP BY location
ORDER BY TotaldeathCount DESC;


-- LETS BFREAK THINGS DOWN BY CONTINENTS
SELECT continent, MAX(Total_deaths) AS TotaldeathCount
FROM ProtfolioProject.coviddeaths 
Where continent is not null AND continent != ''
GROUP BY continent
ORDER BY TotaldeathCount DESC;

-- CLOBAL NUMBERS

SELECT SUM(new_cases) as Totalnewcases, SUM(new_deaths ) as Totalnewdeaths, SUM(new_deaths)/SUM(new_cases)*100 as DeathPercentage
FROM ProtfolioProject.coviddeaths 
-- WHERE location like '%states%'
where continent is not null
-- Group by date
order by 1,2 ;
 
-- Looking at lotal Population vs Vaccinations  

SELECT dea.continent , dea.location, dea.date, dea.population, vac.new_vaccinations
From ProtfolioProject.coviddeaths dea
Join ProtfolioProject.covidvaccation19 vac
     on dea.location = vac.location
	 and dea.date = vac.date 


-- Creating View to store data for later Vaccinations  








