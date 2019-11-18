#!/bin/bash

while getopts "d:e:" opt; do
  case $opt in
    d)
      db=${OPTARG}
      ;;
    e)
      env=${OPTARG}
     ;;
    \?)
      echo >&2 "Invalid option: -${OPTARG}"
      show_usage
      exit 1
      ;;
  esac
done

# Apply migrations
/bin/bash flyway.sh -d $db -e $env