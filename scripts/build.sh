#!/usr/bin/env bash
terraform init

#echo "Hellooooo world"

terraform apply -var-file=param.tfvars -auto-approve
terraform destroy -var-file=param.tfvars -auto-approve
