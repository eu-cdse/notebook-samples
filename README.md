# Copernicus Data Space Ecosystem notebook samples

This repository contains Jupyter notebook samples for the Copernicus Data Space Ecosystem.
Notebook samples are grouped per kernel (sentinelhub, openeo and geo).

## Automated testing
If you want your sample to be automatically tested, add it to the `.tests` file. A GitHub action will pull the
Jupyterlab container and automatically test the listed notebook samples.

## Setting Up Pre-commit Hooks

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

## Jupyter Plugins for Cell Conversion

This repository supports Jupyter notebooks for interactive code execution and documentation. To enhance your notebook editing experience, we recommend using Jupyter plugins that provide cell conversion functionality. These plugins allow you to convert code cells to markdown cells and vice versa, providing flexibility in documentation and code execution.

## Recommended Plugins
We suggest the following Jupyter plugins for cell conversion:

1. Jupyter Notebook: The Jupyter Notebook interface provides built-in functionality for converting cells. You can use the toolbar options or keyboard shortcuts to convert code cells to markdown and vice versa. Refer to the [Jupyter Notebook documentation](https://jupyter-notebook.readthedocs.io/en/stable/) for more details.

2. jupyter_contrib_nbextensions: This plugin extends the capabilities of Jupyter Notebook by providing a collection of useful extensions, including cell conversion options. 