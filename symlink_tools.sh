#!/bin/sh
while read TOOL
do
    IFS=',' read -a tool <<< "$TOOL"
    echo "Symlinking ${tool[0]} as ${tool[1]}"
    ./sym.sh ${tool[0]} ${tool[1]}
done < $1
