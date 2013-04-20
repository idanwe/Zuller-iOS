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

}

- (IBAction)showZuller:(id)sender
{
    NSString *response = [self searchRequest];
    NSArray *parsedData = [self parseJSONResponse:response];
    
    AttractionFactory *attractionFactory = [[AttractionFactory alloc] init];
    NSMutableArray * attractions = [[NSMutableArray alloc] init];
    for (NSDictionary *attractionDict in parsedData) {
        Attraction *attraction = [attractionFactory create:attractionDict];
        [attractions addObject:attraction];
    }
    NSLog(@"attractions %@", attractions);
    [clubField setText:[[attractions objectAtIndex:0] valueForKey:@"name"]];
    [barField setText:[[attractions objectAtIndex:1] valueForKey:@"name"]];
}

- (NSString *)searchRequest
{
    NSURL *url = [NSURL URLWithString:@"http://zuller.herokuapp.com/search"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setRequestMethod:@"POST"];
    [request startSynchronous];
    
    NSError *error = [request error];
    if (!error) {
       return [request responseString];
    }
    else {
        return @"request fail";
    }

}

- (NSArray *)parseJSONResponse:(NSString *) response
{
    JSONDecoder* decoder = [[JSONDecoder alloc] init];
    NSData *data = [response dataUsingEncoding: NSUTF8StringEncoding];
    NSArray *parsedData = [decoder objectWithData:data];
    return parsedData;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
