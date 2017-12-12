#!/usr/bin/env bash

set -e

echo "Add credentials"

# Gets AWS access key id
while [[ -z "$aws_access_key_id" ]]
do
  read -r -p "What is your AWS access key id? " aws_access_key_id
done

# Gets AWS secret access key
while [[ -z "$aws_secret_access_key" ]]
do
  read -r -p "What is your AWS secret access key? " aws_secret_access_key
done

# Writes credentials
cat >../aws.symfolder/credentials << EOL
[default]
aws_access_key_id=${aws_access_key_id}
aws_secret_access_key=${aws_secret_access_key}
EOL

echo "Add config"

# Gets AWS region
read -r -p "What is your AWS region [us-east-1]? " region
region=${region:-us-east-1}

# Gets AWS output format (ensuring it is either text, table, or json)
while true
do
  read -r -p "What is your AWS output format (text, table, or json) [table]? " output

  # Sets default output format if not provided
  output=${output:-table}

  # Breaks out of while-loop if we have a valid output format
  if [[ "$output" == "json" || "$output" == "text" || "$output" == "table" ]]
  then
    break
  fi
done

# Writes config
cat >../aws.symfolder/config << EOL
[default]
region=${region}
output=${output}
EOL
