
UPDATE country_vaccination_stats
SET daily_vaccinations = COALESCE(m,0) FROM (SELECT country AS c, median(daily_vaccinations) AS m
    FROM country_vaccination_stats
    WHERE country = country_vaccination_stats.country
  	GROUP BY country)
WHERE country_vaccination_stats.daily_vaccinations IS NULL AND country = c;