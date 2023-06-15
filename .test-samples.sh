#!/bin/bash
set -x

kernel=$1
container_id=$2

tests_file="${kernel}/.tests"
failed=false

if [ -f "${tests_file}" ]; then
  while read -r sample
  do
    echo "Running ${sample} at $(date)"
    if ! docker exec "${container_id}" jupyter nbconvert --to notebook --execute "/home/jovyan/samples/${kernel}/${sample}" \
                     --stdout --ExecutePreprocessor.kernel_name="${kernel}" --ExecutePreprocessor.timeout=3600;
    then
      failed=true
      echo "Sample ${sample} FAILED at $(date)"
    else
      echo "Sample ${sample} SUCCEEDED at $(date)"
    fi
  done < "${tests_file}"
fi

if [ $failed = false ]; then
  exit 0
else
  exit 1
fi
