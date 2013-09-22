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
    
    CLLocationManager *currentLocation = [[AppState sharedState]locationManager];
    
    [self.currentLocationLabel setText: [NSString stringWithFormat:@"Latitude is %f, and Longitude is %f", currentLocation.location.coordinate.latitude, currentLocation.location.coordinate.longitude]];
    
    self.metroLineColorView = nil;
    self.metroStopLabel = nil;
    self.metroColorSelected = nil;
}

#pragma mark- SetTrainCheckerViewControllerDelegate

-(void)setTrainCheckerViewController:(VJTrainCheckerViewController *)controller didFinishWithSave:(BOOL)save
{
    if (save)
    {
        self.metroStopLabel.text = controller.stopSelected;
        
        self.metroColorSelected = controller.colorSelected;
        
        [self.metroLineColorView setBackgroundColor:[ColorPickerHelper getColorWithColorName:controller.colorSelected]];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)donePressed
{
    
    if ((self.metroLineColorView == nil && self.metroStopLabel == nil && self.metroColorSelected == nil))
    {
        [self displayNoMetroStopSelectedAlert];
    }
    else if([self.countryTextField.text length] == 0 && [self.cityTextField.text length] == 0 &&  [self.streetTextField.text length] == 0)
    {
        [self displayTextfieldEmptyAlert];
    }
    else
    {
        [self.delegate setNewAlarmController:self didFinishWithSave:YES];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
    
    
}
//TODO: Bug fix, UIView...


- (void)displayNoMetroStopSelectedAlert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Metro Stop"
                                                    message:@"Please select a metro stop, by hitting the disclosure indicator."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    [alert show];
}

- (void)displayTextfieldEmptyAlert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Address Field"
                                                    message:@"You must include the street, city and country of your designated area."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    [alert show];
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
