#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "FlashRuntimeExtensions.h"
#import "ADBMobile.h"
#import "AsToObjC.h"

#pragma mark - Location

FREObject trackLocation(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    //TODO : Implement + (void) trackLocation:(CLLocation *)trackLocation data:(NSDictionary *)data;
    return nil;
    
    //argv[0] :   the Object (Dictionary) sent by AS3
    //argv[1] :   the list of keys for the object in argv[1] (Array of strings)
    FREObject dictionary = argv[0];
    FREObject dictionaryKeys = argv[1];
    
    
    NSDictionary *contextData = FREObjectToDictionary(dictionary, dictionaryKeys);
    
    /*
     This is a REALLY bad way to do it but it's the only one that fits with our usage that I could find.
     If you find a better way to do that go ahead
     */
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [locationManager startUpdatingLocation];
    
    while ([locationManager location] == nil) {
        //wait;
    }
    
    CLLocation *location = [locationManager location];
    [locationManager stopUpdatingLocation];
    
    [ADBMobile trackLocation:location data:contextData];
    
}

FREObject trackBeacon(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    //TODO : Implement + (void) trackBeacon:(CLBeacon *)beacon data:(NSDictionary *)data;
    return nil;
}

FREObject trackingClearCurrentBeacon(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    [ADBMobile trackingClearCurrentBeacon];
    return nil;
}
