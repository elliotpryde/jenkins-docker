## Terraform

Deploy
```
terraform apply -var-file=vars.tfvars -var-file=secrets.tfvars
```

Tear down
```
terraform destroy -var-file=vars.tfvars -var-file=secrets.tfvars
```

Get outputs
```
terraform output -module=jenkins-master
```

Get specific output
```
terraform output -module=jenkins-master linux_docker_slave_ip
```
