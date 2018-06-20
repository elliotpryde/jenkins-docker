import jenkins.model.Jenkins
import hudson.plugins.git.*
import hudson.triggers.SCMTrigger

def repositoryLocation = "https://elliotpryde@bitbucket.org/elliotpryde/jenkins-docker-pipeline.git"

def scm = new GitSCM(repositoryLocation)
scm.branches = [new BranchSpec("master")]

def flowDefinition = new org.jenkinsci.plugins.workflow.cps.CpsScmFlowDefinition(scm, "Jenkinsfile")
def inputTriggers = [new SCMTrigger("H/2 * * * *", false)]

if(!Jenkins.instance.isQuietingDown()) {
    def j = Jenkins.instance
    def job = new org.jenkinsci.plugins.workflow.job.WorkflowJob(j, "Test pipeline job")
    job.definition = flowDefinition
    job.triggers = inputTriggers

    j.reload()
    println "Successfully initialised SCM pipeline job ${repositoryLocation}."
}
else {
    println "Shutdown mode enabled. Initialisation of SCM pipeline job ${repositoryLocation} SKIPPED."
}
