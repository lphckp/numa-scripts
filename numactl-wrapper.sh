#!/bin/sh 
if [ -f "/tmp/next-node" ]; then
  NODE=`cat /tmp/next-node`
else
  echo '0'>/tmp/next-node
  NODE=`cat /tmp/next-node`
fi
echo numactl -C ${NODE} --membind ${NODE} $0.x $@
case ${NODE} in
[0])
  #echo "Next time run on 1"
  echo '1'>/tmp/next-node 
  ;;
[1])
  #echo "Next time run on 2"
  echo '2'>/tmp/next-node
  ;;
[2])
  #echo "Next time run on 3"
  echo '3'>/tmp/next-node
  ;;
[3])
  #echo "Next time run on 0"
  echo '0'>/tmp/next-node
  ;;
esac


