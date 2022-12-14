#!/usr/bin/env bash

#root@eve-ng:/opt/unetlab/tmp/0/d93fe442-2cfb-4fc7-bc19-0f374a2d3962# ls
#1  10  11  12  13  14  15  16  17  18  19  2  20  21  22  23  24  25  26  27  28  29  3  30  31  32  4  5  7  8  9
# hw1 82c31f50-1a69-42e0-ac51-c5dfe49edb4c
# devices=(1  2  3  4  5  6)

# hw3 a231f3ab-1362-4824-94c7-21ec4d2f5ff7
devices=(1  2  3  4  5  6  7)
LAB_PATH='/opt/unetlab/tmp/0/a231f3ab-1362-4824-94c7-21ec4d2f5ff7'
LAB_FILE='/opt/unetlab/labs/hw1/1st.unl'
HW_PATH="/Users/akosimov/Downloads/hse-networks/hw1"



HOST="10.193.93.0"
USER='root'  #auth by cert

echo "export configs"
ssh $USER@$HOST "/opt/unetlab/wrappers/unl_wrapper -a export -F $LAB_FILE -T 0"

echo "wipe and start all devices. It's need for saving fresh startup-configs"
ssh $USER@$HOST "/opt/unetlab/wrappers/unl_wrapper -a wipe -F $LAB_FILE -T 0"
ssh $USER@$HOST "/opt/unetlab/wrappers/unl_wrapper -a start -F $LAB_FILE -T 0"

echo "copying config $LAB_FILE"
scp $USER@$HOST:$LAB_FILE $HW_PATH

for device in ${devices[*]}
do
  src=$USER@$HOST:$LAB_PATH/$device/startup-config
  dst=$HW_PATH/configs/$device/
  echo "copying a config for ${device} device from $src to $dst"
  mkdir -p "$HW_PATH/configs/$device"
  scp $src $dst
done