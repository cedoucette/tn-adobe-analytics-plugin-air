//
//  ANEGeneric.h
//  ANEGeneric
//
//  Created by Nicolas Laudo on 2014-10-07.
//
//

#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"

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

@end
