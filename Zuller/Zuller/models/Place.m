//
//  Place.m
//  Zuller
//
//  Created by Idan Wender on 4/15/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "Place.h"

@implementation Place
@synthesize _id, name, address, music, phoneNumber, date, logo, minAge, weight;

#pragma mark - Init methods

- (id)initWithDict:(NSDictionary *)jsonDict
{
    self = [super init];
    if (self) {
        _id = [jsonDict valueForKey:@"_id"];
        name = [jsonDict valueForKey:@"name"];
        address = [jsonDict valueForKey:@"address"];
        music = [jsonDict valueForKey:@"music"];
        phoneNumber = [jsonDict valueForKey:@"phoneNumber"];
        date = [jsonDict valueForKey:@"date"];
        logo = [jsonDict valueForKey:@"logo"];
        minAge = [[jsonDict valueForKey:@"minAge"] intValue];
        weight = [[jsonDict valueForKey:@"weight"] intValue];
    }
    return self;
}

@end
