//
//  AppDelegate.h
//  Zuller
//
//  Created by Idan Wender on 4/14/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@class ViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

- (void)showLoginView;
- (void)openSession;

@property (strong, nonatomic) UINavigationController *navigationController;

@property (strong, nonatomic) UIWindow *window;

//@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) ViewController *viewController;


@end
