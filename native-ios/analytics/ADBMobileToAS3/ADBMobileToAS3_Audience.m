#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"
#import "ADBMobile.h"
#import "AsToObjC.h"

#pragma mark - Audience Manager

FREObject audienceVisitorProfile(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    NSDictionary *visitorProfile = [ADBMobile audienceVisitorProfile];
    
    NSLog(@"audienceVisitorProfile : %@", [visitorProfile description]);
    
    FREObject visitorProfileObj = NSDictionaryToFREObject(visitorProfile);
    
    return visitorProfileObj;
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
