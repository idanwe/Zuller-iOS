//
//  Attraction.m
//  Zuller
//
//  Created by Idan Wender on 4/15/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "Attraction.h"

@implementation Attraction
@synthesize _id, name, address, minAge, logo, phoneNumber, music, weight;

- (id)initWithDict:(NSDictionary *)jsonDictionary
{
    [NSException exceptionWithName:@"unimplement method" reason:@"subclass must implement this method" userInfo:nil];
    return self;
}

@end
