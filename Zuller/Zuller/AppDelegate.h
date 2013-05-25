//
//  AppDelegate.h
//  Zuller
//
//  Created by Idan Wender on 4/14/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//


#import <UIKit/UIKit.h>


#import <FacebookSDK/FacebookSDK.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

#include "ImageChooserViewController.h"

@class ViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate,ImageChooserDelegate>

- (void)showLoginView;
- (void)openSession;

@property (strong, nonatomic) UINavigationController *navigationController;

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) AVAudioPlayer * audioPlayer;
@property (strong, nonatomic) NSMutableDictionary * userPreferncesDictionary;
//@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) ViewController *viewController;

-(void)initUserPreferencesDictionaries;

@end
