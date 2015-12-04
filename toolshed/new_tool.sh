#!/bin/sh
echo "#!$(whereis $1)"  > "/Users/samsheff/tools/$2"
vim "~/tools/$2"
