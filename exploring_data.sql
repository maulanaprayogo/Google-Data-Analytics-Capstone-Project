-- Inspect Columns

SELECT *
FROM `portfolio-building-486010.cyclistic_trips.2025_trips`
LIMIT 10;

>>> no consistency problem detected. null values detected

-- Check Membership Consistency - resulting in 2 kinds of membership : (1) member (2) casual

SELECT
  DISTINCT member_casual
FROM
  `portfolio-building-486010.cyclistic_trips.2025_trips`;

-- Checking for Duplicates - found 0 duplicates

SELECT
  ride_id,
  COUNT(*)
FROM
  `portfolio-building-486010.cyclistic_trips.2025_trips`
GROUP BY
  ride_id
HAVING 
  COUNT(*) > 1;

-- Check for NULL timestamp - no NULL start/end found

SELECT
  COUNTIF(started_at IS NULL) AS null_start,
  COUNTIF(ended_at IS NULL) AS null_end
FROM
  `portfolio-building-486010.cyclistic_trips.2025_trips`;


-- Check for time logical consistency - 29 illogical time found

SELECT
  COUNT(*)
FROM
  `portfolio-building-486010.cyclistic_trips.2025_trips`
WHERE
  ended_at < started_at;

-- Checking ride duration (min, max) - min = -54, max = 1574

SELECT
  MIN(ride_length) AS min_ride,
  MAX(ride_length) AS max_ride
FROM(
  SELECT
    ride_id,
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length
  FROM
    `portfolio-building-486010.cyclistic_trips.2025_trips`
    );

-- Check for missing stations - 1184673 NULL start station name and 1243305 NULL end station name found

SELECT
  COUNTIF(start_station_name IS NULL) AS null_start_station,
  COUNTIF(end_station_name IS NULL) AS null_end_station
FROM
  `portfolio-building-486010.cyclistic_trips.2025_trips`;

-- Checking start coordinates - all start coordinate is good

SELECT 
  COUNT(*)
FROM 
  `portfolio-building-486010.cyclistic_trips.2025_trips`
WHERE 
  start_lat NOT BETWEEN -90 AND 90
  OR start_lng NOT BETWEEN -180 AND 180;

-- Checking end coordinates - all end coordinate is good

SELECT 
  COUNT(*)
FROM 
  `portfolio-building-486010.cyclistic_trips.2025_trips`
WHERE 
  end_lat NOT BETWEEN -90 AND 90
  OR end_lng NOT BETWEEN -180 AND 180;
