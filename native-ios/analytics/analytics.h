//
//  ANEGeneric.h
//  ANEGeneric
//
//  Created by Nicolas Laudo on 2014-10-07.
//
//

#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"
#import "ADBMobile.h"

@interface analytics : NSObject
/* ExtInitializer()
 * The extension initializer is called the first time the ActionScript side of the extension
 * calls ExtensionContext.createExtensionContext() for any context.
 *
 * Please note: this should be same as the <initializer> specified in the extension.xml
 */
void AdobeMobileAnalyticsContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet);
void AdobeMobileAnalyticsContextFinalizer(FREContext ctx);

void AdobeMobileAnalyticsInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet);
void AdobeMobileAnalyticsFinalizer(void* extData);


/**
 Example function to send a string to AS3
 */
FREObject helloWorld(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);

/**
 Example function to call a function with no parameter and nothing returned
 */
FREObject helloYou(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);

/**
 Example function to get a string from AS3
 */
FREObject getStringFromAS3(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);

/*
+ (void) trackActionWithProductInfo:(NSString *)action data:(NSString *)data;
+ (void) trackState:(NSString *)state data:(NSDictionary *)data;

+ (void) trackTimedActionStart:(NSString *)action data:(NSDictionary *)data;
+ (void) trackTimedActionStart:(NSString *)action info:(NSString *)info;

+ (void) trackTimedActionUpdate:(NSString *)action data:(NSDictionary *)data;
+ (void) trackTimedActionUpdate:(NSString *)action info:(NSString *)info;

+ (void) trackTimedActionEnd:(NSString *)action data:(NSDictionary *)productData;
+ (void) trackTimedActionEnd:(NSString *)action info:(NSString *)info;
*/

@end
