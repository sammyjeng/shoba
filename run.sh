#!bin/bash

echo "  "
echo "***DON'T LOGIN INTO OR MESS WITH THE SERVICES WHICH REQUIRE USER AUTHENTICATON****"
echo "  "
echo "***THE AUTHOUR OF THIS SCRIPT DOESN'T ENCOURAGE ILLEGAL/UNETHIACAL ACTIVITIES***"
echo "  "
echo "***DON'T OVERUSE THIS SCRIPT USING TOR, WHICH WILL AFFECT THE EXPERINCE OF THE FELLOW TOR USERS!!***"
echo "  "
echo "***ENABLE YOUR FAVORITE VPN SERVICE OR USE TOR BROWSER(YOU GOTTA!! IF YOU WANT TO REMAIN SLIGHTLY ANONYMOUS)***"
sleep 1
echo "  "
echo "***DON'T GET INTO TROUBLE, USE IT WISELY AND BE RESPONIBLE***"
sleep 1


#function to search and download data
search(){
    read -p "Enter the search term(query) :  " b 
    read -p "Save as[file name] : " n
    shodan download $n $b #this will download save a file with a given name and extension .json.gz
    echo " $n is saved in : " 
    pwd
    read -p "Do you wanna search again?[Y/n] : " re

    if [[ "$re" == "Y" ||  "$re" = "y"   ]];then
        back_bone
    else
        sleep 1
        echo "exiting.."
    fi    
}

#function to open addresses in browser at once
open_all(){
    echo "Do you want to open all the results in a browser?? BY GIVING YES YOUR BROWSER WILL OPEN SEVERAL TABS(100 BEING THE MAX) AT ONCE[Y/n]:"
    read a
    echo "  "

    if [[ "$a" == "Y" ||  "$a" = "y" ]];then
        echo "type in the downloaded file(don't include the extension)"
        read -p "file name  :" q # reads the file name
        read -p "Enter the full name of your favorite web browser: 
        $(echo "1. firefox")
        $(echo "2. brave-browser")
        $(echo "3. chrome-browser..etc")  : "  br
        echo "  " 
        $br $(shodan parse --fields ip_str,port --separator : $q.json.gz)
    else
        echo "exiting.."
    fi
}

#function to choose actions
back_bone(){
    echo "  "
    echo "Here you go!!"
    echo "  "
    echo "[FYI]Those who don't have a paid membership,the downloaded results are limited to 100"
    echo "  "
    echo "press 1 to  search the internet using shodan API and download the results"
    echo "  "
    echo "press 2 to parse all the addresses from the downloaded data and open it in your browser at once"
    echo "  "
    read -p "select :  "  l

    if [[ "$l" == "1" ]]; then
        echo "you selected the option 1"
        search
    elif [[ "$l" = "2" ]];then
        echo "you selected the option 2"
        open_all
    fi
}
back_bone
