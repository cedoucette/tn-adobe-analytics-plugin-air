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
    
	*numFunctionsToTest = 26;
	FRENamedFunction* func = (FRENamedFunction*)malloc(sizeof(FRENamedFunction) * *numFunctionsToTest);
    
    //addFREfunctionToArray(func, @"helloWorld", &helloWorld, NULL);
    
	func[0].name = (const uint8_t*)"helloWorld";
	func[0].functionData = NULL;
	func[0].function = &helloWorld;
    
    func[1].name = (const uint8_t*)"version";
	func[1].functionData = NULL;
	func[1].function = &version;
    
    func[2].name = (const uint8_t*)"privacyStatus";
	func[2].functionData = NULL;
	func[2].function = &privacyStatus;
    
    func[3].name = (const uint8_t*)"setPrivacyStatus";
	func[3].functionData = NULL;
	func[3].function = &setPrivacyStatus;
    
    func[4].name = (const uint8_t*)"trackState";
	func[4].functionData = NULL;
	func[4].function = &trackState;
    
    func[5].name = (const uint8_t*)"trackAction";
	func[5].functionData = NULL;
	func[5].function = &trackAction;
    
    func[6].name = (const uint8_t*)"trackActionFromBackground";
	func[6].functionData = NULL;
	func[6].function = &trackActionFromBackground;
    
    func[7].name = (const uint8_t*)"trackLifetimeValueIncrease";
	func[7].functionData = NULL;
	func[7].function = &trackLifetimeValueIncrease;
    
    func[8].name = (const uint8_t*)"trackTimedActionStart";
	func[8].functionData = NULL;
	func[8].function = &trackTimedActionStart;
    
    func[9].name = (const uint8_t*)"trackTimedActionUpdate";
	func[9].functionData = NULL;
	func[9].function = &trackTimedActionUpdate;
    
    func[10].name = (const uint8_t*)"trackTimedActionEnd";
	func[10].functionData = NULL;
	func[10].function = &trackTimedActionEnd;
    
    func[11].name = (const uint8_t*)"trackingTimedActionExists";
	func[11].functionData = NULL;
	func[11].function = &trackingTimedActionExists;
    
    func[12].name = (const uint8_t*)"trackingIdentifier";
	func[13].functionData = NULL;
	func[13].function = &trackingIdentifier;
    
    func[14].name = (const uint8_t*)"trackingSendQueuedHits";
	func[14].functionData = NULL;
	func[14].function = &trackingSendQueuedHits;
    
    func[15].name = (const uint8_t*)"trackingClearQueue";
	func[15].functionData = NULL;
	func[15].function = &trackingClearQueue;
    
    func[16].name = (const uint8_t*)"trackingGetQueueSize";
	func[16].functionData = NULL;
	func[16].function = &trackingGetQueueSize;
    
    func[17].name = (const uint8_t*)"mediaCreateSettingsWithName";
	func[17].functionData = NULL;
	func[17].function = &mediaCreateSettingsWithName;
    
    func[18].name = (const uint8_t*)"mediaAdCreateSettingsWithName";
	func[18].functionData = NULL;
	func[18].function = &mediaAdCreateSettingsWithName;
    
    func[19].name = (const uint8_t*)"mediaOpenWithSettings";
	func[19].functionData = NULL;
	func[19].function = &mediaOpenWithSettings;
    
    func[20].name = (const uint8_t*)"mediaClose";
	func[20].functionData = NULL;
	func[20].function = &mediaClose;
    
    func[21].name = (const uint8_t*)"mediaPlay";
	func[21].functionData = NULL;
	func[21].function = &mediaPlay;
    
    func[22].name = (const uint8_t*)"mediaComplete";
	func[22].functionData = NULL;
	func[22].function = &mediaComplete;
    
    func[23].name = (const uint8_t*)"mediaStop";
	func[23].functionData = NULL;
	func[23].function = &mediaStop;
    
    func[24].name = (const uint8_t*)"mediaClick";
	func[24].functionData = NULL;
	func[24].function = &mediaClick;
    
    func[25].name = (const uint8_t*)"mediaTrack";
	func[25].functionData = NULL;
	func[25].function = &mediaTrack;
    
    
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


FREObject helloWorld(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    NSLog(@"Entering hellowWorld()");
    
    // Create Hello World String
    NSString *helloString = @"Hello World!";
    
    // Return data back to ActionScript
    return NSStringToFREObject(helloString);
}


@end