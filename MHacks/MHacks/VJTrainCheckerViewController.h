//
//  VJTrainCheckerViewController.h
//  MHacks
//
//  Created by Vincent Ngo on 9/21/13.
//  Copyright (c) 2013 VincentJouella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

/*
 We use the Delegation Design Pattern for the communication between the
 SetTrainCheckerViewController object and the RootViewController Object.
 We define a protocol here and the RootViewController adopts it.
 */
@protocol VJTrainCheckerViewControllerDelegate;

@interface VJTrainCheckerViewController : UITableViewController

- (IBAction)metroLinePressed:(id)sender;

@property (nonatomic, strong) NSMutableDictionary *metroLinesDict;

@property (nonatomic, strong) NSArray *listOfStopPlaces;

@property (nonatomic, strong) NSArray *listOfStopColors;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) id <VJTrainCheckerViewControllerDelegate> delegate;


//Saving selected Color and stop selected.
@property (nonatomic, strong) NSString *colorSelected;
@property (nonatomic, strong) NSString *stopSelected;


@end

@protocol VJTrainCheckerViewControllerDelegate

- (void)setTrainCheckerViewController:(VJTrainCheckerViewController *)controller didFinishWithSave: (BOOL)save;

@end
