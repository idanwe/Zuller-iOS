//
//  JSONParser.m
//  Zuller
//
//  Created by Idan Wender on 5/4/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "JSONParser.h"

@implementation JSONParser

+ (NSDictionary *)parse:(NSString *)response
{
    JSONDecoder * decoder = [[JSONDecoder alloc] init];
    NSData * data = [response dataUsingEncoding: NSUTF8StringEncoding];
    NSDictionary * parsedData = [decoder objectWithData:data];
    return parsedData;
}

@end
