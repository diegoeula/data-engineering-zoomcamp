1. Introduction to Docker

```bash
docker run -it ubuntu bash
```

```bash
docker run -it --entrypoint=bash python:3.9
```


```bash
docker build -t test:pandas .
```


```bash
docker run -it test:pandas
```

```bash
docker run -it test:pandas 2024-01-30
```

2. Ingesting NY Taxi Data to Postgres

docker compose up -d

pip install psycopg-binary pgcli

pgcli -h localhost -p 5432 -u root -d ny_taxi


select 1;


df.tpep_pickup_datetime=pd.to_datetime(df.tpep_pickup_datetime)
df.tpep_dropoff_datetime=pd.to_datetime(df.tpep_dropoff_datetime)


select count(1) from yellow_taxi_data;