numactl-wrapper.sh 
In order to use this script copy it to /opt/bin or a location of your choice.
Rename the executible you are wanting to wrap to append a .x extension. For example:
# mv /usr/bin/zip /usr/bin/zip.x
Link the orginal name to the numactl-wrapper.sh script. (Both the original command and the .x renamed command must be in the path or the script will fail.)
# ln -s /usr/bin/zip /opt/bin/numactl-wrapper.sh



