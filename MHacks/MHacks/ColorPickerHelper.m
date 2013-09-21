//
//  ColorPickerHelper.m
//  MHacks
//
//  Created by Vincent Ngo on 9/21/13.
//  Copyright (c) 2013 VincentJouella. All rights reserved.
//

#import "ColorPickerHelper.h"

@implementation ColorPickerHelper

+(UIColor *) getColorWithColorName:(NSString *)color
{
    if ([color isEqualToString:@"Red"])
    {
        return [UIColor redColor];
    }
    else if ([color isEqualToString:@"Orange"])
    {
        return [UIColor orangeColor];
    }
    else if ([color isEqualToString:@"Green"])
    {
        return [UIColor greenColor];
    }
    else if ([color isEqualToString:@"Yellow"])
    {
        return [UIColor yellowColor];
    }
    else if ([color isEqualToString:@"Blue"])
    {
        return [UIColor blueColor];
    }
    else
    {
        NSLog(@"holy MHacks..! what happen here...");
        return nil;
    }
}

@end
