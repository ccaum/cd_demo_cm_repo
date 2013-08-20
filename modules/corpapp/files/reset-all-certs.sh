#!/bin/bash

certs=`puppet cert list --all | grep -v puppetmaster | awk '{ print $2 }'`

if ! [ -z "$certs" ]; then
  echo $certs | xargs puppet cert clean
fi
