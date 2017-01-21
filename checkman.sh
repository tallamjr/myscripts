#!/bin/bash

filename="$HOME/unix-command-list-sorted.txt"
while read cmd; do

  man $cmd > /dev/null 2>&1
  exitCode=$?
  if [[ $exitCode != 0 ]]; then
      echo "$cmd,Fail"
  else
      echo "$cmd,Success"
  fi

done < $filename
