//
//  VJMapViewController.m
//  MHacks
//
//  Created by Vincent Ngo on 9/21/13.
//  Copyright (c) 2013 VincentJouella. All rights reserved.
//

#import "VJMapViewController.h"

@interface VJMapViewController ()

@end

@implementation VJMapViewController

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
    
       self.mapView.userTrackingMode = YES;
        self.mapView.showsUserLocation = YES;

    NSLog(@"userLocation = %f,%f", self.mapView.userLocation.coordinate.latitude,
          self.mapView.userLocation.coordinate.longitude);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
