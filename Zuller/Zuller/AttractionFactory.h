//
//  AttractionFactory.h
//  Zuller
//
//  Created by Idan Wender on 4/15/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONKit.h"
#import "Attraction.h"

@interface AttractionFactory : NSObject
    - (Attraction *)create: (NSString *) responseJSON;
@end