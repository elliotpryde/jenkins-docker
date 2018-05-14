FROM jenkins/jenkins:2.119-slim

#ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# Configure jenkins
COPY config/*.groovy /usr/share/jenkins/ref/init.groovy.d/

# Install plugins
RUN /usr/local/bin/install-plugins.sh \
    docker-plugin \
    junit \
    ace-editor \
    jsch \
    pipeline-input-step \
    pipeline-rest-api \
    docker-commons \
    pipeline-graph-analysis \
    workflow-cps-global-lib \
    branch-api \
    pipeline-github-lib \
    mailer \
    handlebars \
    workflow-api \
    credentials-binding \
    bouncycastle-api \
    display-url-api \
    script-security \
    momentjs \
    workflow-support \
    apache-httpcomponents-client-4-api \
    scm-api \
    durable-task \
    github-branch-source \
    docker-workflow \
    jquery-detached \
    cloudbees-folder \
    antisamy-markup-formatter \
    pipeline-model-api \
    subversion \
    authentication-tokens \
    git-client \
    matrix-auth \
    pipeline-stage-step \
    workflow-multibranch \
    workflow-durable-task-step \
    pipeline-stage-view \
    workflow-scm-step \
    git \
    workflow-step-api \
    pipeline-build-step \
    pam-auth \
    pipeline-model-definition \
    timestamper \
    pipeline-model-declarative-agent \
    ws-cleanup \
    pipeline-stage-tags-metadata \
    github \
    workflow-aggregator \
    workflow-basic-steps \
    build-timeout \
    ant \
    resource-disposer \
    pipeline-model-extensions \
    ssh-slaves \
    mapdb-api \
    command-launcher \
    pipeline-milestone-step \
    workflow-cps \
    jdk-tool \
    ssh-credentials \
    plain-credentials \
    github-api \
    email-ext \
    jackson2-api \
    token-macro \
    matrix-project \
    ldap \
    git-server \
    gradle \
    workflow-job \
    structs \
    credentials

# Add a specialised script for healthchecks
COPY health-check.sh /usr/local/bin/health-check.sh

HEALTHCHECK --interval=15s --timeout=5s --retries=3 \
  CMD ./usr/local/bin/health-check.sh

# Increase java heap size
ENV JAVA_OPTS -Xmx8192m

# Web client access
EXPOSE 8080

# Used by JNLP build slaves
EXPOSE 5000

USER jenkins
