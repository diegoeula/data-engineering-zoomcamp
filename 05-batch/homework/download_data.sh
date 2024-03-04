
set -e

TAXI_TYPE=$1 # "fhv"
YEAR=$2 # 2019
MONTH=$3 # 10

URL_PREFIX="https://github.com/DataTalksClub/nyc-tlc-data/releases/download"
FMONTH=`printf "%02d" ${MONTH}`

URL="${URL_PREFIX}/${TAXI_TYPE}/${TAXI_TYPE}_tripdata_${YEAR}-${FMONTH}.csv.gz"

LOCAL_PREFIX="data/raw/${TAXI_TYPE}/${YEAR}/${FMONTH}"
LOCAL_FILE="${TAXI_TYPE}_tripdata_${YEAR}_${FMONTH}.csv.gz"
LOCAL_PATH="${LOCAL_PREFIX}/${LOCAL_FILE}"

echo "downloading ${URL} to ${LOCAL_PATH}"
mkdir -p ${LOCAL_PREFIX}
wget ${URL} -O ${LOCAL_PATH}

URL="${URL_PREFIX}/misc/taxi_zone_lookup.csv"
LOCAL_PREFIX="data/raw/zones"
LOCAL_FILE="taxi_zone_lookup.csv"
LOCAL_PATH="${LOCAL_PREFIX}/${LOCAL_FILE}"
mkdir -p ${LOCAL_PREFIX}
wget ${URL} -O ${LOCAL_PATH}

