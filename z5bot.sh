#!/bin/bash -x

[ -f stories/config.json ] || exit 1

cp stories/config.json .

python3 ./bot.py


