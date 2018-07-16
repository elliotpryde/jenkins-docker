import jenkins.model.*

if(!Jenkins.instance.isQuietingDown()) {
    Jenkins.instance.setNumExecutors(1)
    println "Executors on master DISABLED successfully."
}
else {
    println "Shutdown mode enabled. Disable executors on master SKIPPED."
}
