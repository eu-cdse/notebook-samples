# Copernicus Data Space Ecosystem: sample notebooks

This repository contains sample Jupyter notebooks for the Copernicus Data Space Ecosystem.

Notebooks are grouped per kernel: `sentinelhub`, `openeo` and `geo`.


## Contributor tips

### Automated testing

If you want your sample to be automatically tested, add it to the `.tests` file. A GitHub action will pull the
Jupyterlab container and automatically test the listed notebook samples.


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
