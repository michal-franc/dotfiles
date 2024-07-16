#!/bin/bash
active_tasks="$(task rc.gc=no status:pending and +ACTIVE count 2>/dev/null </dev/null)"

if [ "$active_tasks" = 0 ]
then
  exit 1
fi

if [ "$active_tasks" != 1 ]
then
  echo "$active_tasks active - unable to display"
  exit
fi

active_task_id=$(echo $(task rc.gc=no activeid 2>/dev/null </dev/null) | cut -d' ' -f 3)

echo "$active_task_id.$(task rc.gc=no _get $active_task_id.project 2>/dev/null </dev/null): $(task rc.gc=no _get $active_task_id.description 2>/dev/null </dev/null)"
exit

