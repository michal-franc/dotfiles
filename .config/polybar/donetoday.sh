#!/bin/bash
done_today_count="$(echo $(task rc.gc=no end:today completedid 2>/dev/null </dev/null) | grep -o '[0-9][0-9]\? task')"

echo $done_today_count

