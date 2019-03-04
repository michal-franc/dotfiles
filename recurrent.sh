#!/bin/bash

while read line;
do
  count=$(task status:pending $line +recurrent count)
  if [[ $count -eq 0 ]]; then
    echo creating missing $line
    task add $line +recurrent due:week
  else
    echo $line in on the list
  fi
done <~/todo/recurrent.md

