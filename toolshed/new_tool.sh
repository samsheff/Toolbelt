#!/bin/sh
echo "#!$(whereis $1)"  > "$2"
vim $2
