#!/bin/zsh

#P=$(dirname -- "$( readlink -f -- "$0"; )");
P=$(dirname -- "$0"; );

echo $P

for fullfile in $P/**/*
do
  if [ -f "$fullfile/fwpush.sh" ]
  then
    echo $fullfile/fwpush.sh
    $fullfile/fwpush.sh
  fi
done
