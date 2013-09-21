//
//  GeoCoderHelper.m
//  MHacks
//
//  Created by Vincent Ngo on 9/21/13.
//  Copyright (c) 2013 VincentJouella. All rights reserved.
//

#import "GeoCoderHelper.h"

@implementation GeoCoderHelper

-(id) init
{
    if ( self = [super init] ) {
        self.country = @"";
        self.city = @"";
        self.street = @"";
        self.areaOfInterest = @"";
        self.geoCoder = nil;
        self.latitude = 0;
        self.longitude = 0;
    }
    return self;
}

//Must call this initialization.
-(id) initWithStreet:(NSString *)street withCity:(NSString *)city withCountry:(NSString *)country
{
    return 0;
}


-(void)computeAddressCoordinates
{
    if (!self.geoCoder)
    {
        self.geoCoder = [[CLGeocoder alloc] init];
    }
    
    NSString *fullAddress = [NSString stringWithFormat:@"%@ %@ %@", self.street, self.city, self.country];
    
    //From Mobile tutsPlus tutorials to calculate coordinate.
    [self.geoCoder geocodeAddressString:fullAddress completionHandler:^(NSArray *placemarks, NSError *error) {
        if ([placemarks count] > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            CLLocation *location = placemark.location;
            CLLocationCoordinate2D coordinate = location.coordinate;

            self.longitude = coordinate.longitude;
            self.latitude = coordinate.latitude;
            
            if ([placemark.areasOfInterest count] > 0) {
                self.areaOfInterest = [placemark.areasOfInterest objectAtIndex:0];
            }
            else
            {
                self.areaOfInterest = nil;
            }
        }
    }];
}



@end
