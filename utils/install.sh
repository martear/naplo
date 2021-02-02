#!/bin/sh

if [ "$1" = "--build" ]
then
  echo Building APK...
  flutter build apk
fi

echo Uninstalling old version...
adb uninstall "hu.filcnaplo.ellenorzo.dev"

echo Installing new version...
adb install build/app/outputs/apk/release/app-release.apk

echo Done.
