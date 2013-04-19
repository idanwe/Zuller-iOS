//
//  ViewController.m
//  Zuller
//
//  Created by Idan Wender on 4/14/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD.h"
#import "ASIHTTPRequest.h"
#import "AttractionFactory.h"
#import "Attraction.h"
#import "JSONKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSURL *url = [NSURL URLWithString:@"http://zuller.herokuapp.com/search"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setRequestMethod:@"POST"];
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
        NSString *response = [request responseString];
        NSData *data = [response dataUsingEncoding: NSUTF8StringEncoding];
        
        AttractionFactory *attractionFactory = [[AttractionFactory alloc] init];
        JSONDecoder* decoder = [[JSONDecoder alloc] init];
        NSArray *deserializedData = [decoder objectWithData:data];
        NSLog(@"deserializedData -> %@", deserializedData);
        
        NSMutableArray * attractions = [[NSMutableArray alloc] init];
        for (NSDictionary *attractionDict in deserializedData) {
//            NSLog(@"bar -> %@", attractionDict);
//            NSDictionary* attractionData = [attractionDict valueForKey:@"bar"];
//            NSLog(@"bar values -> %@", attractionData);
//            NSLog(@"bar name -> %@", [attractionData valueForKey:@"name"]);
            Attraction *attraction = [attractionFactory create:((NSString *)attractionDict)];
            [attractions addObject:attraction];
        }
        NSLog(@"attractions %@", attractions);
        NSLog(@"finish");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
