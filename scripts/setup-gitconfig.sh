#!/usr/bin/env bash

set -e

# Gets name from `id` command
id_name=$(id -F)

# Gets name from prompt
read -r -p "What is your name? [$id_name] " name

# Defaults to id name if no alternative name was provided from promp
name=${name:-$id_name}

# Gets email
while [[ ! "$email" =~ [^[:space:]]+@[^[:space:]]+\.[^[:space:]]+ ]]
do
  read -r -p "What is your email? " email
done

# Writes file
cat > ./gitconfig.local.symlink << EOL
[user]
  name = ${name}
  email = ${email}
EOL
