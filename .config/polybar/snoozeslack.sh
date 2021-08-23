#!/bin/bash

snooze_time_min=120

source ~/.secret

leftclick() {
  curl -d "token=$SLACK_TOKEN" -X POST https://slack.com/api/dnd.setSnooze\?num_minutes\=$snooze_time_min -s -o nul
  echo 鈴
  echo "" >> /tmp/slacksnoozed
}
rightclick() {
  curl -d "token=$SLACK_TOKEN" -X POST https://slack.com/api/dnd.endSnooze -s -o nul
  echo " "
  rm /tmp/slacksnoozed
}

trap "leftclick" USR1
trap "rightclick" USR2

counter=1
while true; do

  if [ -f /tmp/slacksnoozed ]
  then
    echo 鈴
  else 
    echo " "
  fi

  sleep 1 &
  wait

  ((counter++))
 
  # we need to check from time to time if slack snoozing has not endeed
  # we dont want to spam slack api too much thus only every 2 min
  # i am assuming its going to be unusal situation that someone disabled snoozing using slack app
  if [ $counter -gt 120 ]
  then
    counter=0
    snooze_enabled=$(curl -d "token=$SLACK_TOKEN" https://slack.com/api/dnd.info 2>1 | jq .snooze_enabled)

    if [ "$snooze_enabled" = "false" ]
    then
      rm /tmp/slacksnoozed
    fi
  fi

done
