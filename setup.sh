#!/usr/bin/env bash

echo "this script will take care of installing shodan cli and and initiating it"
echo "Create an account in shodan.io"
echo "get the API KEY"

shoset(){
if [[ -z  "$(which shodan) " ]]; then
    echo "installing shodan API..."
    pip3 install shodan #will install shodan API using pip 
    echo "It is all set up.!!"
    echo ""
fi
}

read -p "are you ready with the API KEY[Y/n] :" y
if [[ "$y" == "y" ||"$y" == "Y"  ]]; then 
    shoset
    echo "Paste your shodan API KEY"
    read -p "here : " AK
    shodan init $AK #initiating shodan api
elif [[ "$y" == "n" ||"$y" == "N" ]]; then
    echo "Follow the instructions shown above"
fi

