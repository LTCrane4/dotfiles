#!/bin/bash
# Checks if *.sh files are executable in this directory, and if they are not, change that

for file in *.sh; do
  if [[ ! -x $file ]]; then
    echo "Setting $file as executable"
    chmod +x $file
  fi
done

echo "All .sh files are executable"
exit 0

