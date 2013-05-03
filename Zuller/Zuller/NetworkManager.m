//
//  NetworkManager.m
//  Zuller
//
//  Created by Idan Wender on 4/20/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "NetworkManager.h"

#define BASE_URL @"http://zuller.herokuapp.com/"
#define SEARCH_URL @"search"

@implementation NetworkManager

static NSURL * baseUrl = nil;

+ (void) initialize {
    if (baseUrl == nil)
        baseUrl = [NSURL URLWithString:BASE_URL];
}

- (void)searchRequest
{
    NSURL *url = [NSURL URLWithString:SEARCH_URL relativeToURL:baseUrl];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setRequestMethod:@"POST"];
    [request setDelegate:self];
//    [request setUploadProgressDelegate:myProgressIndicator];
    [request startAsynchronous];
    
}

- (void)requestStarted:(ASIHTTPRequest *) request
{
    NSLog(@"request started");
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"requestFinished NetWorkManager");
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:@"searchRequestFinished" object:request];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    NSLog(@"request failed %@", error);
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:@"searchRequestFailed" object:request];
}
@end
