#!/bin/bash

while getopts "d:e:" opt; do
  case $opt in
    d)
      DATABASE=${OPTARG}
      ;;
    e)
      ENVIRONMENT=${OPTARG}
     ;;
    \?)
      echo >&2 "Invalid option: -${OPTARG}"
      show_usage
      exit 1
      ;;
  esac
done

FULL_DATABASE_NAME=${DATABASE}_${ENVIRONMENT}
# Ensure DB exists
psql -d "postgres" -c "CREATE DATABASE $FULL_DATABASE_NAME;"

flyway migrate -configFiles="flyway.conf" -url="jdbc:postgresql://localhost:5432/$FULL_DATABASE_NAME"