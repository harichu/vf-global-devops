#!/usr/bin/env bash
# curl -o- https://raw.githubusercontent.com/harichu/vf-global-devops/main/npm.install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#install nvm if not installed
command -v nvm >/dev/null 2>&1 || { echo >&2 "nvm is required, but it's not installed.  installing....."; curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash; }


requireVersion=14.21
read currentVersion _ <<< $(nvm current)

checkVersion(){
# $1 = new version
# $2 = installed version
IFS='.' read -r -a nver <<< "$1"
IFS='.' read -r -a iver <<< "$2"
for ((i = 0 ; i < "${#nver[@]}" ; i++)) ;do
 case "$((${nver[i]}-${iver[i]}))" in
  -*) return 1 ;;
   0) ;;
   *) return 0 ;;
 esac
 false
done
}

isOldNodeVersion=`checkVersion "$currentVersion" "$requireVersion" && echo false || echo true`
if [ $isOldNodeVersion == 'true' ]; then
  installed=`nvm which $requireVersion | grep "not yet installed"`
  if [[ $installed != "" ]]; then
    nvm install $requireVersion
  fi
fi

# ----------------------------------
# Colors
# ----------------------------------
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'
# ----------------------------------


npm i cleave.js && npm i
rm -rf sfra-webpack-builder && unzip sfra-webpack-builder.zip && cd sfra-webpack-builder && npm i
cd ../ && cp -r sfra-webpack-builder/node_modules/ . && cp -r sfra-webpack-builder node_modules/

echo -e "\n${LIGHTGREEN}> npm install completed. ${NOCOLOR}"