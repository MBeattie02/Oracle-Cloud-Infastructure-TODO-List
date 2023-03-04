#!/bin/bash


# Make sure this is run via source or .

if ! (return 0 2>/dev/null); then
  echo "ERROR: Usage 'source destroy.sh'"
  exit
fi

$MTDRWORKSHOP_LOCATION/utils/main-destroy.sh

cd