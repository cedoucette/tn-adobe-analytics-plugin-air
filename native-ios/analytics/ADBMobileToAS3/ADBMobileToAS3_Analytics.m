#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"
#import "ADBMobile.h"
#import "AsToObjC.h"


#pragma mark - Analytics

FREObject trackState(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    
    //argv[0] :   the trackstate (String)
    //argv[1] :   the Object (Dictionary) sent by AS3
    //argv[2] :   the list of keys for the object in argv[1] (Array of strings)
    
    FREObject trackedState = argv[0];
    FREObject dictionary = argv[1];
    FREObject dictionaryKeys = argv[2];
    
    NSLog(@"Method : trackState");
    NSLog( @"passed state : %@", FREObjectToNSString(trackedState));
    
    NSDictionary *contextData = FREObjectToDictionary(dictionary, dictionaryKeys);
    
    NSLog( @"argv[2] to dict: %@", contextData);
    
    //Send the data to ADBMobile
    [ADBMobile trackState:FREObjectToNSString(trackedState) data:contextData];
    
    return nil;
}

FREObject trackAction(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    
    //argv[0] :   the trackaction (String)
    //argv[1] :   the Object (Dictionary) sent by AS3
    //argv[2] :   the list of keys for the object in argv[1] (Array of strings)
    
    FREObject trackedAction = argv[0];
    FREObject dictionary = argv[1];
    FREObject dictionaryKeys = argv[2];
    
    NSLog(@"Method : trackAction");
    NSLog( @"passed state : %@", FREObjectToNSString(trackedAction));
    
    NSDictionary *contextData = FREObjectToDictionary(dictionary, dictionaryKeys);
    
    NSLog( @"argv[2] to dict: %@", contextData);
    
    //Send the data to ADBMobile
    [ADBMobile trackAction:FREObjectToNSString(trackedAction) data:contextData];
    
    return nil;
}

FREObject trackActionFromBackground(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    
    //argv[0] :   the trackaction (String)
    //argv[1] :   the Object (Dictionary) sent by AS3
    //argv[2] :   the list of keys for the object in argv[1] (Array of strings)
    
    FREObject trackedAction = argv[0];
    FREObject dictionary = argv[1];
    FREObject dictionaryKeys = argv[2];
    
    NSLog(@"Method : trackActionFromBackground");
    NSLog( @"passed state : %@", FREObjectToNSString(trackedAction));
    
    NSDictionary *contextData = FREObjectToDictionary(dictionary, dictionaryKeys);
    
    NSLog( @"argv[2] to dict: %@", contextData);
    
    //Send the data to ADBMobile
    [ADBMobile trackActionFromBackground:FREObjectToNSString(trackedAction) data:contextData];
    
    return nil;
}

//TODO : Implement + (void) trackLocation:(CLLocation *)location data:(NSDictionary *)data;
//TODO : Implement + (void) trackBeacon:(CLBeacon *)beacon data:(NSDictionary *)data;
//TODO : Implement + (void) trackingClearCurrentBeacon;

FREObject trackLifetimeValueIncrease(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    //argv[0] :   the amount to increase lifetime value by (Number)
    //argv[1] :   the Object (Dictionary) sent by AS3
    //argv[2] :   the list of keys for the object in argv[1] (Array of strings)
    
    FREObject amount = argv[0];
    FREObject dictionary = argv[1];
    FREObject dictionaryKeys = argv[2];
    
    //Convert the AS3 Number to a NSDecimalNumber
    double amountDouble;
    FREGetObjectAsDouble(amount, &amountDouble);
    NSDecimalNumber *nsAmount = [[NSDecimalNumber alloc] initWithDouble:amountDouble];
    
    NSDictionary *contextData = FREObjectToDictionary(dictionary, dictionaryKeys);
    
    //Send the data to ADBMobile
    [ADBMobile trackLifetimeValueIncrease:nsAmount data:contextData];
    
    return nil;
}

FREObject trackTimedActionStart(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    //argv[0] :   the action name to track (String)
    //argv[1] :   the Object (Dictionary) sent by AS3
    //argv[2] :   the list of keys for the object in argv[1] (Array of strings)
    
    FREObject trackedAction = argv[0];
    FREObject dictionary = argv[1];
    FREObject dictionaryKeys = argv[2];
    
    NSLog(@"Method : trackTimedActionStart");
    
    NSDictionary *contextData = FREObjectToDictionary(dictionary, dictionaryKeys);
    
    //Send the data to ADBMobile
    [ADBMobile trackTimedActionStart:FREObjectToNSString(trackedAction) data:contextData];
    
    return nil;
}

FREObject trackTimedActionUpdate(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    //argv[0] :   the action name to track (String)
    //argv[1] :   the Object (Dictionary) sent by AS3
    //argv[2] :   the list of keys for the object in argv[1] (Array of strings)
    
    FREObject trackedAction = argv[0];
    FREObject dictionary = argv[1];
    FREObject dictionaryKeys = argv[2];
    
    NSLog(@"Method : trackTimedActionStart");
    
    NSDictionary *contextData = FREObjectToDictionary(dictionary, dictionaryKeys);
    
    //Send the data to ADBMobile
    [ADBMobile trackTimedActionUpdate:FREObjectToNSString(trackedAction) data:contextData];
    
    return nil;
}

FREObject trackTimedActionEnd(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    //argv[0] :   the action name to track (String)
    //argv[1] :   the Object (Dictionary) sent by AS3
    //argv[2] :   the list of keys for the object in argv[1] (Array of strings)
    
    FREObject trackedAction = argv[0];
    FREObject dictionary = argv[1];
    FREObject dictionaryKeys = argv[2];
    
    NSLog(@"Method : trackTimedActionEnd");
    
    NSDictionary *contextData = FREObjectToDictionary(dictionary, dictionaryKeys);
    
    //Send the data to ADBMobile
    [ADBMobile trackTimedActionEnd:FREObjectToNSString(trackedAction) logic:^(NSTimeInterval inAppDuration, NSTimeInterval totalDuration, NSMutableDictionary *data){
        //logic optional block to perform logic and update parameters when this timed event ends, this block can cancel the sending of the hit by returning NO.
        if(contextData != nil && inAppDuration < totalDuration)
        {
            //Do something ?
        }
        return YES;
    }];
    
    return nil;
}

FREObject trackingTimedActionExists(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    //argv[0] :   the action name that maybe exist (String)
    
    BOOL actionExists = [ADBMobile trackingTimedActionExists:FREObjectToNSString(argv[0])];
    FREObject returnObject = nil;
    FRENewObjectFromBool(actionExists, &returnObject);
    return returnObject;
}

FREObject trackingIdentifier(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    NSString *ADBIdentifier = [ADBMobile trackingIdentifier];
    
    // Convert Obj-C string to C UTF8String
    const char *str = [ADBIdentifier UTF8String];
    FREObject identifier = nil;
    
    FRENewObjectFromUTF8(strlen(str)+1.0, (const uint8_t*)str, &identifier);
    
    return identifier;
    
}

FREObject trackingSendQueuedHits(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    [ADBMobile trackingSendQueuedHits];
    return nil;
}

FREObject trackingClearQueue(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    [ADBMobile trackingClearQueue];
    return nil;
}

FREObject trackingGetQueueSize(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    NSUInteger queueSize = [ADBMobile trackingGetQueueSize];
    FREObject queueSizeObject = nil;
    FRENewObjectFromUint32((uint32_t) queueSize, queueSizeObject);
    return queueSizeObject;
}