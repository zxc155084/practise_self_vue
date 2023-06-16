#!/bin/bash

# build project
npm run build

# delete 檔案
rm -rf ./practise_self_vue_web/*.*
rm -rf ./practise_self_vue_web/assets/*.*

# copy 檔案
cp -f ./dist/*.* ./practise_self_vue_web
cp -f ./dist/assets/*.* ./practise_self_vue_web/assets

$a=`date +%Y-%m-%d` 

# auto 上傳git檔案
cd ./practise_self_vue_web
git add .
git status
git commit -m "$a[檔案上傳]"
git push
