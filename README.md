# Copernicus Data Space Ecosystem notebook samples

This repository contains Jupyter notebook samples for the Copernicus Data Space Ecosystem.
Notebook samples are grouped per kernel (sentinelhub, openeo and geo).

## Automated testing
If you want your sample to be automatically tested, add it to the `.tests` file. A GitHub action will pull the
Jupyterlab container and automatically test the listed notebook samples.

## Pre-commit Hooks recommendation for contributor

To ensure consistent code style and formatting in this repository, we recommend setting up pre-commit hooks. These hooks automatically run code checks and formatting before each commit, helping maintain a clean and consistent codebase.

### Installation

To install the pre-commit hooks, follow these steps:

1. Make sure you have Python and pip installed on your system.
2. Open a terminal or command prompt and navigate to the root directory of the repository.
3. Run the following command to install the necessary packages:

`pip install pre-commit`

### Setting up Hooks
Once the pre-commit package is installed, you can set up the pre-commit hooks defined in this repository.

1. Run the following command to install and set up the hooks:
   
   `pre-commit install`

    This command installs the pre-commit hooks defined in the .pre-commit-config.yaml file located in the root directory of the repository.

The pre-commit hooks will now run automatically before each commit, checking the code for any style violations and automatically formatting it if needed.
