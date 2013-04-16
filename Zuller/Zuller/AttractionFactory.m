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

- (Attraction *)create:(NSString *)responseJSON
{
    NSString * jsonAsString = responseJSON.copy;
    NSDictionary * attractionDict = [jsonAsString objectFromJSONString];
    NSString * attractionType = [attractionDict valueForKey: @"type"];
    if([attractionType isEqualToString: @"bar"]) {
        return [[Bar alloc] initWithDict: attractionDict];
    }
    else if([attractionType isEqualToString: @"club"]) {
        return [[Club alloc] initWithDict: attractionDict];
    }
    else if([attractionType isEqualToString: @"line"]) {
        return [[Line alloc] initWithDict: attractionDict];
    }
    else if([attractionType isEqualToString: @"party"]) {
        return [[Party alloc] initWithDict: attractionDict];
    };
}

@end
