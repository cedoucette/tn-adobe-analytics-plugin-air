//
//  AsToObjC.h
//  analytics
//
//  Created by Nicolas Laudo on 2014-10-20.
//
//

#include "FlashRuntimeExtensions.h"
#include "ADBMobile.h"

NSString* FREObjectToNSString(FREObject* stringObj);
NSArray* FREObjectToArrayOfNSString(FREObject* stringObj, UInt32 numOfItems);
NSDictionary* FREObjectToDictionary(FREObject* dictionary, FREObject* dictionaryKeys);
FREObject* NSStringToFREObject(NSString* string);
FREObject* ADBMediaSettingsToFREObject(ADBMediaSettings* settings);
ADBMediaSettings* FREObjectToADBMediaSettings(FREObject* settingsObj);
FREObject* NSDictionaryToFREObject(NSDictionary* dictionary);