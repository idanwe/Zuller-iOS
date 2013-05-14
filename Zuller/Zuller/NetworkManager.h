//
//  NetworkManager.h
//  Zuller
//
//  Created by Idan Wender on 4/20/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequest.h"

@interface NetworkManager : NSObject //<ASIHTTPRequestDelegate>

+ (void)initialize;

- (void)searchRequestWithDelegate:(id<ASIHTTPRequestDelegate>)delegate;

@end