#!/bin/bash
while true
do

 select item in "react-native" "exit"
 do

 case $item in
   "react-native")
     scripthPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
     bash "${scripthPath}"/react-native.sh
     exit 0
   ;;
   "exit")
     exit 0
   ;;
 esac
done
done

