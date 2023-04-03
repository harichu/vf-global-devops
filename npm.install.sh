#!/bin/bash
# curl -o- https://raw.githubusercontent.com/harichu/vf-global-devops/main/npm.install.sh | bash

npm i cleave.js && npm i
rm -rf sfra-webpack-builder && unzip sfra-webpack-builder.zip && cd sfra-webpack-builder && npm i
cd ../ && cp -r sfra-webpack-builder/node_modules/ . && cp -r sfra-webpack-builder node_modules/
