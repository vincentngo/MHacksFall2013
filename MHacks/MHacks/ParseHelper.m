//
//  ParseHelper.m
//  MHacks
//
//  Created by Vincent Ngo on 9/22/13.
//  Copyright (c) 2013 VincentJouella. All rights reserved.
//

#import "ParseHelper.h"

@implementation ParseHelper

#pragma mark - calling Parse functions made by wonderful teammate.
-(void)getDCMetroStations
{
    
    [PFCloud callFunctionInBackground:@"getDCMetroStations"
                       withParameters:@{@"movie": @"The Matrix"}
                                block:^(NSString *string, NSError *error) {
                                    if (!error) {
                                        // ratings is 4.5
                                    }
                                    NSLog(@"STRING IS : %@", string);
                                }];
    
}

-(void)getTime
{
    
}

-(void)getNearestMetro
{
    
}

#pragma mark - saving core data on parse. 

- (void)saveDataToCloudWithPFObject: (PFObject *)pfObject
{
    
    
}


+(PFObject *)getPFObjectWithCity: (NSString *)city withCountry: (NSString *)country withStreet: (NSString *)street withMetroLineColor: (NSString *) color withSelectedMetroStop: (NSString *)metroStop withDate: (NSDate *)date withLongtitude: (double)longtitude withLatitude: (double)latitude
{
    PFObject *bigObject = [PFObject objectWithClassName:@"MetroRequest"];
    [bigObject setObject:city forKey:@"city"];
    [bigObject setObject:country forKey:@"country"];
    [bigObject setObject:street forKey:@"street"];
    
    [bigObject setObject:color forKey:@"metroColor"];
    [bigObject setObject:metroStop forKey:@"metroStop"];
    [bigObject setObject:date forKey:@"dateYouWantToLeave"];
    [bigObject setObject:[NSNumber numberWithDouble:longtitude] forKey:@"longtitude"];
    [bigObject setObject:[NSNumber numberWithDouble:latitude] forKey:@"latitude"];
    
    return bigObject;
}

@end
