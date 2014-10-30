#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"
#import "ADBMobile.h"
#import "AsToObjC.h"

#pragma mark - Target


FREObject targetLoadRequest(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    //argv[0] :   the Object (Dictionary) sent by AS3 (object representation of a previously created location request)
    //argv[1] :   the list of keys for the object in argv[0] (Array of strings)
    
    FREObject dictionary = argv[0];
    //FREObject dictionaryKeys = argv[1];

    FREObject nameObj;
    FREGetObjectProperty(dictionary, (const uint8_t *)"name", &nameObj, nil);
    //NSLog( @"name");
    FREObject defaultContentObj;
    FREGetObjectProperty(dictionary, (const uint8_t *)"defaultContent", &defaultContentObj, nil);
    //NSLog( @"defaultContent");
    FREObject parametersObj;
    FREGetObjectProperty(dictionary, (const uint8_t *)"parameters", &parametersObj, nil);
    //NSLog( @"parameters");
    FREObject parametersKeysObj;
    FREGetObjectProperty(dictionary, (const uint8_t *)"parametersKeys", &parametersKeysObj, nil);
    //NSLog( @"parametersKeys");
    
    NSString *name = FREObjectToNSString(nameObj);
    NSLog( @"name = %@", name);
    NSString *defaultContent = FREObjectToNSString(defaultContentObj);
    NSLog( @"defaultContent = %@", defaultContent);
    NSDictionary *parameters = FREObjectToDictionary(parametersObj, parametersKeysObj);
    NSLog( @"parameters = %@", parameters);

    //NSLog( @"1");
    ADBTargetLocationRequest *adbRequest = [[ADBTargetLocationRequest alloc] init];
    //NSLog( @"2");
    [adbRequest setName: name];
    //NSLog( @"3");
    [adbRequest setDefaultContent: defaultContent];
    //NSLog( @"4");
    if(parameters != nil){
        NSLog( @"parameters isn't nil");
        [adbRequest setParameters:[parameters mutableCopy]];
    }
    
    //NSLog( @"5");
    [ADBMobile targetLoadRequest:adbRequest callback:^(NSString *content) {
        //Do Something ??
    }];
    //NSLog( @"6");
    return nil;
}

FREObject targetCreateRequestWithName(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    //argv[0] :   the request name (String)
    //argv[1] :   the request content (String)
    //argv[2] :   the Object (Dictionary) sent by AS3
    //argv[3] :   the list of keys for the object in argv[2] (Array of strings)
    
    FREObject requestNameObj = argv[0];
    FREObject requestContentObj = argv[1];
    FREObject dictionary = argv[2];
    FREObject dictionaryKeys = argv[3];
    
    NSString *requestName = FREObjectToNSString(requestNameObj);
    NSString *requestContent = FREObjectToNSString(requestContentObj);
    
    NSDictionary *contextData = FREObjectToDictionary(dictionary, dictionaryKeys);
    NSLog( @"name: %@, requestContent: %@", requestName, requestContent);
    NSLog( @"context = %@", contextData);
    
    ADBTargetLocationRequest *request = [ADBMobile targetCreateRequestWithName:requestName defaultContent:requestContent parameters:contextData];
    
    FREObject requestObj;
    FRENewObject((const uint8_t *)"Object", 0, nil, &requestObj, nil);
    
    FREObject name = NSStringToFREObject([request name]);
    FREObject defaultContent = NSStringToFREObject([request defaultContent]);
    FREObject parameters = NSDictionaryToFREObject([request parameters]);
    
    FREObject parametersKeysObj;
    for (NSString *key in [[request parameters] allKeys]) {
        FREObject keyObj = NSStringToFREObject(key);
        FRESetObjectProperty(parametersKeysObj, (const uint8_t *)[key UTF8String], keyObj, nil);
    }
    
    
    FRESetObjectProperty(requestObj, (const uint8_t *)"name", name, nil);
    FRESetObjectProperty(requestObj, (const uint8_t *)"defaultContent", defaultContent, nil);
    FRESetObjectProperty(requestObj, (const uint8_t *)"parameters", parameters, nil);
    FRESetObjectProperty(requestObj, (const uint8_t *)"parametersKeys", parametersKeysObj, nil);

    return requestObj;
}

FREObject targetCreateOrderConfirmRequestWithName(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    //argv[0] :   the order name (String)
    //argv[1] :   the order ID (String)
    //argv[2] :   the order Total (String)
    //argv[3] :   the productID (String)
    
    //argv[4] :   the Object (Dictionary) sent by AS3
    //argv[5] :   the list of keys for the object in argv[4] (Array of strings)
    
    FREObject orderNameObj = argv[0];
    FREObject orderIdObj = argv[1];
    FREObject orderTotalObj = argv[2];
    FREObject productIdObj = argv[3];
    FREObject dictionary = argv[4];
    FREObject dictionaryKeys = argv[5];
    
    NSString *orderName = FREObjectToNSString(orderNameObj);
    NSString *orderId = FREObjectToNSString(orderIdObj);
    NSString *orderTotal = FREObjectToNSString(orderTotalObj);
    NSString *productId = FREObjectToNSString(productIdObj);
    
    NSDictionary *parameters = FREObjectToDictionary(dictionary, dictionaryKeys);
    
    ADBTargetLocationRequest *request = [ADBMobile targetCreateOrderConfirmRequestWithName:orderName orderId:orderId orderTotal:orderTotal productPurchasedId:productId parameters:parameters];
    
    FREObject requestObj;
    
    FREObject name = NSStringToFREObject([request name]);
    FREObject defaultContent = NSStringToFREObject([request defaultContent]);
    FREObject params = NSDictionaryToFREObject([request parameters]);
    FREObject parametersKeysObj;
    for (NSString *key in [[request parameters] allKeys]) {
        FREObject keyObj = NSStringToFREObject(key);
        FRESetObjectProperty(parametersKeysObj, (const uint8_t *)[key UTF8String], keyObj, nil);
    }
    
    FRESetObjectProperty(requestObj, (const uint8_t *)"name", name, nil);
    FRESetObjectProperty(requestObj, (const uint8_t *)"defaultContent", defaultContent, nil);
    FRESetObjectProperty(requestObj, (const uint8_t *)"parameters", params, nil);
    FRESetObjectProperty(requestObj, (const uint8_t *)"parametersKeys", parametersKeysObj, nil);
    
    return requestObj;
}

FREObject targetClearCookies(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    [ADBMobile targetClearCookies];
    return nil;
}