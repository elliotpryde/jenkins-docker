import jenkins.model.JenkinsLocationConfiguration

def env = System.getenv()

jlc = JenkinsLocationConfiguration.get()
jlc.setUrl(System.getenv()["JENKINS_ROOT"])
jlc.save()
