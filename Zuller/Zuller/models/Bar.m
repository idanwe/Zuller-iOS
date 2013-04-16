//
//  Bar.m
//  Zuller
//
//  Created by Idan Wender on 4/15/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "Bar.h"

@implementation Bar
@synthesize name, address, phone, minAge, timeDuration, logoUrl, imagesUrl;

- (id)initWithDict:(NSDictionary *)jsonDict
{
    if(self = [super init]) {
        name = [jsonDict valueForKey:@"name"];
        address = [jsonDict valueForKey:@"address"];
        phone = [jsonDict valueForKey:@"phone"];
        minAge = [[jsonDict valueForKey:@"minAge"] intValue];
        timeDuration = [jsonDict valueForKey:@"timeDuration"];
        logoUrl = [jsonDict valueForKey:@"logoUrl"];
        imagesUrl = [jsonDict valueForKey:@"imagesUrl"];
    }
    
    return self;
}
@end
