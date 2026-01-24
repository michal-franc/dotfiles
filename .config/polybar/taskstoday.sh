#!/bin/bash
task rc.gc=no status:pending '(+today or scheduled:today)' count 2>/dev/null </dev/null

