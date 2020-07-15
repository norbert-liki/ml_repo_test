.PHONY: clean data lint requirements sync_data_down sync_data_up

#################################################################################
# GLOBALS                                                                       #
#################################################################################

PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PROJECT_NAME = ml_repo_test
PYTHON_VERSION = 3.7
PYTHON_INTERPRETER = python3.7


#################################################################################
# COMMANDS                                                                      #
#################################################################################


## Install Python Dependencies
requirements:
	$(PYTHON_INTERPRETER) -m pip install -U pip setuptools wheel
	$(PYTHON_INTERPRETER) -m pip install -r requirements.txt
	



## Delete all compiled Python files
clean:
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete

## Lint using flake8
lint:
	flake8 ml_repo_test

## Download Data from storage system
sync_data_down:
	gsutil rsync gs://majom-bucket/data/ data/

## Upload Data to storage system
sync_data_up:
	gsutil rsync data/ gs://majom-bucket/data/


## Set up python interpreter environment
create_environment:
	
	conda create --name $(PROJECT_NAME) python=$(PYTHON_VERSION) -y
	
	@echo ">>> conda env created. Activate with:\nconda activate $(PROJECT_NAME)"	
	



#################################################################################
# PROJECT RULES                                                                 #
#################################################################################

## Make Dataset
data: requirements
	$(PYTHON_INTERPRETER) ml_repo_test/data/make_dataset.py