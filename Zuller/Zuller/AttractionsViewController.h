//
//  AttractionsViewController.h
//  Zuller
//
//  Created by Idan Wender on 5/3/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Attraction.h"

@interface AttractionsViewController : UITableViewController

@property(retain, nonatomic) NSMutableArray * attractions;

- (id)initWithAttractions:(NSMutableArray *) Attractions;


@end
