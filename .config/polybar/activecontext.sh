#!/bin/bash
active_context="$(task _get rc.context)"

if [ "$active_context" = "" ]
then
  exit 1
fi

echo "$active_context"
exit

