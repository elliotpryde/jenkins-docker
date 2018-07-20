create-infra:
	$(MAKE) -C infrastructure apply

destroy-infra:
	$(MAKE) -C infrastructure destroy

# run-jenkins-master:
# 	$(MAKE) -C docker run