
import jenkins.model.*
import hudson.security.*

if(!Jenkins.instance.isQuietingDown()) {
    def env = System.getenv()

    def jenkins = Jenkins.getInstance()
    jenkins.setSecurityRealm(new HudsonPrivateSecurityRealm(false))
    jenkins.setAuthorizationStrategy(new GlobalMatrixAuthorizationStrategy())

    def user = jenkins.getSecurityRealm().createAccount(env.JENKINS_USER, env.JENKINS_PASS)
    user.save()

    jenkins.getAuthorizationStrategy().add(Jenkins.ADMINISTER, env.JENKINS_USER)
    jenkins.save()
    println "Default admin user configured successfully"
}
else {
    println "Shutdown mode enabled. Create default admin user SKIPPED."
}