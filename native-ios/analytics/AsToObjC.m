//Must read : http://www.adobe.com/devnet/air/articles/transferring-data-ane-ios-pt1.html

#include "FlashRuntimeExtensions.h"

NSString* FREObjectToNSString(FREObject* stringObj)
{
    
    // To be filled
    uint32_t stringLength;
    const uint8_t *string;
    //Read Data
    FREGetObjectAsUTF8(stringObj, &stringLength, &string);
    
    // Convert C strings to Obj-C strings
    NSString *stringObjC = [NSString stringWithUTF8String:(char*)string];
    
    return stringObjC;
}

NSArray* FREObjectToArrayOfNSString(FREObject* stringObj, UInt32 numOfItems)
{
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    
    for (uint32_t i = 0; i < numOfItems; i++) {
        //Extract stringObjects from array
        FREObject objKey;
        FREGetArrayElementAt(stringObj, i, &objKey);
        
        //Convert all the AS items to NSString in a mutable array (aka editable)
        NSString *str = FREObjectToNSString(objKey);
        NSLog(@"%@", str);
        [mutableArray addObject:str];
    }
    
    NSArray *array = [mutableArray copy];
    //Retun an inmutable (aka read-only) copy of the array
    return array;
    
}

NSDictionary* FREObjectToDictionary(FREObject* dictionary, FREObject* dictionaryKeys)
{
    //Get the lenght of the keyList
    uint32_t keyListLen;
    FREGetArrayLength(dictionaryKeys, &keyListLen);
    //NSLog( @"keyListLen: %u", keyListLen);
    
    //Convert the keyList to an usable format (aka NSArray)
    NSArray *keyList = FREObjectToArrayOfNSString(dictionaryKeys, keyListLen);
    //NSLog( @"argv[2] to keyList: %@", keyList);
    
    NSMutableDictionary *contextData = [NSMutableDictionary dictionary];
    
    for (NSString *key in keyList) {
        // Convert Obj-C string to C UTF8String
        const char *str = [key UTF8String];
        //Get the value corresponding to this key
        FREObject propertyValue;
        FREGetObjectProperty(dictionary, (const uint8_t*)str, &propertyValue, nil);
        //Push the result in the Dictionnary
        [contextData setValue:FREObjectToNSString(propertyValue) forKey:key];
    }
    
    return [contextData copy];
}


FREObject* NSStringToFREObject(NSString* string)
{
    // Convert Obj-C string to C UTF8String
    const char *str = [string UTF8String];
    
    // Prepare for AS3
    FREObject retStr;
    FRENewObjectFromUTF8(strlen(str)+1.0, (const uint8_t*)str, &retStr);
    
    return retStr;
}