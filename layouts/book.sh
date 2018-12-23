#!/bin/bash

if [ -z "$1" ]
then
  echo "param 1 -> No book path supplied"
  exit 1
fi

workspace=$2

if [ -z "$2" ]
then
  echo "No workspace supplied - assuming default 10: Book"
  workspace="10: Book"
fi

i3-msg "workspace $workspace; append_layout /home/mfranc/layouts/book.json"

termite -d $HOME/notes/books &
termite &
termite & 
zathura $1 &
