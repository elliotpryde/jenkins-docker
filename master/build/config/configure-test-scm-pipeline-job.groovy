import jenkins.model.Jenkins
import hudson.plugins.git.*
import hudson.triggers.SCMTrigger

def scm = new GitSCM("https://elliotpryde@bitbucket.org/elliotpryde/jenkins-docker-pipeline.git")
scm.branches = [new BranchSpec("master")]

def flowDefinition = new org.jenkinsci.plugins.workflow.cps.CpsScmFlowDefinition(scm, "Jenkinsfile")
def inputTriggers = [new SCMTrigger("H/2 * * * *", false)]

def j = Jenkins.instance
def job = new org.jenkinsci.plugins.workflow.job.WorkflowJob(j, "Test pipeline job")
job.definition = flowDefinition
job.triggers = inputTriggers

j.reload()
