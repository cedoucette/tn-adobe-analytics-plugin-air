//
//  ANEGeneric.m
//  ANEGeneric
//
//  Created by Nicolas Laudo on 2014-10-07.
//
//

#import "analytics.h"
#import "AsToObjC.h"

@implementation analytics

//-----------INITIALIZE AND FINALIZE-------------

// ContextInitializer()
// The context initializer is called when the runtime creates the extension context instance.
void AdobeMobileAnalyticsContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) {
    
    NSLog(@"Entering ContextInitializer()");
    
	*numFunctionsToTest = 45;
	FRENamedFunction* func = (FRENamedFunction*)malloc(sizeof(FRENamedFunction) * *numFunctionsToTest);
    
    uint32_t position = 0.0;
    position = addFREfunctionToArray(func, position, @"helloWorld", &helloWorld, NULL);
    
    //Configuration
    position = addFREfunctionToArray(func, position, @"version", &version, NULL);
    position = addFREfunctionToArray(func, position, @"privacyStatus", &privacyStatus, NULL);
    position = addFREfunctionToArray(func, position, @"setPrivacyStatus", &setPrivacyStatus, NULL);
    position = addFREfunctionToArray(func, position, @"lifetimeValue", &lifetimeValue, NULL);
    position = addFREfunctionToArray(func, position, @"userIdentifier", &userIdentifier, NULL);
    position = addFREfunctionToArray(func, position, @"setUserIdentifier", &setUserIdentifier, NULL);
    position = addFREfunctionToArray(func, position, @"debugLogging", &debugLogging, NULL);
    position = addFREfunctionToArray(func, position, @"setDebugLogging", &setDebugLogging, NULL);
    position = addFREfunctionToArray(func, position, @"keepLifecycleSessionAlive", &keepLifecycleSessionAlive, NULL);
    position = addFREfunctionToArray(func, position, @"collectLifecycleData", &collectLifecycleData, NULL);
    
    //Analytics
    position = addFREfunctionToArray(func, position, @"trackState", &trackState, NULL);
    position = addFREfunctionToArray(func, position, @"trackAction", &trackAction, NULL);
    position = addFREfunctionToArray(func, position, @"trackActionFromBackground", &trackActionFromBackground, NULL);
    position = addFREfunctionToArray(func, position, @"trackLifetimeValueIncrease", &trackLifetimeValueIncrease, NULL);
    position = addFREfunctionToArray(func, position, @"trackTimedActionStart", &trackTimedActionStart, NULL);
    position = addFREfunctionToArray(func, position, @"trackTimedActionUpdate", &trackTimedActionUpdate, NULL);
    position = addFREfunctionToArray(func, position, @"trackTimedActionEnd", &trackTimedActionEnd, NULL);
    position = addFREfunctionToArray(func, position, @"trackingTimedActionExists", &trackingTimedActionExists, NULL);
    position = addFREfunctionToArray(func, position, @"trackingIdentifier", &trackingIdentifier, NULL);
    position = addFREfunctionToArray(func, position, @"trackingSendQueuedHits", &trackingSendQueuedHits, NULL);
    position = addFREfunctionToArray(func, position, @"trackingClearQueue", &trackingClearQueue, NULL);
    position = addFREfunctionToArray(func, position, @"trackingGetQueueSize", &trackingGetQueueSize, NULL);
    
    //Media Analytics
    position = addFREfunctionToArray(func, position, @"mediaCreateSettingsWithName", &mediaCreateSettingsWithName, NULL);
    position = addFREfunctionToArray(func, position, @"mediaAdCreateSettingsWithName", &mediaAdCreateSettingsWithName, NULL);
    position = addFREfunctionToArray(func, position, @"mediaOpenWithSettings", &mediaOpenWithSettings, NULL);
    position = addFREfunctionToArray(func, position, @"mediaClose", &mediaClose, NULL);
    position = addFREfunctionToArray(func, position, @"mediaPlay", &mediaPlay, NULL);
    position = addFREfunctionToArray(func, position, @"mediaComplete", &mediaComplete, NULL);
    position = addFREfunctionToArray(func, position, @"mediaStop", &mediaStop, NULL);
    position = addFREfunctionToArray(func, position, @"mediaClick", &mediaClick, NULL);
    position = addFREfunctionToArray(func, position, @"mediaTrack", &mediaTrack, NULL);
    
    //Location
    position = addFREfunctionToArray(func, position, @"trackLocation", &trackLocation, NULL);
    position = addFREfunctionToArray(func, position, @"trackBeacon", &trackBeacon, NULL);
    position = addFREfunctionToArray(func, position, @"trackingClearCurrentBeacon", &trackingClearCurrentBeacon, NULL);
    
    //Audience
    position = addFREfunctionToArray(func, position, @"audienceVisitorProfile", &audienceVisitorProfile, NULL);
    position = addFREfunctionToArray(func, position, @"audienceDpid", &audienceDpid, NULL);
    position = addFREfunctionToArray(func, position, @"audienceDpuuid", &audienceDpuuid, NULL);
    position = addFREfunctionToArray(func, position, @"audienceSetDpid", &audienceSetDpid, NULL);
    position = addFREfunctionToArray(func, position, @"audienceSignalWithData", &audienceSignalWithData, NULL);
    position = addFREfunctionToArray(func, position, @"audienceReset", &audienceReset, NULL);
    
    //Target
    position = addFREfunctionToArray(func, position, @"targetLoadRequest", &targetLoadRequest, NULL);
    position = addFREfunctionToArray(func, position, @"targetCreateRequestWithName", &targetCreateRequestWithName, NULL);
    position = addFREfunctionToArray(func, position, @"targetCreateOrderConfirmRequestWithName", &targetCreateOrderConfirmRequestWithName, NULL);
    position = addFREfunctionToArray(func, position, @"targetClearCookies", &targetClearCookies, NULL);
    
    
    *functionsToSet = func;
    
    NSLog(@"Exiting ContextInitializer()");
}

// ContextFinalizer()
// The context finalizer is called when the extension's ActionScript code
// calls the ExtensionContext instance's dispose() method.
// If the AIR runtime garbage collector disposes of the ExtensionContext instance, the runtime also calls
// ContextFinalizer().

void AdobeMobileAnalyticsContextFinalizer(FREContext ctx) {
    
    NSLog(@"Entering ContextFinalizer()");
    
    // Nothing to clean up.
    
    NSLog(@"Exiting ContextFinalizer()");
    
	return;
}

// ExtInitializer()
//
// The extension initializer is called the first time the ActionScript side of the extension
// calls ExtensionContext.createExtensionContext() for any context.

void AdobeMobileAnalyticsInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet,
                                     FREContextFinalizer* ctxFinalizerToSet) {
    
    NSLog(@"Entering ExtInitializer()");
    
	*extDataToSet = NULL;
	*ctxInitializerToSet = &AdobeMobileAnalyticsContextInitializer;
	*ctxFinalizerToSet = &AdobeMobileAnalyticsContextFinalizer;
    
    NSLog(@"Exiting ExtInitializer()");
}

// ExtFinalizer()
//
// The extension finalizer is called when the runtime unloads the extension. However, it is not always called.

void AdobeMobileAnalyticsFinalizer(void* extData) {
    
    NSLog(@"Entering ExtFinalizer()");
    
	// Nothing to clean up.
    
    NSLog(@"Exiting ExtFinalizer()");
    
	return;
}

uint32_t addFREfunctionToArray(FRENamedFunction *arr, uint32_t position, NSString *name, FREFunction function, void* functionData )
{
    const char *str = [name UTF8String];
    arr[position].name = (const uint8_t*)str;
	arr[position].functionData = functionData;
	arr[position].function = function;
    
    return position + 1.0;
}


FREObject helloWorld(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    NSLog(@"Entering hellowWorld()");
    
    // Create Hello World String
    NSString *helloString = @"Hello World!";
    
    // Return data back to ActionScript
    return NSStringToFREObject(helloString);
}


@end