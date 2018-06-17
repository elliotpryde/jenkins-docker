import jenkins.model.JenkinsLocationConfiguration

def env = System.getenv()

jlc = JenkinsLocationConfiguration.get()
jlc.setUrl(env.JENKINS_ROOT)
jlc.save()
