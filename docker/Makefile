build:
	@docker-compose -p jenkins build

run:
	@docker-compose -p jenkins up -d nginx data master

stop:
	@docker-compose -p jenkins stop

clean:	stop
	@docker-compose -p jenkins rm master nginx

clean-data:	clean
	@docker-compose -p jenkins rm -v data

clean-images:
	@docker rmi `docker images -q -f "dangling=true"`

log:
	@docker cp jenkins-master:/var/log/jenkins/jenkins.log jenkins.log

tail:
	@docker exec jenkins-master tail -f /var/log/jenkins/jenkins.log

re:
	@echo yes | make clean-data \
		&& make build \
		&& make run \
		&& sleep 3 \
		&& make tail