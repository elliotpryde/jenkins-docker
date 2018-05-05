FROM jenkins/jenkins:2.119-slim
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
ENV JAVA_OPTS -Xmx8192m
RUN /usr/local/bin/install-plugins.sh docker-plugin
