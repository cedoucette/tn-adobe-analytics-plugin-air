//Must read : http://www.adobe.com/devnet/air/articles/transferring-data-ane-ios-pt1.html

#include "AsToObjC.h"

NSString* FREObjectToNSString(FREObject* stringObj)
{
    
    // To be filled
    uint32_t stringLength;
    const uint8_t *string;
    
    //Read Data
    FREGetObjectAsUTF8(stringObj, &stringLength, &string);
    
    //NSLog(@"FREObjectToNSString : str= %s", string);
    //NSLog(@"FREObjectToNSString : (char*)string= %s", (char*)string);
    
    // Convert C strings to Obj-C strings
    NSString *stringObjC = [NSString stringWithUTF8String:(char*)string];
    
    //NSLog(@"FREObjectToNSString : stringObjC= %@", stringObjC);
    
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

FREObject* NSDictionaryToFREObject(NSDictionary* dictionary)
{
    NSArray *dictKeys = [dictionary allKeys];
    
    FREObject retObj;
    FRENewObject((const uint8_t*)"Object", 0, nil, &retObj, nil);
    
    for (NSString *key in dictKeys) {
        NSObject *value = [dictionary valueForKey:key];
        FREObject valueObj;
        if([value isKindOfClass:[NSString class]])
        {
            valueObj = NSStringToFREObject((NSString *)value);
        }
        else// if([value isKindOfClass:[NSNumber class]])
        {
            FRENewObjectFromDouble([(NSNumber *)value doubleValue], &valueObj);
        }
        
        FRESetObjectProperty(retObj, (const uint8_t *)[key UTF8String], valueObj, nil);
    }

    return retObj;
}


FREObject* NSStringToFREObject(NSString* string)
{
    if(string == nil)
        return nil;
    // Convert Obj-C string to C UTF8String
    const char *str = [string UTF8String];
    
    // Prepare for AS3
    FREObject retStr;
    FRENewObjectFromUTF8(strlen(str)+1.0, (const uint8_t*)str, &retStr);
    
    return retStr;
}

FREObject* ADBMediaSettingsToFREObject(ADBMediaSettings* settings)
{
    //@property (readwrite) bool segmentByMilestones;                 ///< Indicates if segment info should be automatically generated for milestones generated or not, the default is NO.
    //@property (readwrite) bool segmentByOffsetMilestones;           ///< Indicates if segment info should be automatically generated for offset milestones or not, the default is NO.
    //@property (readwrite) double length;                            ///< The length of the media item in seconds.
    //@property (nonatomic, strong) NSString *channel;                ///< The name or ID of the channel.
    //@property (nonatomic, strong) NSString *name;                   ///< The name or ID of the media item.
    //@property (nonatomic, strong) NSString *playerName;             ///< The name of the media player.
    //@property (nonatomic, strong) NSString *playerID;               ///< The ID of the media player.
    //@property (nonatomic, strong) NSString *milestones;             ///< A comma-delimited list of intervals (as a percentage) for sending tracking data.
    //@property (nonatomic, strong) NSString *offsetMilestones;       ///< A comma-delimited list of intervals (in seconds) for sending tracking data.
    //@property (nonatomic) NSUInteger trackSeconds;                  ///< The interval at which tracking data should be sent, the default is 0.
    //@property (nonatomic) NSUInteger completeCloseOffsetThreshold;  ///< The number of second prior to the end of the media that it should be considered complete, the default is 1.
    
    //Ad parameters
    //@property (readwrite) bool isMediaAd;               ///< Indicates if the media item is an ad or not.
    //@property (readwrite) double parentPodPosition;     ///< The position within the pod where the ad is played.
    //@property (nonatomic, strong) NSString *CPM;        ///< The CMP or encrypted CPM (prefixed with a "~") for the media item.
    //@property (nonatomic, strong) NSString *parentName; ///< The name or ID of the media item that the ad is embedded in.
    //@property (nonatomic, strong) NSString *parentPod;  ///< The position in the primary content the ad was played.
    
    FREObject obj;
    FRENewObject((const uint8_t*)"Object", 0, nil, &obj, nil);
    
    
    FREObject segmentByMilestones;
    FRENewObjectFromBool([settings segmentByMilestones], &segmentByMilestones);
    
    FREObject segmentByOffsetMilestones;
    FRENewObjectFromBool([settings segmentByOffsetMilestones], &segmentByOffsetMilestones);
    
    FREObject length;
    FRENewObjectFromDouble([settings length], &length);
    
    FREObject channel = NSStringToFREObject([settings channel]);
    FREObject name = NSStringToFREObject([settings name]);
    FREObject playerName = NSStringToFREObject([settings playerName]);
    FREObject playerID = NSStringToFREObject([settings playerID]);
    FREObject milestones = NSStringToFREObject([settings milestones]);
    FREObject offsetMilestones = NSStringToFREObject([settings offsetMilestones]);
    
    FREObject trackSeconds;
    FRENewObjectFromUint32((uint32_t)[settings trackSeconds], &trackSeconds);
    
    FREObject completeCloseOffsetThreshold;
    FRENewObjectFromUint32((uint32_t)[settings trackSeconds], &completeCloseOffsetThreshold);
    
    //Ad parameters
    
    FREObject isMediaAd;
    FRENewObjectFromBool([settings isMediaAd], &isMediaAd);
    
    FREObject parentPodPosition;
    FRENewObjectFromDouble([settings parentPodPosition], &parentPodPosition);
    
    FREObject CPM = NSStringToFREObject([settings CPM]);
    FREObject parentName = NSStringToFREObject([settings parentName]);
    FREObject parentPod = NSStringToFREObject([settings parentPod]);
    
    
    FRESetObjectProperty(obj, (const uint8_t*) "segmentByMilestones", segmentByMilestones, nil);
    FRESetObjectProperty(obj, (const uint8_t*) "segmentByOffsetMilestones", segmentByOffsetMilestones, nil);
    FRESetObjectProperty(obj, (const uint8_t*) "length", length, nil);
    FRESetObjectProperty(obj, (const uint8_t*) "channel", channel, nil);
    FRESetObjectProperty(obj, (const uint8_t*) "name", name, nil);
    FRESetObjectProperty(obj, (const uint8_t*) "playerName", playerName, nil);
    FRESetObjectProperty(obj, (const uint8_t*) "playerID", playerID, nil);
    FRESetObjectProperty(obj, (const uint8_t*) "milestones", milestones, nil);
    FRESetObjectProperty(obj, (const uint8_t*) "offsetMilestones", offsetMilestones, nil);
    FRESetObjectProperty(obj, (const uint8_t*) "trackSeconds", trackSeconds, nil);
    FRESetObjectProperty(obj, (const uint8_t*) "completeCloseOffsetThreshold", completeCloseOffsetThreshold, nil);
    //Ad parameters
    FRESetObjectProperty(obj, (const uint8_t*) "isMediaAd", isMediaAd, nil);
    FRESetObjectProperty(obj, (const uint8_t*) "parentPodPosition", parentPodPosition, nil);
    FRESetObjectProperty(obj, (const uint8_t*) "CPM", CPM, nil);
    FRESetObjectProperty(obj, (const uint8_t*) "parentName", parentName, nil);
    FRESetObjectProperty(obj, (const uint8_t*) "parentPod", parentPod, nil);
    
    
    return obj;
}

ADBMediaSettings* FREObjectToADBMediaSettings(FREObject* settingsObj)
{
    //@property (readwrite) bool segmentByMilestones;                 ///< Indicates if segment info should be automatically generated for milestones generated or not, the default is NO.
    //@property (readwrite) bool segmentByOffsetMilestones;           ///< Indicates if segment info should be automatically generated for offset milestones or not, the default is NO.
    //@property (readwrite) double length;                            ///< The length of the media item in seconds.
    //@property (nonatomic, strong) NSString *channel;                ///< The name or ID of the channel.
    //@property (nonatomic, strong) NSString *name;                   ///< The name or ID of the media item.
    //@property (nonatomic, strong) NSString *playerName;             ///< The name of the media player.
    //@property (nonatomic, strong) NSString *playerID;               ///< The ID of the media player.
    //@property (nonatomic, strong) NSString *milestones;             ///< A comma-delimited list of intervals (as a percentage) for sending tracking data.
    //@property (nonatomic, strong) NSString *offsetMilestones;       ///< A comma-delimited list of intervals (in seconds) for sending tracking data.
    //@property (nonatomic) NSUInteger trackSeconds;                  ///< The interval at which tracking data should be sent, the default is 0.
    //@property (nonatomic) NSUInteger completeCloseOffsetThreshold;  ///< The number of second prior to the end of the media that it should be considered complete, the default is 1.
    
    //ad parameters
    //@property (readwrite) bool isMediaAd;               ///< Indicates if the media item is an ad or not.
    //@property (readwrite) double parentPodPosition;     ///< The position within the pod where the ad is played.
    //@property (nonatomic, strong) NSString *CPM;        ///< The CMP or encrypted CPM (prefixed with a "~") for the media item.
    //@property (nonatomic, strong) NSString *parentName; ///< The name or ID of the media item that the ad is embedded in.
    //@property (nonatomic, strong) NSString *parentPod;  ///< The position in the primary content the ad was played.
    
    NSLog(@" Enter FREObjectToADBMediaSettings ");
    if(settingsObj == nil)
        NSLog(@" settingsObj is nil ");
    else
        NSLog(@" settingsObj is OK ");
    
    ADBMediaSettings *settings = [[ADBMediaSettings alloc] init];
    
    NSLog(@" get segmentByMilestones ");
    FREObject segmentByMilestonesObj;
    NSLog(@" get property ");
    FREGetObjectProperty(settingsObj, (const uint8_t*)"segmentByMilestones", &segmentByMilestonesObj, nil);
    uint32_t segmentByMilestones;
    NSLog(@" convert property ");
    FREGetObjectAsBool(segmentByMilestonesObj, &segmentByMilestones);
    NSLog(@" got segmentByMilestones %u", segmentByMilestones);
    
    NSLog(@" get segmentByOffsetMilestones ");
    FREObject segmentByOffsetMilestonesObj;
    FREGetObjectProperty(settingsObj, (const uint8_t*)"segmentByOffsetMilestones", &segmentByOffsetMilestonesObj, nil);
    uint32_t segmentByOffsetMilestones;
    FREGetObjectAsBool(segmentByMilestonesObj, &segmentByOffsetMilestones);
    NSLog(@" got segmentByOffsetMilestones %u", segmentByOffsetMilestones);
    
    NSLog(@" get length ");
    FREObject lengthObj;
    FREGetObjectProperty(settingsObj, (const uint8_t*)"length", &lengthObj, nil);
    double length;
    FREGetObjectAsDouble(lengthObj, &length);
    NSLog(@" got length %f", length);
    
    NSLog(@" get channel ");
    FREObject channelObj;
    FREGetObjectProperty(settingsObj, (const uint8_t*)"channel", &channelObj, nil);
    NSString *channel = FREObjectToNSString(channelObj);
    NSLog(@" got channel %@", channel);
    
    NSLog(@" get name ");
    FREObject nameObj;
    FREGetObjectProperty(settingsObj, (const uint8_t*)"name", &nameObj, nil);
    NSString *name = FREObjectToNSString(nameObj);
    NSLog(@" got name %@", name);
    
    NSLog(@" get playerName ");
    FREObject playerNameObj;
    FREGetObjectProperty(settingsObj, (const uint8_t*)"playerName", &playerNameObj, nil);
    NSString *playerName = FREObjectToNSString(playerNameObj);
    NSLog(@" got playerName %@", playerName);
    
    NSLog(@" get playerID ");
    FREObject playerIDObj;
    FREGetObjectProperty(settingsObj, (const uint8_t*)"playerID", &playerIDObj, nil);
    NSString *playerID = FREObjectToNSString(playerIDObj);
    NSLog(@" got playerID %@", playerID);
    
    NSLog(@" get milestones ");
    FREObject milestonesObj;
    FREGetObjectProperty(settingsObj, (const uint8_t*)"milestones", &milestonesObj, nil);
    NSString *milestones = FREObjectToNSString(milestonesObj);
    NSLog(@" got milestones %@", milestones);
    
    NSLog(@" get offsetMilestones ");
    FREObject offsetMilestonesObj;
    FREGetObjectProperty(settingsObj, (const uint8_t*)"offsetMilestones", &offsetMilestonesObj, nil);
    NSString *offsetMilestones = FREObjectToNSString(offsetMilestonesObj);
    NSLog(@" got offsetMilestones %@", offsetMilestones);

    NSLog(@" get trackSeconds ");
    FREObject trackSecondsObj;
    FREGetObjectProperty(settingsObj, (const uint8_t*)"trackSeconds", &trackSecondsObj, nil);
    uint32_t trackSeconds;
    FREGetObjectAsUint32(trackSecondsObj, &trackSeconds);
    NSLog(@" got trackSeconds %u", trackSeconds);

    NSLog(@" get completeCloseOffsetThreshold ");
    FREObject completeCloseOffsetThresholdObj;
    FREGetObjectProperty(settingsObj, (const uint8_t*)"completeCloseOffsetThreshold", &completeCloseOffsetThresholdObj, nil);
    uint32_t completeCloseOffsetThreshold;
    FREGetObjectAsUint32(completeCloseOffsetThresholdObj, &completeCloseOffsetThreshold);
    NSLog(@" got completeCloseOffsetThreshold %u", completeCloseOffsetThreshold);
    
    //Ad parameters
    NSLog(@" get isMediaAd ");
    FREObject isMediaAdObj;
    FREGetObjectProperty(settingsObj, (const uint8_t*)"isMediaAd", &isMediaAdObj, nil);
    uint32_t isMediaAd;
    FREGetObjectAsBool(isMediaAdObj, &isMediaAd);
    NSLog(@" got isMediaAd %u", isMediaAd);
    
    NSLog(@" get parentPodPosition ");
    FREObject parentPodPositionObj;
    FREGetObjectProperty(settingsObj, (const uint8_t*)"parentPodPosition", &parentPodPositionObj, nil);
    double parentPodPosition;
    FREGetObjectAsDouble(parentPodPositionObj, &parentPodPosition);
    NSLog(@" got parentPodPosition %f", parentPodPosition);
    
    NSLog(@" get CPM ");
    FREObject CPMObj;
    FREGetObjectProperty(settingsObj, (const uint8_t*)"CPM", &CPMObj, nil);
    NSString *CPM = FREObjectToNSString(CPMObj);
    NSLog(@" got CPM %@", CPM);
    
    NSLog(@" get parentName ");
    FREObject parentNameObj;
    FREGetObjectProperty(settingsObj, (const uint8_t*)"parentName", &parentNameObj, nil);
    NSString *parentName = FREObjectToNSString(parentNameObj);
    NSLog(@" got parentName %@", parentName);

    NSLog(@" get parentPod ");
    FREObject parentPodObj;
    FREGetObjectProperty(settingsObj, (const uint8_t*)"parentPod", &parentPodObj, nil);
    NSString *parentPod = FREObjectToNSString(parentPodObj);
    NSLog(@" got parentPod %@", parentPod);
    
    [settings setSegmentByMilestones:segmentByMilestones];
    [settings setSegmentByOffsetMilestones:segmentByOffsetMilestones];
    [settings setLength:length];
    [settings setChannel:channel];
    [settings setName:name];
    [settings setPlayerName:playerName];
    [settings setPlayerID:playerID];
    [settings setMilestones:milestones];
    [settings setOffsetMilestones:offsetMilestones];
    [settings setTrackSeconds:trackSeconds];
    [settings setCompleteCloseOffsetThreshold:completeCloseOffsetThreshold];
    //Ad parameters
    [settings setIsMediaAd:isMediaAd];
    [settings setParentPodPosition:parentPodPosition];
    [settings setCPM:CPM];
    [settings setParentName:parentName];
    [settings setParentPod:parentPod];
    
    NSLog(@" Settings set ");
    
    return settings;
}