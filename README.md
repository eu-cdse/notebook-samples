# Copernicus Data Space Ecosystem: sample notebooks

This repository contains sample Jupyter notebooks for the Copernicus Data Space Ecosystem.

Notebooks are grouped per kernel: `sentinelhub`, `openeo` and `geo`.


## Contributor tips

### Pull request checklist (new)

When contributing changes to the samples, please review the following checklist before opening a pull request.
- Kernel spec metadata was correctly set (check_kernelspec action)
- Tests pass (test-samples action)
- Code is formatted and linted (Python linting action)
- If applicable, documentation has been updated to reflect changes

Extra information about each check can be found below.

### Kernel spec metadata

In case of editing the notebook samples outside the Copernicus Data Space Ecosystem Jupyter notebooks service, make
sure to update the kernel spec (`metadata.kernelspec.name`) before pushing, otherwise the sample will be loaded with the wrong kernel:
* for Sentinelhub kernels, use `sentinelhub`
* for OpenEO samples, use `openeo`
* for generic Geo science kernels, use `geo`

E.g. for OpenEO:

    ...
    "metadata": {
      "kernelspec": {
        "display_name": "OpenEO",
        "language": "python",
        "name": "openeo"
      },
    ...

### Automated testing

To test a sample in CI, add its repository-relative notebook path to the root `.tests` file, one path per line.
The first directory selects the kernel (`geo`, `sentinelhub`, or `openeo`). Keep the full path for nested notebooks,
for example `openeo/python/10_getting-started/getting-started.ipynb`.

CI sets the `openeo` kernelspec on all Python notebooks in the runner's OpenEO checkout. It leaves
non-Python notebooks unchanged and runs only the notebooks listed in `.tests`.

Samples must run without interactive input. For OpenEO, prefer `authenticate_oidc()` over an explicitly interactive
login method: the OpenEO Python client (0.18.0 or newer) uses the client credentials supplied by CI in the
environment. If a notebook needs other credentials, please notify one of the admins.

If you encounter certain notebook samples in the testing pipeline that are failing that were not changed in your pull request.
Please notify the owner of the sample.


### Pre-commit hook

To ensure a consistent code style and formatting in this repository,
we use the [the black code formatter](https://black.readthedocs.io/en/stable/).

We recommend to set up a (git) pre-commit hook,
to automatically run code checks and apply formatting tweaks before each commit.

-   [Install pre-commit](https://pre-commit.com/#installation) on your system,
    for example directly in your development environment with

        pip install pre-commit

-   Install the pre-commit git hook defined by the `.pre-commit-config.yaml` config of this repository:

        pre-commit install

The pre-commit hooks will now run automatically before each commit, checking the code for any style violations and automatically formatting it if needed.


### Other best practices
When S3 credentials are needed for your notebook to access data from CDSE, try to use the CDSE_S3_ACCESS_KEY and CDSE_S3_SECRET_KEY environment variables for authentication when possible. This not only makes it clearer for users that they need to set up these environment variables before running the notebook, but also improves transparency on where and how credentials are used in the code.
