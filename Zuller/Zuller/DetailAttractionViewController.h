//
//  DetailAttractionViewController.h
//  Zuller
//
//  Created by Idan Wender on 5/4/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Attraction.h"
@interface DetailAttractionViewController : UIViewController
{
    IBOutlet UILabel * attrName;
}

@property(retain, nonatomic) Attraction * attraction;

- (id)initWithAttraction:(Attraction *)attractionData;
-(void)InitializeGUI;

@end
