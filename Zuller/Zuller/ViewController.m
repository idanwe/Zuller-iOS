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
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(onSearchRequestFinished:) name:@"searchRequestFinished" object:nil];
    networkManager = [[NetworkManager alloc] init];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)zullerMyNight:(id)sender
{
    [networkManager searchRequest];
}

- (void)onSearchRequestFinished:(NSNotification *) notification
{
    ASIHTTPRequest *request = (ASIHTTPRequest*)[notification object];
    NSString *response = [request responseString];
    
    NSDictionary *parsedData = [JSONParser parse:response];
    
    // create attractions
    AttractionFactory *attractionFactory = [[AttractionFactory alloc] init];
    NSMutableArray *attractions = [[NSMutableArray alloc] init];
    for (NSDictionary *attractionDict in [parsedData valueForKey:@"Attractions"]) {
        Attraction *attraction = [attractionFactory createAttraction:attractionDict];
        [attractions addObject:attraction];
    }
    NSLog(@"attractions %@", attractions);

    // init attractions view controller and navigate to him
    AttractionsViewController * attractionsViewController = [[AttractionsViewController alloc] initWithAttractions:attractions];
    [self.navigationController pushViewController:attractionsViewController animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
