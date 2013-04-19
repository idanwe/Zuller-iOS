//
//  AttractionFactory.m
//  Zuller
//
//  Created by Idan Wender on 4/15/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "AttractionFactory.h"
#import "Bar.h"
#import "Club.h"
#import "Line.h"
#import "Party.h"

@implementation AttractionFactory

- (Attraction *)create:(NSDictionary *)attractionDict
{
    NSArray *typeArray = [attractionDict allKeys]; // give the attractions type e.g. bar
    NSString *attractionType = [typeArray objectAtIndex:0];
    NSDictionary *data = [attractionDict valueForKey:attractionType];
    if([attractionType isEqualToString: @"bar"]) {
        return [[Bar alloc] initWithDict: data];
    }
    else if([attractionType isEqualToString: @"club"]) {
        return [[Club alloc] initWithDict: data];
    }
    else if([attractionType isEqualToString: @"line"]) {
        return [[Line alloc] initWithDict: data];
    }
    else if([attractionType isEqualToString: @"party"]) {
        return [[Party alloc] initWithDict: data];
    };
}

@end
