FROM jenkins/jenkins:2.119-slim
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
ENV JAVA_OPTS -Xmx8192m
RUN /usr/local/bin/install-plugins.sh docker-plugin
# do not prompt the user for an admin password on startup
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion
