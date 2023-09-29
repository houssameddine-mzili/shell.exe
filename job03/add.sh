# !/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 <arg1> <arg2>"
    exit 1
fi

num1="$1"
num2="$2"

result=$((num1 + num2))

echo "Result : $result"
