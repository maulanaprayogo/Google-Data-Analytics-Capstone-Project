
-- weekly ride frequency

SELECT
  member_casual,
  COUNT(*) AS num_rides,
  FORMAT_TIMESTAMP('%A', started_at) AS day_of_week
FROM
  `portfolio-building-486010.cyclistic_trips.2025_trips_clean_V3`
GROUP BY
  member_casuaL,
  day_of_week;

-- hourly ride behavior

SELECT
  member_casual,
  EXTRACT(HOUR FROM started_at) AS time_of_rides,
  COUNT(*) AS num_rides
FROM
 `portfolio-building-486010.cyclistic_trips.2025_trips_clean_V3`
GROUP BY
  member_casual,
  time_of_rides;

-- Average rides per day - member = 6424, casual = 3579

SELECT
  member_casual,
  COUNT(*)/COUNT(DISTINCT DATE(started_at)) AS avg_daily_rides
FROM
  `portfolio-building-486010.cyclistic_trips.2025_trips_clean_V3`
GROUP BY
  member_casual;

-- Average trip duration - member = 11.92 minutes, casual = 21.96 minutes

SELECT
  member_casual,
  AVG(ride_length) AS avg_duration
FROM
  `portfolio-building-486010.cyclistic_trips.2025_trips_clean_V3`
GROUP BY
  member_casual;

-- Top Location

SELECT
  member_casual,
  start_station_name,
  start_lat,
  start_lng,
  COUNT(*) AS num_trips
FROM
  `portfolio-building-486010.cyclistic_trips.2025_trips_clean_V3`
GROUP BY
  member_casual,
  start_station_name,
  start_lat,
  start_lng
ORDER BY
  num_trips DESC;

-- Yearly riding behavior

SELECT
  member_casual,
  source_month,
  COUNT(*) AS num_rides
FROM
  `portfolio-building-486010.cyclistic_trips.2025_trips_clean_V3`
GROUP BY
  source_month,
  member_casual;
