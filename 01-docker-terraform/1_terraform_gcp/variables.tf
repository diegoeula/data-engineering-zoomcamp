variable "project"{
    description="Project Location"
    default="datazoomcamp-deula"
}
variable "region"{
    description="Project region"
    default="us-central1"
}


variable "location"{
    description="Project Location"
    default="US"
}


variable "bq_dataset_name"{
    description="My Bigquery Dataset"
    default="demo_dataset"
}

variable "gcs_bucket_name"{
    description="Bucket storage name"
    default= "datazoomcamp-deula-bucket"
}

variable "gcs_storage_class"{
    description="Bucket storage Class"
    default= "STANDARD"
}