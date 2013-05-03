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

@interface NetworkManager : NSObject<ASIHTTPRequestDelegate>

- (void)searchRequest;
-(void)requestStarted:(ASIHTTPRequest *)request;
-(void)requestFinished:(ASIHTTPRequest *)request;

@end