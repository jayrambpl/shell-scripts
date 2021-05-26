#!/bin/bash

my_function() {
    local LOCAL_VAR=1
    echo "LOCAL_VAR can be accessed inside of the function: $LOCAL_VAR"
}

my_function

# LOCAL_VAR is not available outside of the function.
echo "LOCAL_VAR can NOT be accessed outside of the function: $LOCAL_VAR"

### m2 ###
#!/bin/bash

function backup_file () {
  # This function creates a backup of a file.

  # Make sure the file exists.
  if [ -f "$1" ] 
  then
    # Make the BACKUP_FILE variable local to this function.
    local BACKUP_FILE="/tmp/$(basename ${1}).$(date +%F).$$"
    echo "Backing up $1 to ${BACKUP_FILE}"

    # The exit status of the function will be the exit status of the cp command.
    cp $1 $BACKUP_FILE
  else
    # The file does not exist, so return an non-zero exit status.
    return 1
  fi
}

# Call the function
backup_file /etc/hosts

# Make a decision based on the exit status of the function.
# Note this is for demonstration purposes.  You could have
# put this functionality inside of the backup_file function.
if [ $? -eq "0" ]
then
  echo "Backup succeeded!"
else
  echo "Backup failed!"
  # Abort the script and return a non-zero exit status.
  exit 1
fi


###  3 ###

#!/bin/bash

my_function() {
    echo "$GLOBAL_VAR"
}

# The value of GLOBAL_VAR is NOT available to my_function since GLOBAL_VAR was defined after my_function was called.
my_function
GLOBAL_VAR=1

### f1 #### 
#!/bin/bash

logger "Message"
logger -p local0.info "Message"
logger -s -p local0.info "Message"
logger -t myscript -p local0.info "Message"
logger -i -t myscript "Message"

###