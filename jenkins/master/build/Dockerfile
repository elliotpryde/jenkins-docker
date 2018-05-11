FROM jenkins/jenkins:2.119-slim
USER jenkins
# Install plugins
# RUN /usr/local/bin/install-plugins.sh docker-plugin
# Set number of executors on master
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
# Add a specialised script for healthchecks
COPY health-check.sh /usr/local/bin/health-check.sh
# Increase java heap size
ENV JAVA_OPTS -Xmx8192m
# Web client access
EXPOSE 8080
# Used by JNLP build slaves
EXPOSE 5000
# do not prompt the user for an admin password on startup
# RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion
