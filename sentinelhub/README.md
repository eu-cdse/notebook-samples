# Sentinel Hub

This folder contains sample Jupyter notebooks demonstrating how to access and process
Earth observation data with the [Sentinel Hub APIs](https://documentation.dataspace.copernicus.eu/APIs/SentinelHub.html)
in the Copernicus Data Space Ecosystem (CDSE).

All notebooks are designed to run on the CDSE Jupyter notebooks service using the
`sentinelhub` kernel. See the [repository README](../README.md) for details on kernel
spec metadata, automated testing and contributing.

## Contents

### `getting_started/`
Introductory notebooks covering the core Sentinel Hub APIs and workflows:
- [introduction_to_SH_APIs.ipynb](getting_started/introduction_to_SH_APIs.ipynb) — overview of the Sentinel Hub APIs.
- [data_download_process_request.ipynb](getting_started/data_download_process_request.ipynb) — download and process data with the Process API.
- [cloudless_process_api.ipynb](getting_started/cloudless_process_api.ipynb) — build cloud-free composites.
- [from_browser_to_jupyter.ipynb](getting_started/from_browser_to_jupyter.ipynb) — move from the Sentinel Hub browser to code.
- [migration_from_scihub_guide.ipynb](getting_started/migration_from_scihub_guide.ipynb) — guide for users migrating from SciHub.
- [xcube_on_CDSE.ipynb](getting_started/xcube_on_CDSE.ipynb) — working with xcube on CDSE.
- [custom_scripts/](getting_started/custom_scripts/) — interactive introduction to evalscripts.
- [statistical_api/](getting_started/statistical_api/) — time-series and advanced visualisations with the Statistical API.

### `data_integration/`
Combining Sentinel Hub with third-party data sources:
- [CLMS_data_with_Process_Statistical_APIs.ipynb](data_integration/CLMS_data_with_Process_Statistical_APIs.ipynb) — Copernicus Land Monitoring Service data.
- [ERA5_data_access.ipynb](data_integration/ERA5_data_access.ipynb) — ERA5 climate reanalysis data.

### `use_cases/`
End-to-end examples applying Sentinel Hub to real-world problems:
- [air_pollution_statistics.ipynb](use_cases/air_pollution_statistics.ipynb)
- [deforestation_monitoring_with_xarray.ipynb](use_cases/deforestation_monitoring_with_xarray.ipynb)
- [ice_monitoring.ipynb](use_cases/ice_monitoring.ipynb)
- [soil_erosion_risk.ipynb](use_cases/soil_erosion_risk.ipynb)

### `workshops/`
Notebooks presented at conferences and workshops, organised by year ([2024](workshops/2024/),
[2025](workshops/2025/), [2026](workshops/2026/)).

### Supporting files
- [data/](data/) — geometries (GeoJSON) and sample assets used by the notebooks.
- [utils.py](utils.py) — shared helper functions (e.g. image plotting).

## Getting started

To run these notebooks you need a CDSE account. Most examples authenticate with your
CDSE credentials via OAuth. For an introduction to authentication and the APIs, start
with [getting_started/introduction_to_SH_APIs.ipynb](getting_started/introduction_to_SH_APIs.ipynb).

## Useful links
- [Sentinel Hub documentation](https://documentation.dataspace.copernicus.eu/APIs/SentinelHub.html)
- [Copernicus Data Space Ecosystem](https://dataspace.copernicus.eu/)
- [sentinelhub-py library](https://sentinelhub-py.readthedocs.io/)
- [CDSE community forum](https://forum.dataspace.copernicus.eu/)
