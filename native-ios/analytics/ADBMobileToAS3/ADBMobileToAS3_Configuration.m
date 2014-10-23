#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"
#import "ADBMobile.h"
#import "AsToObjC.h"

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
    NSString *userID = [ADBMobile userIdentifier];
    return NSStringToFREObject(userID);
}

FREObject setUserIdentifier(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    NSString *userId = FREObjectToNSString(argv[0]);
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