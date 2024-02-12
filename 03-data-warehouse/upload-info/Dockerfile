FROM python:3.9

RUN apt-get install wget
RUN pip install pandas pyarrow google-cloud-storage

WORKDIR /app
COPY upload_data.py upload.py
COPY datazoomcamp-deula-d7a27dbda2b2.json datazoomcamp-deula-d7a27dbda2b2.json

ENTRYPOINT [ "python", "upload.py" ]