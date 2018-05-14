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

# Configure jenkins
COPY config/*.groovy /usr/share/jenkins/ref/init.groovy.d/

USER jenkins
