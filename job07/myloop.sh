#!/bin/bash

counter=1

  while [ $counter -le 10 ]
  do
	echo "Je suis un script qui arrive à faire une boucle $counter"
	((counter++))
	sleep 0.5
  done

echo All done
