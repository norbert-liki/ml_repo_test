# Standard data/ML project template

Template for projects to make them more standardized and resusable.

Template features:
- standardized folder structure
- python development within notebooks powered by [nbdev](http://nbdev.fast.ai/tutorial/index.html)
- terraform templates to deploy your project easily
- built-in templates and tutorials for quick references
- handy command line commands defined with Make
- templates to deploy Cloud Build tests for the developed Python package
- git hooks for automatic python linting and formating with flake8, black powered by [pre-commit](https://pre-commit.com/#cli)
- git hooks for notebook checks and cleaning by [nbdev](http://nbdev.fast.ai/tutorial/index.html)

### Environment creation

Upon creating the project folder you can create separate environment for development:
```bash
    make create_environment # creates the python environment with the selected package manager
    make requirements # installs the contents of the requirements.txt or yml. Also install your package to make it importable.
    nbdev_build_lib # if you would like to develop your project with notebooks, then this commands sets up your module for that
```

## Continous integration setup

In order to utilize Cloud Build tests for you repository take the following steps:
1. authorize the Cloud Build app within GitHub to your repository. Collect your installationId.
2. Put the installationId in the cloudbuily*.yaml files in the root of the repository. Customize if needed.
3. Customize and run the Cloud Build triggers with the __scripts/build-triggers.sh/.deploy-triggers.sh__ script.

### The resulting directory structure
------------

The directory structure of your new project looks like this: 

```
├── LICENSE
├── Makefile           <- Makefile with commands like `make data` or `make train`
├── README.md          <- The top-level README for developers using this project.
├── data
│   ├── external       <- Data from third party sources.
│   ├── interim        <- Intermediate data that has been transformed.
│   ├── processed      <- The final, canonical data sets for modeling.
│   └── raw            <- The original, immutable data dump.
│
├── models             <- Trained and serialized models, model predictions, or model summaries
│
├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
│                         the creator's initials, and a short `-` delimited description, e.g.
│                         `1.0-jqp-initial-data-exploration`.
|                         Notebooks stored here can be used to develop he library using nbdev commands.
│
├── references         <- Data dictionaries, manuals, tutorials and all other explanatory materials.
│
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
│   └── figures        <- Generated graphics and figures to be used in reporting
│
├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
│                         generated with `pip freeze > requirements.txt`
│
├── ml_repo_test                <- Source code for use in this project.
│   ├── __init__.py    <- Makes ml_repo_test a Python module
│   │
│   ├── data           <- Scripts to download or generate data
│   │   └── make_dataset.py
│   │
│   ├── features       <- Scripts to turn raw data into features for modeling
│   │   └── build_features.py
│   │
│   ├── models         <- Scripts to train models and then use trained models to make
│   │   │                 predictions
│   │   ├── predict_model.py
│   │   └── train_model.py
│   │
│   └── visualization  <- Scripts to create exploratory and results oriented visualizations
│       └── visualize.py
|
├── scripts            <- Useful scripts that provide simple, oneoff functions during project.
│
├── settings.ini       <- Parameters required to build docs and setup python packgae build
|
├── .env               <- Template for setting and utilizing environmental variables with [dotenv](https://pypi.org/project/python-dotenv/) library
|
├── .flake8            <- flake8 linting settings
|
├── .pre-commit-config.yaml       <- Configuring git hooks with [pre-commit](https://pre-commit.com/#cli)
|
├── cloudbuild-*.yaml  <- Template for Cloud Build tests preconfigured for Python tests
|
├── pyproject.toml     <- Configuration for [black](https://github.com/psf/black) autoformatter
|
├── settings.ini       <- Parameters required to build docs and python package
|
└── terraform          <- Terrafrom configuration files for infrastructure deployment.

```