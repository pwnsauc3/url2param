#usage: ./script.sh /path/urls.txt

#!/bin/bash

# Read each line of the input file
while read -r line
do
  # Extract the query string from the URL
  query_string=$(echo "$line" | sed 's/.*\?//')

  # Split the query string into individual parameters
  IFS='&' read -r -a params <<< "$query_string"

  # Print each parameter
  for param in "${params[@]}"
  do
    # Split the parameter into its name and value
    IFS='=' read -r name _ <<< "$param"
    echo "$name"
  done
done < "$1"
