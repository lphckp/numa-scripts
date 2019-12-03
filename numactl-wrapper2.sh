#!/bin/bash 
#Read Total Numa nodes
TOTNODES=`numactl --hardware|grep nodes |awk '{print $2}'`

#Read last used node, create if it does not exist.
if [ -f "/tmp/next-node" ]; then
  NODE=`cat /tmp/next-node`
else
  echo '0'>/tmp/next-node
  NODE=`cat /tmp/next-node`
fi

#Make sure we are not assigning a non existent node.
if [ "${NODE}" -ge "${TOTNODES}" ] 
then
  NODE=0
fi

#Bind process to requested NUMA node
numactl -C ${NODE} --membind ${NODE} $0.x $@

#Increment Node number for next execution
(( NODE++ ))

#Store node for next execution
echo $NODE>/tmp/next-node
