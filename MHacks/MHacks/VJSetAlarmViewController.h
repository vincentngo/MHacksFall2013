//
//  VJScheduleViewController.h
//  MHacks
//
//  Created by Vincent Ngo on 9/21/13.
//  Copyright (c) 2013 VincentJouella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeoCoderHelper.h"
#import "VJTrainCheckerViewController.h"
#import "ColorPickerHelper.h"
/*
 We use the Delegation Design Pattern for the communication between the
 SetNewAlarmViewController object and the RootViewController Object.
 We define a protocol here and the RootViewController adopts it.
 */
@protocol VJSetAlarmControllerDelegate;

@interface VJSetAlarmViewController : UIViewController <VJTrainCheckerViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (strong, nonatomic) IBOutlet UIView *metroLineColorView;
@property (strong, nonatomic) IBOutlet UILabel *metroStopLabel;

//user generated fields
@property (strong, nonatomic) IBOutlet UITextField *streetTextField;
@property (strong, nonatomic) IBOutlet UITextField *cityTextField;
@property (strong, nonatomic) IBOutlet UITextField *countryTextField;

@property (strong, nonatomic) GeoCoderHelper *geoCoderHelper;

@property (nonatomic, strong) CLLocationManager *currentLocation;

//TODO : Make an Appstate to hold the current Locations and other colors.

- (IBAction)keyboardDone:(id)sender;

@property (nonatomic, assign) id <VJSetAlarmControllerDelegate> delegate;

@end

@protocol VJSetAlarmControllerDelegate

-(void)setNewAlarmController:(VJSetAlarmViewController *)controller didFinishWithSave:(BOOL)save;

@end
