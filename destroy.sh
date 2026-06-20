#!/usr/bin/bash

if [[ $# -eq 1 ]]; then
	echo "Destruction of $1."
	terraform destroy -var-file="dev.tfvars" -target="$1" -auto-approve
elif [[ $# -eq 0 ]]; then
	echo "Destruction of the lab."
	terraform destroy -var-file="dev.tfvars" -auto-approve
else
	echo "Too much arguments given. Please specify a target or none."
fi