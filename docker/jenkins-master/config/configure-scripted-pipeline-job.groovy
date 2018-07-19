import jenkins.model.Jenkins
import hudson.plugins.git.*
import hudson.triggers.SCMTrigger
// this should not need to be coupled to this job declaration file
import jenkins.plugins.office365connector.*

def repositoryLocation = "https://elliotpryde@bitbucket.org/elliotpryde/jenkins-docker-pipeline.git"
def jenkinsfileName = "Jenkinsfile-scripted"
def branchSpec = "scripted-pipeline-docker-slave"
def cronTimer = "H/2 * * * *"
def ignorePostCommitHooks = false
def jobName = "Scripted pipeline job"
def webhookUrl = "test_webhook_url" // epTODO where should this be set ???
def webhookName = "webhook created in groovy"

def scm = new GitSCM(repositoryLocation)
scm.branches = [new BranchSpec(branchSpec)]

def teamsWebhook = new jenkins.plugins.office365connector.Webhook(webhookUrl)
teamsWebhook.setName(webhookName)
teamsWebhook.setNotifyFailure(true)
teamsWebhook.setNotifyRepeatedFailure(true)
teamsWebhook.setNotifyUnstable(true)
teamsWebhook.setNotifyBackToNormal(true)

def flowDefinition = new org.jenkinsci.plugins.workflow.cps.CpsScmFlowDefinition(scm, jenkinsfileName)
def inputTriggers = [new SCMTrigger(cronTimer, ignorePostCommitHooks)]
def webhookProperty = new jenkins.plugins.office365connector.WebhookJobProperty([teamsWebhook])

if(!Jenkins.instance.isQuietingDown()) {
    def j = Jenkins.instance
    def job = new org.jenkinsci.plugins.workflow.job.WorkflowJob(j, jobName)
    job.definition = flowDefinition
    job.triggers = inputTriggers
    job.addProperty(webhookProperty)

    println job.getProperty(jenkins.plugins.office365connector.WebhookJobProperty.class)

    j.reload()
    println "Successfully initialised SCM pipeline job ${repositoryLocation} - ${jenkinsfileName}."
}
else {
    println "Shutdown mode enabled. Initialisation of SCM pipeline job ${repositoryLocation} - ${jenkinsfileName} SKIPPED."
}
