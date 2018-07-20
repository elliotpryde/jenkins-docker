import jenkins.model.Jenkins
import hudson.plugins.git.*
import hudson.triggers.SCMTrigger

def repositoryLocation = "https://elliotpryde@bitbucket.org/elliotpryde/jenkins-docker-pipeline.git"
def jenkinsfileName = "Jenkinsfile-declarative"
def branchSpec = "scripted-pipeline-docker-slave"
def cronTimer = "H/2 * * * *"
def ignorePostCommitHooks = false
def jobName = "Declarative pipeline job"

def scm = new GitSCM(repositoryLocation)
scm.branches = [new BranchSpec(branchSpec)]

def flowDefinition = new org.jenkinsci.plugins.workflow.cps.CpsScmFlowDefinition(scm, jenkinsfileName)
def inputTriggers = [new SCMTrigger(cronTimer, ignorePostCommitHooks)]

if(!Jenkins.instance.isQuietingDown()) {
    def j = Jenkins.instance
    def job = new org.jenkinsci.plugins.workflow.job.WorkflowJob(j, jobName)
    job.definition = flowDefinition
    job.triggers = inputTriggers

    j.reload()
    println "Successfully initialised SCM pipeline job ${repositoryLocation} - ${jenkinsfileName}."
}
else {
    println "Shutdown mode enabled. Initialisation of SCM pipeline job ${repositoryLocation} - ${jenkinsfileName} SKIPPED."
}
