//
//  AppDelegate.m
//  MHacks
//
//  Created by Vincent Ngo on 9/21/13.
//  Copyright (c) 2013 VincentJouella. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    
    //Display custom
    [self displayCustomDesign];
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    
#if 0
    NSLog(@"documentsDirectoryPath is: %@", documentsDirectoryPath);
#endif
    
    NSString *plistFilePathInDocumentsDirectory = [documentsDirectoryPath stringByAppendingPathComponent:@"DCMetroLines.plist"];
    
    
#if 0
    NSLog(@"plistFilePathInDD is %@", plistFilePathInDocumentsDirectory);
#endif
    
    NSMutableDictionary *metroData = [[NSMutableDictionary alloc] initWithContentsOfFile:plistFilePathInDocumentsDirectory];
    
    if (!metroData)
    {
        /*
         In this case, the MeterConversionList.plist file does not exist in the documents directory.
         This will happen when the user launches the app for the very first time.
         Therefore, read the plist file from the main bundle to show the user some example favorite cities.
         
         Get the file path to the MeterConversionList.plist file in application's main bundle.
         */
        
        NSString *plistFilePathInMainBundle = [[NSBundle mainBundle] pathForResource:@"DCMetroLines" ofType:@"plist"];
        
        // Instantiate a modifiable dictionary and initialize it with the content of the plist file in main bundle
        metroData = [[NSMutableDictionary alloc] initWithContentsOfFile:plistFilePathInMainBundle];
    }
    
    self.dcMetroLinesList = metroData;
    
    [Parse setApplicationId:@"Q1VtTnkXXuFFd95V60wK1XOjlYDGd9cKXDPLjf5P"
                  clientKey:@"rOIT6XkPTWIeXVUxHeNOblMk0xsiUxgnaN93yW4L"];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];

    return YES;
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // Store the deviceToken in the current Installation and save it to Parse.
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.

    
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)displayCustomDesign
{
    // style the navigation bar
    UIColor* navColor = [UIColor colorWithRed:128.0/255.0f green:128.0/255.0f blue:128.0/255.0f alpha:1.0f];
    [[UINavigationBar appearance] setBarTintColor:navColor];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    // make the status bar white
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

@end
