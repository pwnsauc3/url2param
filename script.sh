#usage: ./script.sh /path/urls.txt

#!/bin/bash

echo "Extracted Parameters:"
echo " "

# Read each line of the file
while read line; do
  # Extract the parameters from the URL
  params=$(echo "$line" | sed 's/.*\?//' | sed 's/&/\n/g' | cut -d'=' -f1 | sort | uniq)

  # Print the extracted parameters
  echo "$params"
done < urls.txt
