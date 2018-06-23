import jenkins.model.*

if(!Jenkins.instance.isQuietingDown()) {
    Jenkins.instance.setNumExecutors(0)
    println "Executors on master DISABLED successfully."
}
else {
    println "Shutdown mode enabled. Disable executors on master SKIPPED."
}
