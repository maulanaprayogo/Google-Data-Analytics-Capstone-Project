-- Create clean table

CREATE OR REPLACE TABLE cyclistic_trips.2025_trips_clean_V3 AS
SELECT
 *,
 TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length
FROM
  `portfolio-building-486010.cyclistic_trips.2025_trips`
WHERE
  start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL
  AND ended_at > started_at
  AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) BETWEEN 1 AND 1440
  ;
