#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"
echo " "
echo "\033[95m########################################\033[0m"
echo "\033[95m### Welcome to the Rosella setup! <3 ###\033[0m"
echo "\033[95m########################################\033[0m"

echo " "
sleep 1s
echo "I will now try to check if your system is configured properly and set everything up for building..."
echo " "
sleep 3s

## Check for cmake... 
currentver="$(cmake --version)"
if [ $? -eq 0 ]; then
       echo ""
else
       echo '\033[31m Cmake is NOT INSTALLED. Aborting. :( \033[0m'
       exit -1
fi
currentver=`echo "$currentver" | grep -o "[0-9.]\+"`
currentver=${currentver:0:6}
requiredver="3.13.4"
 if [ "$(printf '%s\n' "$requiredver" "$currentver" | sort -V | head -n1)" = "$requiredver" ]; then
       echo "\033[92mCmake is installed at version $currentver! \033[0m"
 else
       echo '\033[31mCmake is less than the required ${requiredver}! :( \033[0m'
       exit -1
 fi
echo " "
mkdir build
cd "build"
if [[ -z $1 ]]; then
       echo "\033[92mWill now build Rosella via cmake... \033[0m"
       sleep 3s
       cmake ../;
       cmake --build .;
else
       echo "\033[92mWill now generate your $1 project via cmake... \033[0m"
       sleep 3s
       cmake -G $1 ../;
fi
echo ""
echo "\033[95mDone! :D \033[0m"
echo "\033[95m❤️ Thank you for installing Rosella! <3 ❤️\033[0m"
exit 0