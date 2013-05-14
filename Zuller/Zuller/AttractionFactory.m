//
//  AttractionFactory.m
//  Zuller
//
//  Created by Idan Wender on 4/15/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "AttractionFactory.h"

@implementation AttractionFactory

- (Attraction *)createAttraction:(NSDictionary *)attractionDict
{
    NSString *attractionType = [self getType:attractionDict];
    NSDictionary *data = [attractionDict valueForKey:attractionType];
    
    if([attractionType isEqualToString: @"Bar"]) {
        return [[Bar alloc] initWithDict: data];
    }
    else if([attractionType isEqualToString: @"Club"]) {
        return [[Club alloc] initWithDict: data];
    }
    else if([attractionType isEqualToString: @"Line"]) {
        return [[Line alloc] initWithDict: data];
    }
    else if([attractionType isEqualToString: @"Party"]) {
        return [[Party alloc] initWithDict: data];
    };
}

- (NSString *)getType:(NSDictionary *)attractionDict
{
    NSArray *typeArray = [attractionDict allKeys];
    return [typeArray objectAtIndex:0];
}

@end
