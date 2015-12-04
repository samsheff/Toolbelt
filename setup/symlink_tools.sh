#!/bin/sh
while read TOOL
do
    IFS=',' read -a tool <<< "$TOOL"
    echo "Symlinking ${tool[0]} as ${tool[1]}"
    chmod +x /Users/samsheff/tools/${tool[0]}
    ln -sfv /Users/samsheff/tools/${tool[0]} /usr/local/bin/${tool[1]}
done < $1
