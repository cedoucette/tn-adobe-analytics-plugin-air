//
//  ANEGeneric.m
//  ANEGeneric
//
//  Created by Nicolas Laudo on 2014-10-07.
//
//

#import "analytics.h"
#include "ADBMobileToAS3.m"

@implementation analytics

//-----------INITIALIZE AND FINALIZE-------------

// ContextInitializer()
// The context initializer is called when the runtime creates the extension context instance.
void AdobeMobileAnalyticsContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) {
    
    NSLog(@"Entering ContextInitializer()");
    
	*numFunctionsToTest = 5;
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

FREObject getStringFromAS3(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    NSString* string1 = FREObjectToNSString(argv[0]);
    
    //Log the result
    NSLog(@"getStringFromAS3");
    NSLog( @"%@", string1);
    
    
    return nil;
}


@end