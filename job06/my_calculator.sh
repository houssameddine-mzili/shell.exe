#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Usage: $0 <valeur1> <opération> <valeur2>"
    exit 1
fi

num1="$1"
operation="$2"
num2="$3"

result=0

case "$operation" in
	+)
	result=$((num1 + num2))
	;;

	-)
	result=$((num1 - num2))
	;;

	\*)
	result=$((num1 * num2))
	;;

	/)

	if [ "$num2" -eq 0 ]; then
	echo "Erreur : Division par zéro"
        exit 1
	fi

        result=$(awk "BEGIN {printf \"%.2f\", $num1 / $num2}")
	;;
esac

echo "$num1 $operation $num2 = $result"
