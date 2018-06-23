import jenkins.model.*
import jenkins.security.s2m.AdminWhitelistRule

if(!Jenkins.instance.isQuietingDown()) {
    Jenkins.instance.injector.getInstance(AdminWhitelistRule.class)
        .setMasterKillSwitch(false);

    Jenkins.instance.save()
    println "Master slave access control ENABLED successfully."
}
else {
    println "Shutdown mode enabled. Enable master slave access control SKIPPED."
}