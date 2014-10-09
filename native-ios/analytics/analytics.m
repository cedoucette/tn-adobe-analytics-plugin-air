//
//  ANEGeneric.m
//  ANEGeneric
//
//  Created by Nicolas Laudo on 2014-10-07.
//
//

#import "analytics.h"

@implementation analytics

//-----------INITIALIZE AND FINALIZE-------------

// ContextInitializer()
// The context initializer is called when the runtime creates the extension context instance.
void AdobeMobileAnalyticsContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) {
    
    NSLog(@"Entering ContextInitializer()");
    
	*numFunctionsToTest = 3;
	FRENamedFunction* func = (FRENamedFunction*)malloc(sizeof(FRENamedFunction) * 1);
    
	func[0].name = (const uint8_t*)"helloWorld";
	func[0].functionData = NULL;
	func[0].function = &helloWorld;
    
    func[1].name = (const uint8_t*)"helloYou";
	func[1].functionData = NULL;
	func[1].function = &helloYou;
    
    func[1].name = (const uint8_t*)"getStringFromAS3";
	func[1].functionData = NULL;
	func[1].function = &getStringFromAS3;
    
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
    
    // Convert Obj-C string to C UTF8String
    const char *str = [helloString UTF8String];
    
    // Prepare for AS3
    FREObject retStr;
    FRENewObjectFromUTF8(strlen(str)+1.0, (const uint8_t*)str, &retStr);
    
    // Return data back to ActionScript
    return retStr;
}

FREObject helloYou(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    NSLog(@"Entering helloYou()");
    return nil;
}

FREObject getStringFromAS3(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    
    //Must read : http://www.adobe.com/devnet/air/articles/transferring-data-ane-ios-pt1.html
    
    // To be filled
    uint32_t string1Length;
    const uint8_t *string1;
    //Read Data
    FREGetObjectAsUTF8(argv[0], &string1Length, &string1);
    
    // Convert C strings to Obj-C strings
    NSString *string1ObjC = [NSString stringWithUTF8String:(char*)string1];
    
    //Log the result
    NSLog(@"getStringFromAS3");
    NSLog( @"%@", string1ObjC);
    
    
    return nil;
}

@end
