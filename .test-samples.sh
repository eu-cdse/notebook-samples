#!/bin/bash
set -x

kernel=$1
container_id=$2

tests_file="${kernel}/.tests"
failed=false

if [ -f "${tests_file}" ]; then
  while read -r sample
  do
    # TODO: The Jupyterlab kernels are conda based: can we install requirements in there instead of this `pip --user` hack?
    docker exec "${container_id}" pip install --user -r "/home/jovyan/samples/requirements.txt"

    echo "Running ${sample} at $(date)"
    if ! docker exec "${container_id}" jupyter nbconvert --to notebook --execute "/home/jovyan/samples/${kernel}/${sample}" \
                     --ExecutePreprocessor.kernel_name="${kernel}" --ExecutePreprocessor.timeout=3600;
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
