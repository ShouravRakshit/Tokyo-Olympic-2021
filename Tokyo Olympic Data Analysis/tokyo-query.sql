-- SELECT * FROM athletes WHERE Country LIKE '%�%';

-- Top 5 countries with the most athletes

SELECT TOP 5 Country, COUNT(*) AS total_athletes
FROM athletes
GROUP BY Country
ORDER BY COUNT(*) DESC;

-- Top 5 Countries with most numbers of coaches
SELECT TOP 5 Country, COUNT(*) AS number_of_coaches
FROM Coaches
GROUP BY Country
ORDER BY number_of_coaches DESC;

-- Top 5 countries with coaches that won the most medals
SELECT TOP 5 c.Country, COUNT(DISTINCT c.Name) as number_of_coaches, m.Gold, m.Silver, m.Bronze, m.Total
FROM Coaches c
JOIN Medals m ON c.Country = m.Team_Country
GROUP BY c.Country, m.Gold, m.Silver, m.Bronze, m.Total
ORDER BY m.Total DESC;

-- top 5 Countries with the highest total medal count
SELECT TOP 5 Team_Country, Total
FROM medals
ORDER BY Total DESC;


-- countries that participated in team events but didn't win any medals
SELECT DISTINCT t.Country
FROM teams t
LEFT JOIN medals m ON t.Country = m.Team_Country
WHERE m.Team_Country IS NULL;
