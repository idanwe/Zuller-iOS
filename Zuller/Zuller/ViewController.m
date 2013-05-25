//
//  ViewController.m
//  Zuller
//
//  Created by Idan Wender on 4/14/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end

@implementation ViewController
@synthesize networkManager, spinner;

- (void)viewDidLoad
{
    [super viewDidLoad];
    networkManager = [[NetworkManager alloc] init];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithTitle:@"Logout"
                                              style:UIBarButtonItemStyleBordered
                                              target:self
                                              action:@selector(logoutButtonWasPressed:)];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)zullerMyNight:(id)sender
{
    [networkManager searchRequestWithDelegate:self];
    [self.spinner startAnimating];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    [self.spinner stopAnimating];
    NSString *response = [request responseString];
    NSDictionary *parsedData = [JSONParser parse:response];
    NSLog(@"parsedData %@", parsedData);
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

- (void)requestStarted:(ASIHTTPRequest *)request
{
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
}

-(void)logoutButtonWasPressed:(id)sender {
    [FBSession.activeSession closeAndClearTokenInformation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//TEST image chooser
-(IBAction)goToImageChooser:(id)sender
{
     AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        ImageChooserViewController * imageChooserVC = [[ImageChooserViewController alloc]initWithCategoryName:@"Music" andNumberToTitleDictionary:[appDelegate.userPreferncesDictionary objectForKey:@"Music"]];
    [imageChooserVC setImageChooserDelegate:appDelegate];
    [self.navigationController pushViewController:imageChooserVC animated:YES];
}

@end
