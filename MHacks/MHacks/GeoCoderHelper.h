//
//  GeoCoderHelper.h
//  MHacks
//
//  Created by Vincent Ngo on 9/21/13.
//  Copyright (c) 2013 VincentJouella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface GeoCoderHelper : NSObject

@property (nonatomic, strong) CLGeocoder *geoCoder;
@property (assign) CLLocationDegrees latitude;
@property (assign) CLLocationDegrees longitude;

//Must have information to gather coordinates 
@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *country;

@property (nonatomic, strong) NSString *areaOfInterest;


-(id)initWithStreet: (NSString *)street withCity: (NSString *)city withCountry: (NSString *)country;

-(void)computeAddressCoordinates;

@end
