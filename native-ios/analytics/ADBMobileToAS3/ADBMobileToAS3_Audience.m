#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"
#import "ADBMobile.h"
#import "AsToObjC.h"

#pragma mark - Audience Manager

FREObject audienceVisitorProfile(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    
    return nil;
    
    NSDictionary *visitorProfile = [ADBMobile audienceVisitorProfile];
    
    NSLog(@"audienceVisitorProfile : %@", [visitorProfile description]);
    NSArray *dictKeys = [visitorProfile allKeys];
    FREObject visitorProfileObj;
    FRENewObject((const uint8_t*)"Object", 0, nil, &visitorProfileObj, nil);
    
    for (NSString *key in dictKeys) {
        NSObject *value = [visitorProfile valueForKey:key];
        //FRESetObjectProperty(visitorProfileObj, (const uint8_t) key, <#FREObject propertyValue#>, <#FREObject *thrownException#>)
    }
    
    
    //TODO : Transform NSDictionnary to FREObject
    return nil;
}

/**
 * 	@brief Gets the visitor's profile.
 *  @return A dictionary pointer containing the visitor's profile information.
 */
//+ (NSDictionary *) audienceVisitorProfile;

FREObject audienceDpid(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    NSString *Dpid = [ADBMobile audienceDpid];
    
    return NSStringToFREObject(Dpid);
}

FREObject audienceDpuuid(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    NSString *Dpuuid = [ADBMobile audienceDpuuid];
    
    return NSStringToFREObject(Dpuuid);
}

FREObject audienceSetDpid(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    //argv[0] :   the DPID (String)
    //argv[1] :   the DPUUID (String)
    
    FREObject dpidObj = argv[0];
    FREObject dpuuidObj = argv[1];
    
    NSString *dpid = FREObjectToNSString(dpidObj);
    NSString *dpuuid = FREObjectToNSString(dpuuidObj);
    
    [ADBMobile audienceSetDpid:dpid dpuuid:dpuuid];
    
    return nil;
}

FREObject audienceSignalWithData(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    //argv[0] :   the Object (Dictionary) sent by AS3
    //argv[1] :   the list of keys for the object in argv[1] (Array of strings)
    
    FREObject dictionary = argv[0];
    FREObject dictionaryKeys = argv[1];
    
    NSDictionary *dict = FREObjectToDictionary(dictionary, dictionaryKeys);
    [ADBMobile audienceSignalWithData:dict callback:^(NSDictionary *response) {
        //Do something ?
    }];
    
    return nil;
}

FREObject audienceReset(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    [ADBMobile audienceReset];
    return nil;
}
