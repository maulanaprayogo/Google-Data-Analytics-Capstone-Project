-- Combining 12 month tables into 1 year table

CREATE TABLE cyclistic_trips.2025_trips AS
SELECT *, '2025_01' AS source_month 
FROM `portfolio-building-486010.cyclistic_trips.2025_01_cyclistic_trips`
UNION ALL
SELECT *, '2025_02'
FROM `portfolio-building-486010.cyclistic_trips.2025_02_cyclistic_trips`
UNION ALL
SELECT *, '2025_03'
FROM `portfolio-building-486010.cyclistic_trips.2025_03_cyclistic_trips`
UNION ALL
SELECT *, '2025_04'
FROM `portfolio-building-486010.cyclistic_trips.2025_04_cyclistic_trips`
UNION ALL
SELECT *, '2025_05'
FROM `portfolio-building-486010.cyclistic_trips.2025_05_cyclistic_trips`
UNION ALL
SELECT *, '2025_06'
FROM `portfolio-building-486010.cyclistic_trips.2025_06_cyclistic_trips`
UNION ALL
SELECT *, '2025_07'
FROM `portfolio-building-486010.cyclistic_trips.2025_07_cyclistic_trips`
UNION ALL
SELECT *, '2025_08'
FROM `portfolio-building-486010.cyclistic_trips.2025_08_cyclistic_trips`
UNION ALL
SELECT *, '2025_09'
FROM `portfolio-building-486010.cyclistic_trips.2025_09_cyclistic_trips`
UNION ALL
SELECT *, '2025_10'
FROM `portfolio-building-486010.cyclistic_trips.2025_10_cyclistic_trips`
UNION ALL
SELECT *, '2025_11'
FROM `portfolio-building-486010.cyclistic_trips.2025_11_cyclistic_trips`
UNION ALL
SELECT *, '2025_12'
FROM `portfolio-building-486010.cyclistic_trips.2025_12_cyclistic_trips`
;

-- Count Rows

SELECT
  COUNT(*)
FROM 
  `portfolio-building-486010.cyclistic_trips.2025_trips`;