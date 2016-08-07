#!/bin/bash
#
# Copyright: 2016 Alf Gaida <agaida@siduction.org
# License: LGPL-2.1+

for i in $(find . -maxdepth 1 -type d | grep -v .git ); do
    if [ ! "$i" = "."  ]; then
       pushd  $i
         git shortlog -s -e  . | cut -c8- | uniq > NEWAUTHORS
       popd
    fi
done
