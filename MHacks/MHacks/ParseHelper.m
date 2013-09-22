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



@end
