FROM jenkins/jenkins:2.119-slim

# Install plugins
RUN /usr/local/bin/install-plugins.sh \
    git \
    matrix-auth \
    workflow-aggregator \
    docker-workflow \
    docker-plugin \
    blueocean \
    credentials-binding

# Set default login credentials
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Add a specialised script for healthchecks
COPY health-check.sh /usr/local/bin/health-check.sh

HEALTHCHECK --interval=15s --timeout=5s --retries=3 \
  CMD ./usr/local/bin/health-check.sh

# Increase java heap size, prevent running of the setup wizard
ENV JAVA_OPTS "-Xmx8192m -Djenkins.install.runSetupWizard=false"

# Web client access
EXPOSE 8080

# Used by JNLP build slaves
EXPOSE 5000

# Set default jenkins root url
ENV JENKINS_ROOT "http://localhost:8080"

USER root

# Install Docker from official repo
RUN apt-get update -qq && \
    apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update -qq && \
    apt-get install -qqy docker-ce && \
    usermod -aG docker jenkins && \
    chown -R jenkins:jenkins $JENKINS_HOME/

USER jenkins

# Configure jenkins
COPY config/*.groovy /usr/share/jenkins/ref/init.groovy.d/

VOLUME [$JENKINS_HOME, "/var/run/docker.sock"]
