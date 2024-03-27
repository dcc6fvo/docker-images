# ansible-alpine3.19

This Docker image utilizes Alpine 3.19 alongside the Ansible software for automating server configurations. It offers the capability to specifythe username and its corresponding SSH key through the Docker run command.

Installation && Running
-----------------------

1) Do a git clone of the project.

2) Access the git clone folder.

3) Build it:

			docker build -t docker-ansible-example --no-cache .

4) Change username for a specific user and its SSH keys and RUN (for instance):

			docker run -d -it --rm -v `pwd`:/ansible -v /home/username/.ssh/id_rsa:/ansible/.ssh/id_rsa:ro docker-ansible-example username




