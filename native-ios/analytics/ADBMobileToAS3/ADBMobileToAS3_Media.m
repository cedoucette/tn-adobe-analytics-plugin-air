#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"
#import "ADBMobile.h"
#import "AsToObjC.h"


#pragma mark - Media Analytics


FREObject mediaCreateSettingsWithName(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    //argv[0] :   name of media item (String)
    //argv[1] :   length of media, in seconds (Number)
    //argv[2] :   name of media player (String)
    //argv[3] :   id of media player (String)
    
    FREObject itemNameObj = argv[0];
    FREObject lengthObj = argv[1];
    FREObject playerNameObj = argv[2];
    FREObject playerIdObj = argv[3];
    
    NSString *itemName = FREObjectToNSString(itemNameObj);
    double length;
    FREGetObjectAsDouble(lengthObj, &length);
    NSString *playerName = FREObjectToNSString(playerNameObj);
    NSString *playerId = FREObjectToNSString(playerIdObj);
    
    ADBMediaSettings *mediaSettings = [ ADBMobile mediaCreateSettingsWithName:itemName length:length playerName:playerName playerID:playerId ];
    
    FREObject *obj = ADBMediaSettingsToFREObject(mediaSettings);
    
    //Return an Object representation of the type ADBMediaSettings
    return obj;
    
}

FREObject mediaAdCreateSettingsWithName(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    //argv[0] :   name of media item (String)
    //argv[1] :   length of media, in seconds (Number)
    //argv[2] :   name of media player (String)
    //argv[3] :   name of the ads parent video (String)
    //argv[4] :   pod of the media item that the media ad is playing in (String)
    //argv[5] :   position of parent pod, in seconds (Number)
    //argv[6] :   CPM (String)
    
    FREObject itemNameObj = argv[0];
    FREObject lengthObj = argv[1];
    FREObject playerNameObj = argv[2];
    FREObject parentNameObj = argv[3];
    FREObject parentPodObj = argv[4];
    FREObject parentPodPositionObj = argv[5];
    FREObject CPMObj = argv[6];
    
    NSString *itemName = FREObjectToNSString(itemNameObj);
    double length;
    FREGetObjectAsDouble(lengthObj, &length);
    NSString *playerName = FREObjectToNSString(playerNameObj);
    NSString *parentName = FREObjectToNSString(parentNameObj);
    NSString *parentPod = FREObjectToNSString(parentPodObj);
    double parentPodPosition;
    FREGetObjectAsDouble(parentPodPositionObj, &parentPodPosition);
    NSString *CPM = FREObjectToNSString(CPMObj);
    
    ADBMediaSettings *mediaSettings = [ ADBMobile mediaAdCreateSettingsWithName:itemName length:length playerName:playerName parentName:parentName parentPod:parentPod parentPodPosition:parentPodPosition CPM:CPM];
    
    FREObject *obj = ADBMediaSettingsToFREObject(mediaSettings);
    
    //Return an Object representation of the type ADBMediaSettings
    return obj;
    
}

FREObject mediaOpenWithSettings(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    //argv[0] :   the Object (Dictionary) sent by AS3
    
    FREObject dictionary = argv[0];
    
    ADBMediaSettings *settings = FREObjectToADBMediaSettings(dictionary);

    [ADBMobile mediaOpenWithSettings:settings callback:^(ADBMediaState *mediaState) {
        //a block pointer to call with an ADBMediaState pointer every second.
        //Do Something? -> Could send events with FREDispatchStatusEventAsync depending on the ADBMediaState datas ?
    }];
    return nil;
}

FREObject mediaClose(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    
    //argv[0] :   name of media item to close (String)
    
    NSString *mediaName = FREObjectToNSString(argv[0]);
    
    [ADBMobile mediaClose:mediaName];
    return nil;
}


FREObject mediaPlay(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    
    //argv[0] :   name of media item to close (String)
    //argv[1] :   point that the media items is being played from, in seconds (Number)
    
    NSString *mediaName = FREObjectToNSString(argv[0]);
    double offset;
    FREGetObjectAsDouble(argv[1], &offset);
    
    [ADBMobile mediaPlay:mediaName offset:offset];
    return nil;
}

FREObject mediaComplete(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    
    //argv[0] :   name of media item to close (String)
    //argv[1] :   point that the media items is being played from, in seconds (Number)
    
    NSString *mediaName = FREObjectToNSString(argv[0]);
    double offset;
    FREGetObjectAsDouble(argv[1], &offset);
    
    [ADBMobile mediaComplete:mediaName offset:offset];
    return nil;
}

FREObject mediaStop(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    
    //argv[0] :   name of media item to close (String)
    //argv[1] :   point that the media items is being played from, in seconds (Number)
    
    NSString *mediaName = FREObjectToNSString(argv[0]);
    double offset;
    FREGetObjectAsDouble(argv[1], &offset);
    
    [ADBMobile mediaStop:mediaName offset:offset];
    return nil;
}

FREObject mediaClick(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    
    //argv[0] :   name of media item to close (String)
    //argv[1] :   point that the media items is being played from, in seconds (Number)
    
    NSString *mediaName = FREObjectToNSString(argv[0]);
    double offset;
    FREGetObjectAsDouble(argv[1], &offset);
    
    [ADBMobile mediaClick:mediaName offset:offset];
    return nil;
}

FREObject mediaTrack(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    
    //argv[0] :   the trackstate (String)
    //argv[1] :   the Object (Dictionary) sent by AS3
    //argv[2] :   the list of keys for the object in argv[1] (Array of strings)
    
    FREObject mediaName = argv[0];
    FREObject dictionary = argv[1];
    FREObject dictionaryKeys = argv[2];
    
    
    NSDictionary *contextData = FREObjectToDictionary(dictionary, dictionaryKeys);
    
    //Send the data to ADBMobile
    [ADBMobile mediaTrack:FREObjectToNSString(mediaName) data:contextData];

    return nil;
}