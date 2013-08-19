#!/bin/bash

certs=`puppet cert list --all | grep -v puppetmaster | awk '{ print $2 }'`

if ! [ -z `puppet cert list --all | grep -v puppetmaster | awk '{ print $2 }'` ]; then
  puppet cert list --all | grep -v puppetmaster | awk '{ print $2 }' | xargs puppet cert clean
fi
