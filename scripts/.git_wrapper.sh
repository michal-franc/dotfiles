#!/bin/bash
for arg in "$@"; do
    if [ "$arg" = "push" ]; then
        ispush=1
    elif [ "$ispush" = 1 -a "$arg" = '-f' ]; then
        echo "hey there, use this instead so you don't cause race conflicts in the repo: git push --force-with-lease or ggfl"
        exit 1
    fi
done

git "$@"
