//
//  Attraction.m
//  Zuller
//
//  Created by Idan Wender on 4/15/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "Attraction.h"

@implementation Attraction
@synthesize name, address, phone, minAge, timeDuration, logoUrl, imagesUrl;

- (id)initWithDict:(NSDictionary *)jsonDictionary
{
    NSAssert( false, @"Subclass must implement this method" );
    return nil;
}

@end
