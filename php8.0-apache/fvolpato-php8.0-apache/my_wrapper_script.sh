#!/bin/bash

# Start the second precess
apache2ctl -f /etc/apache2/apache2.conf &

# Start the first process
cron -f

# Wait for any process to exit
#wait -n

# Exit with status of process that exited first
#exit $?
