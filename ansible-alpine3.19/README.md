# ansible-alpine3.19

This Docker image utilizes Alpine 3.19 alongside the Ansible software for automating server configurations. It offers the capability to specifythe username and its corresponding SSH key through the Docker run command.

This example includes an Ansible configuration that accesses servers listed in the "hosts" file, performing apt-get update on each one.

Installation && Running
-----------------------

1) Do a git clone of the project.

2) Access the git clone folder.

3) Change Hosts in hosts file.

4) Build it:

		docker build -t docker-ansible-example --no-cache .

5) Change username for a specific user and its SSH keys and RUN (for instance):

		docker run -d -it --rm -v `pwd`:/ansible -v 
 /home/username/.ssh/id_rsa:/ansible/.ssh/id_rsa:ro docker-ansible-example username

6) Upon container boot, perform the following:

   		ansible-playbook provisioning.yml -i hosts




