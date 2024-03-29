import jenkins.model.Jenkins

Jenkins j = Jenkins.instance

if(!j.isQuietingDown()) {
    Set<String> agentProtocolsList = ['JNLP4-connect', 'Ping']
    if(!j.getAgentProtocols().equals(agentProtocolsList)) {
        j.setAgentProtocols(agentProtocolsList)
        println "Agent Protocols have changed. Setting: ${agentProtocolsList}"
        j.save()
    }
    else {
        println "Nothing changed. Agent Protocols already configured: ${j.getAgentProtocols()}"
    }
}
else {
    println 'Shutdown mode enabled. Configure Agent Protocols SKIPPED.'
}
