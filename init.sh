#!/usr/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Plan name not given. Exiting..."
	exit 1
fi

if ! systemctl --user is-active --quiet podman.socket; then
	systemctl --user enable --now podman.socket
fi # Check if podman is running, if not start it

plan_name=$1

echo "#####################################################"
echo "## Initializing lab with given plan : $plan_name ##"
echo "#####################################################"

terraform init -upgrade &&
terraform apply -refresh-only -auto-approve -var-file="dev.tfvars" &&
terraform plan -var-file="dev.tfvars" -out "$HOME/terraform_multi/plan/$plan_name" &&
terraform apply "$HOME/terraform_multi/plan/$plan_name"
