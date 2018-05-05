FROM jenkins/jenkins:2.119-slim
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
ENV JAVA_OPTS -Xmx8192m
RUN /usr/local/bin/install-plugins.sh \
  docker-plugin \
  script-security \
  build-timeout \
  credentials-binding \
  timestamper
# do not prompt the user to install more plugins on startup
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
