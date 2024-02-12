--Environment
-- Creating external table referring to gcs path
CREATE OR REPLACE EXTERNAL TABLE `datazoomcamp-deula.ny_taxi.external_green_tripdata`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://dw-zoomcamp-deula/green/green_tripdata_2022-*.parquet']
);

--Question 1:
SELECT count(*) FROM datazoomcamp-deula.ny_taxi.external_green_tripdata;


--Question 2:
-- Create a non partitioned table from external table
CREATE OR REPLACE TABLE datazoomcamp-deula.ny_taxi.green_tripdata_non_partitoned AS
SELECT * FROM datazoomcamp-deula.ny_taxi.external_green_tripdata;

--SELECT count(*) FROM datazoomcamp-deula.ny_taxi.green_tripdata_non_partitoned;

--Query scans 0 MB
SELECT DISTINCT(PULocationID)
FROM datazoomcamp-deula.ny_taxi.external_green_tripdata;
--Query scans 6.41 MB
SELECT DISTINCT(PULocationID)
FROM datazoomcamp-deula.ny_taxi.green_tripdata_non_partitoned;

--Question 3:
SELECT COUNT(*)
FROM datazoomcamp-deula.ny_taxi.green_tripdata_non_partitoned
where fare_amount=0;


--Question 4:
-- Creating a partition and cluster table
CREATE OR REPLACE TABLE datazoomcamp-deula.ny_taxi.green_tripdata_partitoned_clustered
PARTITION BY DATE(lpep_pickup_datetime)
CLUSTER BY PUlocationID AS
SELECT * FROM datazoomcamp-deula.ny_taxi.external_green_tripdata;

--Question 5:
-- Query scans 12.82 MB
SELECT DISTINCT(PULocationID) as trips
FROM datazoomcamp-deula.ny_taxi.green_tripdata_non_partitoned
WHERE DATE(lpep_pickup_datetime) BETWEEN '2022-06-01' AND '2022-06-30';


-- Query scans 1.12 MB
SELECT DISTINCT(PULocationID) as trips
FROM datazoomcamp-deula.ny_taxi.green_tripdata_partitoned_clustered
WHERE DATE(lpep_pickup_datetime) BETWEEN '2022-06-01' AND '2022-06-30';
