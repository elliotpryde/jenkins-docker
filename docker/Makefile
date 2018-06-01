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

refresh:
	@echo yes | make clean-data \
		&& make clean-images \
		&& docker stop $(docker ps -aq) \
		&& docker rm $(docker ps -aq) \
		&& docker rmi chuck202/data:0.1 chuck202/master:0.1 || true \
		&& make build \
		&& make run \
		&& sleep 3 \
		&& make tail