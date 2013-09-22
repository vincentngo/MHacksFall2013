//
//  AppState.m
//  MHacks
//
//  Created by Vincent Ngo on 9/21/13.
//  Copyright (c) 2013 VincentJouella. All rights reserved.
//

#import "AppState.h"

NSString *sUserCurrentLocation = @"userCurrentLocation";

@implementation AppState

- (void)dealloc
{
    
}


+ (AppState *)sharedState
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (id)init
{
    if (self = [super init])
    {
        //insert your stuff here
    }
    return self;
}

- (void) setCurrentLocation:(CLLocationManager *)currentLocation
{
    [[NSUserDefaults standardUserDefaults] setValue:currentLocation forKey:sUserCurrentLocation];
}

- (CLLocationManager *) getCurrentLocation
{
    id obj = [[NSUserDefaults standardUserDefaults] objectForKey: sUserCurrentLocation];
    
    if (obj && [obj isKindOfClass:[CLLocationManager class]])
    {
        return obj;
    }
    else
    {
        return nil;
    }
}

@end
