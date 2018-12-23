#!/bin/bash

i3-msg "workspace 4; append_layout /home/mfranc/layouts/book.json"
termite & termite & termite & zathura
