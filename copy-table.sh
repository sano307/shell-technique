#!/usr/bin/env bash

set -eu

usage() {
  cat << EOF
  Usage:
    $0 [target_table] [start_date] [end_date]

  Example:
    $0 materials 20190201 20190228
EOF
}

# Check parameters
if [ $# -ne 3 ]; then
  usage
  exit 1
fi

# Initialize
readonly BASE_DIR=$(dirname $0)
readonly DBM_USER=
readonly DBM_PASSWD=
readonly DBM_HOST=
readonly DBM_NAME=

readonly TARGET_TABLE=$1
readonly START_DATE=$(date +%Y-%m-%d -d "$2")
readonly END_DATE=$(date +%Y-%m-%d -d "$3")

QUERY=$(sed -e "s/\&START_DATE/${START_DATE}/g" \
            -e "s/\&END_DATE/${END_DATE}/g" \
        ${BASE_DIR}/sql/\copy_${TARGET_TABLE}.sql)
