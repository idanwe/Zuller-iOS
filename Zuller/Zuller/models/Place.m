//
//  Place.m
//  Zuller
//
//  Created by Idan Wender on 4/15/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "Place.h"

@implementation Place
@synthesize _id, name, address, minAge, logo, phoneNumber, music, openingHours, menu, alcoholPrices, weight;

#pragma mark - Init methods

- (id)initWithDict:(NSDictionary *)jsonDict
{
    self = [super init];
    if (self) {
        _id = [jsonDict valueForKey:@"_id"];
        name = [jsonDict valueForKey:@"name"];
        address = [jsonDict valueForKey:@"address"];
        minAge = [[jsonDict valueForKey:@"min_age"] intValue];
        logo = [jsonDict valueForKey:@"logo"];
        phoneNumber = [jsonDict valueForKey:@"phone_number"];
        music = [jsonDict valueForKey:@"music"];
        openingHours = [jsonDict valueForKey:@"opening_hours"];
        menu = [jsonDict valueForKey:@"menu"];
        alcoholPrices = [jsonDict valueForKey:@"alcohol_prices"];
        weight = [[jsonDict valueForKey:@"weight"] intValue];
    }
    return self;
}

@end
