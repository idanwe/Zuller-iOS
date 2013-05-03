//
//  NetworkManager.m
//  Zuller
//
//  Created by Idan Wender on 4/20/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

static const NSString * urlString = @"http://zuller.herokuapp.com/search";

- (void)searchRequest
{
    NSURL *url = [NSURL URLWithString:urlString];
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
