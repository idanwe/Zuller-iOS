//
//  JSONParser.h
//  Zuller
//
//  Created by Idan Wender on 5/4/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONKit.h"

@interface JSONParser : NSObject

+ (NSDictionary *)parse:(NSString *)response;

@end
