//
//  Attraction.h
//  Zuller
//
//  Created by Idan Wender on 4/15/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IParsable.h"

@interface Attraction : NSObject <IParsable>
    @property (retain, nonatomic) NSString * name;
    @property (retain, nonatomic) NSString * address;
    @property (retain, nonatomic) NSString * phone;
    @property int minAge;
    @property (retain, nonatomic) NSDate * timeDuration;
    @property (retain, nonatomic) NSString * logoUrl;
    @property (retain, nonatomic) NSMutableArray * imagesUrl;
    
@end
