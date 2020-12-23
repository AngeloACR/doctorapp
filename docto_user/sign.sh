#!/bin/bash

keystoreName="/home/angeloacr/Proyectos/DoctorApp/keystores/weekdocusers.keystore"
path="./platforms/android/app/build/outputs/apk/release/"
appName1=app-release-unsigned.apk
appName2=weekdocusers.apk
alias=weekdocusers
cd $path
rm $appName2
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $keystoreName $appName1 $alias

zipalign -v 4 $appName1 $appName2