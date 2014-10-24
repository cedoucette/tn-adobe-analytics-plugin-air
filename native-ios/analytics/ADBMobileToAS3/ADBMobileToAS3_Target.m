#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"
#import "ADBMobile.h"
#import "AsToObjC.h"

#pragma mark - Target


FREObject targetLoadRequest(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    //TODO : implement [ADBMobile targetLoadRequest:(ADBTargetLocationRequest *) callback:^(NSString *content) {code}]
    return nil;
}

FREObject targetCreateRequestWithName(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    //TODO : implement [ADBMobile targetCreateRequestWithName:(NSString *) defaultContent:(NSString *) parameters:(NSDictionary *)]
    return nil;
}

FREObject targetCreateOrderConfirmRequestWithName(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    //TODO : implement [ADBMobile targetCreateOrderConfirmRequestWithName:(NSString *) orderId:(NSString *) orderTotal:(NSString *) productPurchasedId:(NSString *) parameters:(NSDictionary *)]
    return nil;
}

FREObject targetClearCookies(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    [ADBMobile targetClearCookies];
    return nil;
}