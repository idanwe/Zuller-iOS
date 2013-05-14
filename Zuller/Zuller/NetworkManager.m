//
//  NetworkManager.m
//  Zuller
//
//  Created by Idan Wender on 4/20/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "NetworkManager.h"

//#define BASE_URL @"http://zuller.herokuapp.com/"
//#define BASE_URL @"http://localhost:2222/"
//#define SEARCH_URL @"search"

#define BASE_URL @"http://localhost:3000/"
//#define BASE_URL @"http://zullerserver.herokuapp.com/"
#define SEARCH_URL @"home/search.json"

@implementation NetworkManager

static NSURL * baseUrl = nil;

+ (void)initialize {
    if (baseUrl == nil)
        baseUrl = [NSURL URLWithString:BASE_URL];
}

- (void)searchRequestWithDelegate:(id<ASIHTTPRequestDelegate>)delegate
{
    NSURL *url = [NSURL URLWithString:SEARCH_URL relativeToURL:baseUrl];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setRequestMethod:@"POST"];
    [request setDelegate:delegate];
//    [request setUploadProgressDelegate:myProgressIndicator];
    [request startAsynchronous];
}

@end
