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

NSArray* FREObjectToArryOfNSString(FREObject* stringObj, UInt32 numOfItems)
{
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    
    for (UInt32 i; i < numOfItems; ++i) {
        //Convert all the AS items to NSString in a mutable array (aka editable)
        NSString *str = FREObjectToNSString(stringObj[0]);
        [mutableArray addObject:str];
    }
    
    NSArray *array = [mutableArray copy];
    //Retun an inmutable (aka read-only) copy of the array
    return array;
    
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