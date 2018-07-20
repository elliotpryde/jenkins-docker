init:
	@terraform init -var-file vars.tfvars -var-file secrets.tfvars

apply: init
	@terraform apply -var-file vars.tfvars -var-file secrets.tfvars

destroy: init
	@terraform destroy -var-file=vars.tfvars -var-file=secrets.tfvars
