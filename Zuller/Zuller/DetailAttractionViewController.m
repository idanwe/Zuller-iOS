//
//  DetailAttractionViewController.m
//  Zuller
//
//  Created by Idan Wender on 5/4/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "DetailAttractionViewController.h"

@interface DetailAttractionViewController ()

@end

@implementation DetailAttractionViewController
@synthesize attraction;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithAttraction:(Attraction *)attractionData
{
    self = [super init];
    if (self){
        attraction = attractionData;    
        [self InitializeGUI];
    }
       
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [attrName setText:[attraction name]];
    NSLog(@"%@", attrName.text);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)InitializeGUI
{
     //Insert all bla bla button text 
}

@end
