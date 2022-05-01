#!/bin/bash 

done=$(cat /tmp/pomodoro-stats | jq .completions)
rests=$(cat /tmp/pomodoro-stats | jq .rests)
failed=$(cat /tmp/pomodoro-stats | jq .interruptions)

echo "%{F#0f0} %{F-} $done |%{F#f00}   %{F-} $failed"
