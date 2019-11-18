#!/bin/bash

while getopts ":db:env:" opt; do
  case $opt in
    db)
      DATABASE=${OPTARG}
      ;;
    env)
      ENVIRONMENT=${OPTARG}
     ;;
    \?)
      echo >&2 "Invalid option: -${OPTARG}"
      show_usage
      exit 1
      ;;
  esac
done

echo "env variable in flyway.sh: $env"
echo "ENVIRONMENT variable in flyway.sh: $ENVIRONMENT"
flyway migrate -configFiles="flyway.conf" -url="jdbc:postgresql://localhost:5432/$DATABASE-$ENVIRONMENT"