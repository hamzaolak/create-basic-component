#!/bin/bash
while true
do

 select item in "react-native" "exit"
 do

 case $item in
   "react-native")
     bash react-native.sh
     exit 1
   ;;
   "exit")
     exit 1
   ;;
 esac
done
done

