//
//  ADBMobileToAS3.h
//  analytics
//
//  Created by Nicolas Laudo on 2014-10-20.
//
//

#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"
#import "ADBMobile.h"
#import "AsToObjC.h"

//#ifndef analytics_ADBMobileToAS3_h
//#define analytics_ADBMobileToAS3_h

#pragma mark - Configuration

FREObject version(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject privacyStatus(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject setPrivacyStatus(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject lifetimeValue(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject userIdentifier(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject setUserIdentifier(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject debugLogging(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject setDebugLogging(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject keepLifecycleSessionAlive(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject collectLifecycleData(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);

#pragma mark - Analytics

FREObject trackState(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject trackAction(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject trackActionFromBackground(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
//TODO : FREObject trackLocation(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
//TODO : FREObject trackBeacon(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
//TODO : FREObject trackingClearCurrentBeacon(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject trackLifetimeValueIncrease(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject trackTimedActionStart(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject trackTimedActionUpdate(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject trackTimedActionEnd(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject trackingTimedActionExists(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject trackingIdentifier(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject trackingSendQueuedHits(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject trackingClearQueue(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject trackingGetQueueSize(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);

#pragma mark - Media Analytics


FREObject mediaCreateSettingsWithName(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject mediaAdCreateSettingsWithName(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject mediaOpenWithSettings(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject mediaClose(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject mediaPlay(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject mediaComplete(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject mediaStop(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject mediaClick(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject mediaTrack(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);


#pragma mark - Audience Manager
/* TODO : Finish bridge
FREObject audienceVisitorProfile(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject audienceDpid(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject audienceDpuuid(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject audienceSetDpid(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject audienceSignalWithData(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject audienceReset(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
*/

//#endif
