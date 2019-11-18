#!/bin/bash

while getopts "d:e:" opt; do
  case $opt in
    d)
      d=${OPTARG}
      ;;
    e)
      e=${OPTARG}
     ;;
    \?)
      echo >&2 "Invalid option: -${OPTARG}"
      show_usage
      exit 1
      ;;
  esac
done

# Apply migrations
/bin/bash flyway.sh -d $d -e $e