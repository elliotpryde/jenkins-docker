import jenkins.model.Jenkins
import jenkins.model.JenkinsLocationConfiguration

if(!Jenkins.instance.isQuietingDown()) {
    def env = System.getenv()

    jlc = JenkinsLocationConfiguration.get()
    jlc.setUrl(env.JENKINS_ROOT)
    jlc.save()
    println "Configured root url sucessfully."
}
else {
    println "Shutdown mode enabled. Configure root url SKIPPED."
}
