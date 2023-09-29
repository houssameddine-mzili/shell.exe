#!/bin/bash

# Check if email and password arguments are provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 <email> <password>"
  exit 1
fi

# URL of the login page
URL="https://alcasar.laplateforme.io/intercept.php?res=notyet&uamip=10.10.0.1&uamport=3990&challenge=c1f64475f9fd6da494a7ee84919219ee&called=68-05-CA-3A-2E-49&mac=68-7A-64-87-6C-57&ip=10.10.0.44&nasid=alcasar.laplateforme.io&sessionid=1695830043000000b6&ssl=https%3a%2f%2f1.0.0.1%3a3991%2f&userurl=http%3a%2f%2fneverssl.com%2f&md=08D89B8022E5DB25E4B6AFD02E88BF48"

# Get email and password values from command line arguments
EMAIL="$1"
PASSWORD="$2"

# Location of the cookie file
COOKIE_JAR="cookies.txt"

# Perform a POST request using cURL to log in
RESPONSE=$(curl -v -X POST "$URL" \
  --data "username=$EMAIL" \
  --data "password=$PASSWORD" \
  --data "button=Authentication" \
  --cookie-jar "$COOKIE_JAR" \
  --write-out %{redirect_url} \
  --silent \
  --output /dev/null)

# Check if the redirection occurred to the status page
if [ "$RESPONSE" = "https://alcasar.laplateforme.io/status.php" ]; then
  echo "Successfully logged in"
else
  echo "Login failed"
fi

