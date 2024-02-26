CREATE OR REPLACE EXTERNAL TABLE `datazoomcamp-deula.ny_taxi.external_green_tripdata`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://dw-zoomcamp-deula/green/green_tripdata_*.parquet']
);

CREATE OR REPLACE TABLE datazoomcamp-deula.ny_taxi.tlc_green_trips AS
SELECT  * FROM datazoomcamp-deula.ny_taxi.external_green_tripdata;


CREATE OR REPLACE EXTERNAL TABLE `datazoomcamp-deula.ny_taxi.external_yellow_tripdata`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://dw-zoomcamp-deula/yellow/yellow_tripdata_*.parquet']
);

CREATE OR REPLACE TABLE datazoomcamp-deula.ny_taxi.tlc_yellow_trips AS
SELECT * FROM datazoomcamp-deula.ny_taxi.external_yellow_tripdata;


CREATE OR REPLACE EXTERNAL TABLE `datazoomcamp-deula.ny_taxi.external_fhv_tripdata`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://dw-zoomcamp-deula/fhv/fhv_tripdata_*.parquet']
);

CREATE OR REPLACE TABLE datazoomcamp-deula.ny_taxi.tlc_fhv_trips AS
SELECT * FROM datazoomcamp-deula.ny_taxi.external_fhv_tripdata;

CREATE OR REPLACE TABLE  `datazoomcamp-deula.trips_data_all.green_tripdata` as
SELECT * FROM `datazoomcamp-deula.ny_taxi.tlc_green_trips`; 

CREATE OR REPLACE TABLE  `datazoomcamp-deula.trips_data_all.yellow_tripdata` as
SELECT * FROM `datazoomcamp-deula.ny_taxi.tlc_yellow_trips`;

CREATE OR REPLACE TABLE  `datazoomcamp-deula.trips_data_all.fhv_tripdata` as
SELECT * FROM `datazoomcamp-deula.ny_taxi.tlc_fhv_trips`;