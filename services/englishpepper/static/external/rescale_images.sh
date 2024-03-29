#!/bin/bash

for i in /home/ubuntu/megaton/services/englishpepper/static/external/*
do
   if [[ $(file $i | egrep "JPEG|PNG") ]]
   then
       if (( `identify -format "%[fx:w]" "$i"` > 300 || `identify -format "%[fx:h]" "$i"` > 150 ))
       then
          echo "rescale $i to 300x150 geometry"
          convert "$i" -geometry 300x150 +profile '*' .tmpfile
          mv -f .tmpfile "$i"
       fi
   fi
done
