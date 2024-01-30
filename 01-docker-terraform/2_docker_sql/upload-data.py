#!/usr/bin/env python
# coding: utf-8
import argparse

from time import time

import pandas as pd
from sqlalchemy import create_engine
import os

def main(params):
    user = params.user
    password = params.password
    host = params.host
    port = params.port
    database_name = params.database_name
    table_name = params.table_name
    url = params.url

    csv_name='output.csv'
    os.system(f"wget {url} -O {csv_name}")  # download the file from web to local directory
    engine = create_engine(f'postgresql://{user}:{password}@{host}:{port}/{database_name}')

    df_iter = pd.read_csv(f'{csv_name}',iterator=True, chunksize=100000)
    df = next(df_iter)
    df.lpep_pickup_datetime=pd.to_datetime(df.lpep_pickup_datetime)
    df.lpep_dropoff_datetime=pd.to_datetime(df.lpep_dropoff_datetime)
    df.head(n=0).to_sql(name=table_name,con=engine, if_exists='replace')
    df.to_sql(name=table_name,con=engine, if_exists='append')

    while True:
        t_start = time()
        df= next(df_iter)
        df.lpep_pickup_datetime = pd.to_datetime(df.lpep_pickup_datetime)
        df.lpep_dropoff_datetime = pd.to_datetime(df.lpep_dropoff_datetime)
        df.to_sql(name=table_name,con=engine, if_exists='append')
        t_end = time()
        print('Inserted another chunk. took %.3f second'% (t_end - t_start))
# end main

if __name__ =='__main__':

    parser = argparse.ArgumentParser(description='Ingest CSV data to postgres')

    # user, password, host, port, database_name, table_name, url of the csv
    parser.add_argument('--user',help='user name for postgres')
    parser.add_argument('--password',help='password for postgres')
    parser.add_argument('--host',help='host for postgres')
    parser.add_argument('--port',help='port for postgres')
    parser.add_argument('--database_name',help='database_name for postgres')
    parser.add_argument('--table_name',help='table_name for output table to write results to')
    parser.add_argument('--url',help='url for csv file')


    args = parser.parse_args()
    main(args)

