#!/bin/bash
set -euo pipefail

repo_dir=$1
openeo_dir="${repo_dir}/openeo"

find "${openeo_dir}" -type f -name '*.ipynb' \
  -exec python3 "${repo_dir}/tests/set_kernelspec.py" {} +

# The container user needs to write notebook outputs beside the samples.
chmod -R a+rwX -- "${openeo_dir}"
