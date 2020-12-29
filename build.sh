#!/bin/bash
path="./platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk"

cd ./docto_user
rm $path
ionic cordova build android --prod --release
#./sign.sh
cd ../docto_delivery
rm $path
ionic cordova build android --prod --release
#./sign.sh
cd ../docto_doc
rm $path
ionic cordova build android --prod --release
#./sign.sh
