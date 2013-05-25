//
//  AppDelegate.m
//  Zuller
//
//  Created by Idan Wender on 4/14/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "FBLoginViewController.h"

@implementation AppDelegate
@synthesize navigationController, viewController, audioPlayer,userPreferncesDictionary;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Media player
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"NoLight" ofType:@"mp3"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    audioPlayer.numberOfLoops = 1; //infinite
    audioPlayer.currentTime = 10;
    [audioPlayer play];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
    } else {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
    }
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
 
    // See if the app has a valid token for the current state.
    if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded) {
        // To-do, show logged in view
        // Yes, so just open the session (this won't display any UX).
        [self openSession];
    } else {
        [self showLoginView];
    }
    
    [self initUserPreferencesDictionaries];

    return YES;
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

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.

    // We need to properly handle activation of the application with regards to Facebook Login
    // (e.g., returning from iOS 6.0 Login Dialog or from fast app switching).
    [FBSession.activeSession handleDidBecomeActive];
}


#pragma mark -
#pragma mark - Facebook Delegate

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [FBSession.activeSession handleOpenURL:url];
}


- (void)showLoginView
{
    UIViewController *topViewController = [self.navigationController topViewController];
    UIViewController *modalViewController = [topViewController modalViewController];
    
    // If the login screen is not already displayed, display it. If the login screen is
    // displayed, then getting back here means the login in progress did not successfully
    // complete. In that case, notify the login view so it can update its UI appropriately.
    if (![modalViewController isKindOfClass:[FBLoginViewController class]]) {
        FBLoginViewController* loginViewController = [[FBLoginViewController alloc]
                                                      initWithNibName:@"FBLoginViewController"
                                                      bundle:nil];
        [topViewController presentModalViewController:loginViewController animated:NO];
    } else {
        FBLoginViewController* loginViewController =
        (FBLoginViewController*)modalViewController;
        [loginViewController loginFailed];
    }
}

- (void)sessionStateChanged:(FBSession *)session
                      state:(FBSessionState) state
                      error:(NSError *)error
{
    switch (state) {
        case FBSessionStateOpen: {
            UIViewController *topViewController = [self.navigationController topViewController];
            if ([[topViewController modalViewController] isKindOfClass:[FBLoginViewController class]]) {
                [topViewController dismissModalViewControllerAnimated:YES];
            }
        }
            break;
        case FBSessionStateClosed:
        case FBSessionStateClosedLoginFailed:
            // Once the user has logged in, we want them to
            // be looking at the root view.
            [self.navigationController popToRootViewControllerAnimated:NO];
            
            [FBSession.activeSession closeAndClearTokenInformation];
            
            [self showLoginView];
            break;
        default:
            break;
    }
    
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Error"
                                  message:error.localizedDescription
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
}

- (void)openSession
{
    [FBSession openActiveSessionWithReadPermissions:nil
                                       allowLoginUI:YES
                                  completionHandler:
     ^(FBSession *session, FBSessionState state, NSError *error) {
         [self sessionStateChanged:session state:state error:error];
     }];
}
#pragma mark - 
#pragma mark - Private methods
-(void)initUserPreferencesDictionaries
{
    NSMutableDictionary * musicDictionary = [[NSMutableDictionary alloc]init];
    [musicDictionary setObject:@"אלטרנטיבי" forKey:@"1"];
    [musicDictionary setObject:@"פופ" forKey:@"2"];
    [musicDictionary setObject:@"רוק מתקדם" forKey:@"3"];
    [musicDictionary setObject:@"מזרחית" forKey:@"4"];
    [musicDictionary setObject:@"טראנס" forKey:@"5"];
    
    NSMutableDictionary* ageDictionary = [[NSMutableDictionary alloc]init];
    [ageDictionary setObject:@"18-19" forKey:@"1"];
    [ageDictionary setObject:@"20-21" forKey:@"2"];
    [ageDictionary setObject:@"22-23" forKey:@"3"];
    [ageDictionary setObject:@"24-25" forKey:@"4"];
    [ageDictionary setObject:@"25+" forKey:@"5"];
    
    NSMutableDictionary* locationDictionary = [[NSMutableDictionary alloc]init];
    [locationDictionary setObject:@"18-19" forKey:@"1"];
    [locationDictionary setObject:@"20-21" forKey:@"2"];
    [locationDictionary setObject:@"22-23" forKey:@"3"];
    [locationDictionary setObject:@"24-25" forKey:@"4"];
    [locationDictionary setObject:@"25+" forKey:@"5"];
    
    NSMutableDictionary* specificLocationDictionary = [[NSMutableDictionary alloc]init];
    [specificLocationDictionary setObject:@"18-19" forKey:@"1"];
    [specificLocationDictionary setObject:@"20-21" forKey:@"2"];
    [specificLocationDictionary setObject:@"22-23" forKey:@"3"];
    [specificLocationDictionary setObject:@"24-25" forKey:@"4"];
    [specificLocationDictionary setObject:@"25+" forKey:@"5"];
    
    userPreferncesDictionary = [[NSMutableDictionary alloc]init];
    [userPreferncesDictionary setObject:musicDictionary forKey:@"Music"];
    [userPreferncesDictionary setObject:ageDictionary forKey:@"Age"];
    [userPreferncesDictionary setObject:locationDictionary forKey:@"Location"];
    [userPreferncesDictionary setObject:locationDictionary forKey:@"Specific Location"];
    
    
}
#pragma mark - 
#pragma mark - ImageChooser Delegate
-(void)imageChooserClickedLastButton:(ImageChooserViewController *)viewController
{
    NSString * categoryName = viewController.viewCategoryName;
    
    if ([categoryName isEqualToString:@"Music"])
    {
        NSLog(@"Moved To age");
        ImageChooserViewController * imageChooserVC = [[ImageChooserViewController alloc]initWithCategoryName:@"Age" andNumberToTitleDictionary:[userPreferncesDictionary objectForKey:@"Age"]];
        [imageChooserVC setImageChooserDelegate:self];
        [self.navigationController pushViewController:imageChooserVC animated:YES];
    }
    else if ([categoryName isEqualToString:@"Age"])
    {
        NSLog(@"Moved To Location");
    }
    else if ([categoryName isEqualToString:@"Location"])
    {
        NSLog(@"Moved To Specific Location");
    }
    else if ([categoryName isEqualToString:@"Specifc Location"])
    {
        NSLog(@"Moved To App main");
    }
    
}

@end
