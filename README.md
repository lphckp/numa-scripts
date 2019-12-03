numactl-wrapper.sh
This wrapper script forces a process to bind to a single numa node, it is currently coded for a system with four numa nodes (4-sockets). To increase or decrease the number of numa nodes you must modify the case statement that increments the node counter.
In order to use this script copy it to /opt/bin or a location of your choice.
Rename the executible you are wanting to wrap to append a .x extension. For example:
# mv /usr/bin/zip /usr/bin/zip.x
Link the orginal name to the numactl-wrapper.sh script. (Both the original command and the .x renamed command must be in the path or the script will fail.)
# ln -s /opt/bin/numactl-wrapper.sh /usr/bin/zip

numactl-wrapper2.sh
An improved version of numactl-wrapper.sh that detects the number of numa nodes in a system and increments to the largest.

