GITLAB_USERNAME = ${GITLAB_USERNAME}
GITLAB_DEPLOY_TOKEN = ${GITLAB_DEPLOY_TOKEN}

build:
	@docker-compose -p jenkins build

# epTODO wip
login:
	@docker login registry.gitlab.com -u GITLAB_USERNAME -p GITLAB_DEPLOY_TOKEN

# epTODO wip
pull: login
	@docker-compose -p jenkins pull master nginx

# epTODO wip
run: # this should not build if the images don't exist, it should pull them from the registry
	@docker-compose -p jenkins up -d nginx data master

stop:
	@docker-compose -p jenkins stop

clean: stop
	@docker-compose -p jenkins rm master nginx

clean-data:	clean
	@docker-compose -p jenkins rm -v data

clean-images:
	@docker rmi `docker images -q -f "dangling=true"`

log:
	@docker cp jenkins-master:/var/log/jenkins/jenkins.log jenkins.log

tail:
	@docker exec jenkins-master tail -f /var/log/jenkins/jenkins.log
