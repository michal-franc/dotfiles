#!/bin/bash
active_tasks="$(task status:pending and +ACTIVE count)"

if [ "$active_tasks" = 0 ]
then
  exit 1
fi

if [ "$active_tasks" != 1 ]
then
  echo "$active_tasks active - unable to display"
  exit
fi

active_task_id=$(echo $(task activeid) | cut -d' ' -f 3)

echo "$active_task_id.$(task _get $active_task_id.project): $(task _get $active_task_id.description)"
exit

