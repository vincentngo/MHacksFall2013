//
//  VJScheduleViewController.m
//  MHacks
//
//  Created by Vincent Ngo on 9/21/13.
//  Copyright (c) 2013 VincentJouella. All rights reserved.
//

#import "VJSetAlarmViewController.h"

@interface VJSetAlarmViewController ()

@property (nonatomic, strong) UIBarButtonItem *doneButton;

@end

@implementation VJSetAlarmViewController

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

    self.geoCoderHelper = [[GeoCoderHelper alloc]init];
    
    //Add done button to the right of the navigation bar's title
    self.doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(donePressed)];
    
    self.navigationItem.rightBarButtonItem = self.doneButton;
    
    [AppState sharedState];
    
    CLLocationManager *currentLocation = [AppState getCurrentLocation];
    
    
    [self.currentLocationLabel setText: [NSString stringWithFormat:@"Latitude is %f, and Longitude is %f", currentLocation.location.coordinate.latitude, currentLocation.location.coordinate.longitude]];
}

#pragma mark- SetTrainCheckerViewControllerDelegate

-(void)setTrainCheckerViewController:(VJTrainCheckerViewController *)controller didFinishWithSave:(BOOL)save
{
    if (save)
    {
        self.metroStopLabel.text = controller.stopSelected;
        
        [self.metroLineColorView setBackgroundColor:[ColorPickerHelper getColorWithColorName:controller.colorSelected]];
        
            [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)donePressed
{
    
    [self.delegate setNewAlarmController:self didFinishWithSave:YES];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)keyboardDone:(id)sender {
    [self resignFirstResponder];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"ShowTrainChecker"])
    {
        VJTrainCheckerViewController *trainCheckerViewController = [segue destinationViewController];
        [trainCheckerViewController setDelegate:self];
        
    }
}


//TODO: include tap outside of screen to dismiss keyboard too.

@end
