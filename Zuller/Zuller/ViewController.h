//
//  ViewController.h
//  Zuller
//
//  Created by Idan Wender on 4/14/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "MBProgressHUD.h"
#import "JSONParser.h"
#import "NetworkManager.h"
#import "AttractionFactory.h"
#import "Attraction.h"
#import "AttractionsViewController.h"


@interface ViewController : UIViewController

@property(strong) NetworkManager * networkManager;

- (IBAction)zullerMyNight:(id)sender;

- (void)onSearchRequestFinished:(ASIHTTPRequest *) request;

@end
