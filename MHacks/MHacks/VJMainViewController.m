//
//  VJMainViewController.m
//  MHacks
//
//  Created by Vincent Ngo on 9/21/13.
//  Copyright (c) 2013 VincentJouella. All rights reserved.
//

#import "VJMainViewController.h"
#import "AppDelegate.h"

@interface VJMainViewController ()

@end

@implementation VJMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Our Logo will go here
    //TODO: Make Logo if have time...
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BiSeoLogo2"]];
    self.navigationItem.titleView = imageView;
    
    //Set up location manager for getting the user's current location.
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [self.locationManager startUpdatingLocation];
    
    //Get Appstate's singleton, created for the first time.
    [AppState sharedState];
    
    //Obtains the users location...
    [self deviceLocation];
}

#pragma mark - VJSetAlarmViewController delegate

- (void) setNewAlarmController:(VJSetAlarmViewController *)controller didFinishWithSave:(BOOL)save
{
    if (save)
    {
        
    }
}



- (NSString *)deviceLocation {
    
//    [AppState setCurrentLocation:self.locationManager];
    
#if 0
    NSLog(@"latitude %f, longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude);
#endif
    
    return [NSString stringWithFormat:@"latitude: %f longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"ShowAlarmView"])
    {
        VJSetAlarmViewController *setAlarmViewController = [segue destinationViewController];
        [setAlarmViewController setDelegate:self];
        
    }
}

@end
