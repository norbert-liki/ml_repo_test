#!/bin/bash

ENV="dev"
projects=("ml_repo_test" "kutya")

for project in "${projects[@]}"
do
	#gcloud beta builds triggers import --source=$project-$ENV-build-master.yaml
	gcloud beta builds triggers import --source=$project-$ENV-build-dev.yaml
	#gcloud beta builds triggers import --source=$project-$ENV-build-pr.yaml
done
