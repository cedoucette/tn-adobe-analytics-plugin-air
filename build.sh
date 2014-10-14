#!/bin/bash

AIRSDK_HOME=/Users/sharley/SDK/AIR_15.0/bin
ACOMPC="$AIRSDK_HOME/acompc"
ADT="$AIRSDK_HOME/adt"
# echo $ACOMPC
# echo $ADT


NATIVE_DEFAULT=native-default
ANE_HOME=as3


SWFVERSION=14
INCLUDE_CLASSES="com.tribalnova.extensions.adobe.analytics.AdobeMobileAnalytics"
NAME="AdobeMobileAnalytics"


echo -e "\033[36m"
echo "Build Native Code"
echo -e "\033[0m"


type ant &>/dev/null && ant -f ./native-ios/build-xcode.xml || echo -e "\033[31m ant not found. Skipping...\033[0m"


echo -e "\033[36m"
echo "Prepare workspace"
echo -e "\033[0m"
mkdir -p $ANE_HOME/build/default
mkdir -p $ANE_HOME/build/ios
mkdir -p $ANE_HOME/build/temp


echo -e "\033[36m"
echo "Generate SWC for default implementation"
echo -e "\033[0m"
$ACOMPC -source-path $NATIVE_DEFAULT/src/ -include-classes $INCLUDE_CLASSES -swf-version=$SWFVERSION -output $ANE_HOME/build/temp/$NAME.swc

echo -e "\033[36m"
echo "Extract library from ANE SWC"
echo -e "\033[0m"
unzip $ANE_HOME/build/temp/$NAME.swc -d $ANE_HOME/build/temp/
cp $ANE_HOME/build/temp/library.swf $ANE_HOME/build/default/
rm -rf $ANE_HOME/build/temp/*

echo -e "\033[36m"
echo "Copy assets"
echo -e "\033[0m"
cp $ANE_HOME/src/*.xml $ANE_HOME/build/
cp $ANE_HOME/native-binaries/libAdobeMobileAnalytics.a $ANE_HOME/build/ios

echo -e "\033[36m"
echo "Generate ANE SWC"
echo -e "\033[0m"
$ACOMPC -source-path $ANE_HOME/src/ -include-classes $INCLUDE_CLASSES -swf-version=$SWFVERSION -output $ANE_HOME/build/$NAME.swc

echo -e "\033[36m"
echo "Extract library from ANE SWC"
echo -e "\033[0m"
unzip $ANE_HOME/build/$NAME.swc -d $ANE_HOME/build/temp/
cp $ANE_HOME/build/temp/library.swf $ANE_HOME/build/ios/
rm -rf $ANE_HOME/build/temp/*

echo -e "\033[36m"
echo "Generate ANE"
echo -e "\033[0m"
$ADT -package -target ane extension/$NAME.ane $ANE_HOME/build/extension.xml -swc $ANE_HOME/build/$NAME.swc -platform default -C $ANE_HOME/build/default . -platform iPhone-ARM -C $ANE_HOME/build/ios .

echo -e "\033[36m"
echo "Cleanup workspace"
echo -e "\033[0m"
cp $ANE_HOME/build/$NAME.swc extension
rm -rf $ANE_HOME/build/*

echo -e "\033[32m"
echo "Finito!"
echo -e "\033[0m"
