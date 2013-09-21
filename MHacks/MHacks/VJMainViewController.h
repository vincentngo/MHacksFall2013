//
//  VJMainViewController.h
//  MHacks
//
//  Created by Vincent Ngo on 9/21/13.
//  Copyright (c) 2013 VincentJouella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VJSetAlarmViewController.h"
@interface VJMainViewController : UIViewController <VJSetAlarmControllerDelegate>

//Data sent to Parse
@property (nonatomic, strong) NSString *selectedColor;
@property (nonatomic, strong) NSString *selectedStop;
@property (nonatomic, strong) NSDate *selectedDate;
@property (nonatomic, strong) CLLocationManager *locationManager;



@end
