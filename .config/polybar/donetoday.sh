#!/bin/bash
done_today_count="$(echo $(task end:today completedid) | grep -o '[0-9] task')"
echo $done_today_count

