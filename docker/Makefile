build:
	@docker-compose -p jenkins build

run:
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

docker-registry-login:
	docker login registry.gitlab.com --username=${GITLAB_EMAIL} --password=${GITLAB_PASSWORD}

publish: docker-registry-login
	@docker push registry.gitlab.com/merlodicus/jenkins-docker/master:0.1 \
		&& docker push registry.gitlab.com/merlodicus/jenkins-docker/data:0.1 \
		&& docker push registry.gitlab.com/merlodicus/jenkins-docker/nginx:0.1