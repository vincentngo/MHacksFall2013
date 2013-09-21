//
//  VJTrainCheckerViewController.m
//  MHacks
//
//  Created by Vincent Ngo on 9/21/13.
//  Copyright (c) 2013 VincentJouella. All rights reserved.
//

#import "VJTrainCheckerViewController.h"

@interface VJTrainCheckerViewController ()

@end

@implementation VJTrainCheckerViewController

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
	
    // Obtain an object reference to the App Delegate object
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // Set the local instance variable to the obj ref of the metroLines dictionary
    // data structure created in the App Delegate class
    self.metroLinesDict = appDelegate.dcMetroLinesList;
    
    //Set the default listOfStopsForNow
    //TODO: May want to create a singleton for App State to respect user's choices.
    self.listOfStopColors = [self.metroLinesDict allKeys];
    
    //initially sets the line to red. to present some form of data.
    self.listOfStopPlaces = [self.metroLinesDict objectForKey:@"Red"];
    
    //Set Default
    self.colorSelected = @"Red";
    
    

}


#pragma mark - UITableView Data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listOfStopPlaces count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.listOfStopPlaces objectAtIndex:[indexPath row]];
    
    return cell;
}


#pragma mark - UITableView Delegates

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    self.listOfStopPlaces = [self.metroLinesDict objectForKey:self.colorSelected];
    
    self.stopSelected = [self.listOfStopPlaces objectAtIndex: [indexPath row]];
    
    [self.delegate setTrainCheckerViewController:self didFinishWithSave:YES];

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)metroLinePressed:(id)sender {
    
    int tagNumber = [sender tag];
    
    NSString *colorSelected;
    
    switch (tagNumber)
    {
        case 0:
            colorSelected = @"Red";
            break;
        case 1:
            colorSelected = @"Orange";
            break;
        case 2:
            colorSelected = @"Green";
            break;
        case 3:
            colorSelected = @"Yellow";
            break;
        case 4:
            colorSelected = @"Blue";
            break;
    
        default:
            break;
    }
    
    self.colorSelected = colorSelected;
    
    self.listOfStopPlaces = [self.metroLinesDict objectForKey:colorSelected];
    
    [self.tableView reloadData];

}
@end
