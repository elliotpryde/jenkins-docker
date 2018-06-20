import jenkins.model.Jenkins

if(!Jenkins.instance.isQuietingDown()) {
    jenkins.model.Jenkins.instance.getDescriptor("jenkins.CLI").get().setEnabled(false)
    println "Jenkins CLI DISABLED successfully."
}
else {
    println "Shutdown mode enabled. Disable Jenkins CLI SKIPPED."
}
