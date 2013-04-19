//
//  Attraction.m
//  Zuller
//
//  Created by Idan Wender on 4/15/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "Attraction.h"

@implementation Attraction
@synthesize _id, name, address, music, phoneNumber, date, logo, minAge, weight;

- (id)initWithDict:(NSDictionary *)jsonDictionary
{
    [NSException exceptionWithName:@"unimplement method" reason:@"subclass must implement this method" userInfo:nil];
}

@end
