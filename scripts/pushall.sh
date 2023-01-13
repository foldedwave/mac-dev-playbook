#!/bin/zsh

#P=$(dirname -- "$( readlink -f -- "$0"; )");
P=$(dirname -- "$0"; );

echo $P

for fullfile in $P/**/*
do
  if [ -f "$fullfile/push.sh" ]
  then
    echo $fullfile/push.sh
    $fullfile/push.sh
  fi
done
