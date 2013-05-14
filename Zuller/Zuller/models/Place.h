//
//  Place.h
//  Zuller
//
//  Created by Idan Wender on 4/15/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Attraction.h"

@interface Place : Attraction

@property(retain, nonatomic) NSDate * openingHours;
@property(retain, nonatomic) NSString * menu;
@property(retain, nonatomic) NSDictionary * alcoholPrices;

@end
