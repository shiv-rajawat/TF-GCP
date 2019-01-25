#!/usr/bin/env bash
terraform init
echo "Success"
terraform apply -var-file=param.tfvars -auto-approve
terraform destroy -var-file=param.tfvars -auto-approve
