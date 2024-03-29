FROM jenkins/jenkins:2.125

# Set the timezone
ENV TZ Europe/London

USER root
# Create a folder to store the jenkins logs
RUN mkdir /var/log/jenkins
# Create a folder to move the jenkins WAR file to (by default, it's in our persisted directory)
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
USER jenkins

# Install plugins
COPY config/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Set default login credentials
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Web client access
EXPOSE 8080

# Used by JNLP build slaves
EXPOSE 50000

# Add a specialised script for healthchecks
COPY health-check.sh /usr/local/bin/health-check.sh
HEALTHCHECK --interval=15s --timeout=5s --retries=3 \
  CMD ./usr/local/bin/health-check.sh

# Increase java heap size, prevent running of the setup wizard
ENV JAVA_OPTS "-Xmx8192m -Djenkins.install.runSetupWizard=false"

# Set the location of the log file which jenkins should write to, and move the jenkins WAR file from out persisted directory
ENV JENKINS_OPTS "--logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"

# Set default jenkins root url
ENV JENKINS_ROOT "http://localhost:8080"

# Configure jenkins
COPY config/*.groovy /usr/share/jenkins/ref/init.groovy.d/