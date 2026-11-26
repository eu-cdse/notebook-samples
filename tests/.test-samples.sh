#!/bin/bash
set -euo pipefail

kernel=$1
container_id=$2
repo_dir=$3

tests_file="${repo_dir}/.tests"
failed=false
found=false

if [[ ! -f "${tests_file}" ]]; then
  echo "Notebook test manifest not found: ${tests_file}" >&2
  exit 1
fi

while IFS= read -r sample || [[ -n "${sample}" ]]; do
  [[ "${sample}" == "${kernel}/"*.ipynb ]] || continue
  found=true
  echo "Running ${sample} at $(date)"
  kernelspec=$(docker exec "${container_id}" python -c \
    'import json, sys; print(json.load(open(sys.argv[1])).get("metadata", {}).get("kernelspec"))' \
    "/home/jovyan/samples/${sample}" 2>/dev/null) || kernelspec="unavailable"
  echo "Kernelspec of ${sample}: ${kernelspec}"
  if docker exec "${container_id}" jupyter nbconvert --to notebook --execute "/home/jovyan/samples/${sample}" \
                  --ExecutePreprocessor.kernel_name="${kernel}" --ExecutePreprocessor.timeout=3600; then
    echo "Sample ${sample} SUCCEEDED at $(date)"
  else
    failed=true
    echo "Sample ${sample} FAILED at $(date)"
  fi
done < "${tests_file}"

if [[ "${found}" == false ]]; then
  echo "No notebooks listed for kernel '${kernel}' in ${tests_file}" >&2
  exit 1
fi

[[ "${failed}" == false ]]
