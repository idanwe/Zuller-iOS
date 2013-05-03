//
//  ViewController.m
//  Zuller
//
//  Created by Idan Wender on 4/14/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize networkManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.

}

- (IBAction)zullerMyNight:(id)sender
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(onSearchRequestFinished:) name:@"searchRequestFinished" object:nil];
    networkManager = [[NetworkManager alloc] init];
    [networkManager searchRequest];
}

- (void)onSearchRequestFinished:(NSNotification *) notification
{
    ASIHTTPRequest *request = (ASIHTTPRequest*)[notification object];
    
    NSString *response = [request responseString];
    NSArray *parsedData = [self parseJSONResponse:response];
    
    AttractionFactory *attractionFactory = [[AttractionFactory alloc] init];
    NSMutableArray * attractions = [[NSMutableArray alloc] init];
    for (NSDictionary *attractionDict in parsedData) {
        Attraction *attraction = [attractionFactory createAttraction:attractionDict];
        [attractions addObject:attraction];
    }
    NSLog(@"attractions %@", attractions);

//    ViewController *s = [[ViewController alloc]init];
//    [navigationController addChildViewController:s];
//
//    [self.navigationController pushViewController:ListViewControoler animated:YES]
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
