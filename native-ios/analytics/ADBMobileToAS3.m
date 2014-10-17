/**
 *  Objective-C to AS3 communication bridge for the ADMobile class.
 */

#import "ADBMobile.h"
#import "FlashRuntimeExtensions.h"
#include "AsToObjC.m"


#pragma mark - Configuration

FREObject version(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    return NSStringToFREObject([ADBMobile version]);
}

FREObject privacyStatus(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    FREObject status = nil;
    FRENewObjectFromUint32([ADBMobile privacyStatus], &status);
    return status;
}

FREObject setPrivacyStatus(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    uint32_t status;
    FREGetObjectAsUint32(argv[0], &status);
    
    [ADBMobile setPrivacyStatus:status];
    
    return nil;
}

FREObject lifetimeValue(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    FREObject value = nil;
    double lifetimeDouble = [[ADBMobile lifetimeValue] doubleValue];
    FRENewObjectFromDouble(lifetimeDouble, &value);
    return value;
}

FREObject userIdentifier(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    return NSStringToFREObject([ADBMobile userIdentifier]);
}

FREObject setUserIdentifier(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    NSString *userId = FREObjectToNSString(argv);
    [ADBMobile setUserIdentifier:userId];
    return nil;
}

FREObject debugLogging(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    FREObject debug = nil;
    FRENewObjectFromBool([ADBMobile debugLogging], &debug);
    return debug;
}

FREObject setDebugLogging(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    uint32_t debug;
    FREGetObjectAsBool(argv[0], &debug);
    [ADBMobile setDebugLogging:debug];
    
    return nil;
}

FREObject keepLifecycleSessionAlive(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    [ADBMobile keepLifecycleSessionAlive];
    
    return nil;
}

FREObject collectLifecycleData(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    [ADBMobile collectLifecycleData];
    return nil;
}

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
    
    NSLog(@"Method : trackAction");
    NSLog( @"passed state : %@", FREObjectToNSString(trackedAction));
    
    NSDictionary *contextData = FREObjectToDictionary(dictionary, dictionaryKeys);
    
    NSLog( @"argv[2] to dict: %@", contextData);
    
    //Send the data to ADBMobile
    [ADBMobile trackActionFromBackground:FREObjectToNSString(trackedAction) data:contextData];
    
    return nil;
}


FREObject trackLocation(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    
    //argv[0] : the
    
}









/**
 * 	@brief Tracks a location with context data.
 * 	@param location a CLLocation pointer containing the location information to be tracked.
 * 	@param data a dictionary pointer containing the context data to be tracked.
 *  @note This method does not increment page views.
 */
//+ (void) trackLocation:(CLLocation *)location data:(NSDictionary *)data;

/**
 * 	@brief Tracks a beacon with context data.
 * 	@param beacon a CLBeacon pointer containing the beacon information to be tracked.
 * 	@param data a dictionary pointer containing the context data to be tracked.
 *  @note This method does not increment page views.
 */
//+ (void) trackBeacon:(CLBeacon *)beacon data:(NSDictionary *)data;
