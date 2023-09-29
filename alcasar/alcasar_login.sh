#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <email> <password>"
  exit 1
fi

# Specify your login credentials and other variables
EMAIL="$1"
PASSWORD="$2"
URL="https://alcasar.laplateforme.io/intercept.php"

# Perform a POST request using cURL to log in
RESPONSE=$(curl -v -L -X POST "$URL" \
  --data "username=$EMAIL" \
  --data "password=$PASSWORD" \
  --data "button=Authentication" \
  --cookie-jar "$COOKIE_JAR" \
  --header "Authorization: Bearer $TOKEN" \
  2>&1)  # Redirect both stdout and stderr to the RESPONSE variable

# Check if the response contains the "302" status code indicating a redirect
if [[ $RESPONSE == *HTTP/2\ 302* ]]; then
  echo "Successfully logged in"
else
  echo "Login failed"
fi


