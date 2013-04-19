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

@property(retain, nonatomic) NSString * _id;
@property(retain, nonatomic) NSString * name;
@property(retain, nonatomic) NSString * address;
@property(retain, nonatomic) NSString * music;
@property(retain, nonatomic) NSString * phoneNumber;
@property(retain, nonatomic) NSDate * date;
@property(retain, nonatomic) NSString * logo;
@property int minAge;
@property int weight;

@end
