#!/bin/bash

BASE_DIR=/Users/sharley/SDK/AIR_15.0/bin
ACOMPC="$BASE_DIR/acompc"
ADT="$BASE_DIR/adt"
echo $ACOMPC
echo $ADT

SWFVERSION=14
INCLUDE_CLASSES="com.tribalnova.extensions.adobe.analytics.AdobeMobileAnalytics"
NAME="AdobeMobileAnalytics"

echo "Copy assets"
mkdir -p build
cp src/*.xml build
cp native-binaries/libAdobeMobileAnalytics.a build

echo "Generate SWC"
$ACOMPC -source-path src/ -include-classes $INCLUDE_CLASSES -swf-version=$SWFVERSION -output build/$NAME.swc

echo "Extract library from SWC"
unzip build/$NAME.swc -d build
 
echo "Generate ANE"
$ADT -package -target ane extension/$NAME.ane build/extension.xml -swc build/$NAME.swc -platform iPhone-ARM -C build/ .

echo "Cleanup workspace"
cp "build/$NAME.swc" extension
rm -rf build/*
 
echo "Finito!"
