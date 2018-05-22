# Testing remote machines via SSH

InSpec can also test your remote machines! Let's assume there is node host.node registered with SSH configured for user bob with a keyfile in the current directory (bob.rsa). You can run the same profile against this node via:

`inspec exec examples/profile -t ssh://bob@host.node -i bob.rsa`
OR
`inspec exec examples/profile -b ssh --host host.node --user bob -i bob.rsa`


# Inspecting docker containers

InSpec also supports scanning containers. Let's try it with Docker and pick a container

`inspec exec examples/profile -t docker://abcdef123`


# Verify connection to remote machine before running tests

InSpec is able to verify local and remote nodes before running tests. This is a utility command to check connections and get information on the target

`inspec detect`

`inspec detect -t ssh://bob@host.node -i bob.rsa`


# InSpec Shell Introduction

Let's explore the InSpec shell. It's an integrated utility to test and debug the InSpec language. Before we start it interactively, let's try the command execution mode. It runs code and resources and prints the result.

First, we start with the OS detection:

`inspec shell -c 'os.params'`


# InSpec Shell with Remotes

These commands also work with remote targets

`inspec shell -c 'sshd_config.Protocol' -t ssh://bob@host.node -i bob.rsa`

`inspec shell -c 'os.params' -t docker://abcdef123`

# Interactive InSpec shell

`inspec shell`

## Interactive shell commands

`help`

`help resources`

`help file`
`help command`
`help os`