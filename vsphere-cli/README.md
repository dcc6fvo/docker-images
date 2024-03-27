# vsphere-cli

Many companies often find themselves compelled to persist with legacy software to fulfill specific requirements. A prime illustration of such legacy software is the vsphere-cli version 5.5 tool. However, a challenge arises as this tool relies on outdated libraries exclusively found in older operating systems. In this regard, Docker offers a solution by facilitating the rapid and straightforward creation of instances of legacy operating systems.

The provided Dockerfile offers a configuration for running vsphere-cli version 5.5 on Ubuntu 16. Additionally, a script accompanies it to execute the vsphere tool.

Installation && Running
-----------------------

1) Do a git clone of the project.

2) Access the git clone folder.

3) Build it:

    docker build -t vsphere:latest .

4) Run (using port 22222 on host machine):

    docker run -d -p 22222:22 vsphere:latest

The container contains a hostops.sh file in the current directory, which executes (help) vicfg-hostops.
