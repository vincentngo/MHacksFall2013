//
//  AppState.h
//  MHacks
//
//  Created by Vincent Ngo on 9/21/13.
//  Copyright (c) 2013 VincentJouella. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *sUserCurrentLocation;

@interface AppState : NSObject

+ (void) setCurrentLocation: (CLLocationManager *) currentLocation;
+ (CLLocationManager *) getCurrentLocation;

+ (AppState *)sharedState;


@end
