//
//  NetworkManager.m
//  Zuller
//
//  Created by Idan Wender on 4/20/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "NetworkManager.h"

//#define BASE_URL @"http://localhost:3000/"
#define FACEBOOK_GRAPH_API = @"";

#define BASE_URL @"http://zullerserver.herokuapp.com/"
#define SEARCH_URL @"api/search.json"

@implementation NetworkManager

static NSURL * baseUrl = nil;

+ (void)initialize {
    if (baseUrl == nil)
        baseUrl = [NSURL URLWithString:BASE_URL];
}


-(ASIHTTPRequest*)createPostRequestWithUrl:(NSString*)url info:(NSDictionary *)postDictionary andDelegate:(id<ASIHTTPRequestDelegate>)delegate
{
	ASIFormDataRequest *postRequest = [ASIFormDataRequest requestWithURL:url];
    [postRequest setDelegate:delegate]
    for(id postKey in postDictionary)
     {
		[postRequest setPostValue:[postDictionary objectForKey:postKey] forKey:postKey];
	 }
    [postRequest setDelegate:delegate];

    return postRequest;
}


- (void)searchRequestWithDelegate:(id<ASIHTTPRequestDelegate>)delegate
{
    NSURL *searchUrl = [NSURL URLWithString:SEARCH_URL relativeToURL:baseUrl];
    ASIHTTPRequest *searchRequest = [self createPostRequestWithUrl:searchUrl info:nil andDelegate:delegate];
    [searchRequest startAsynchronous];

        // ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    // [request setRequestMethod:@"POST"];
    // [request setDelegate:delegate];
//    [request setUploadProgressDelegate:myProgressIndicator];
}

    

-(void)updateServer:(NSString *)updateUrl WithUserInformation:(NSDictionary *)userInformation andDelegate:(id<ASIHTTPRequestDelegate>)delegate
{
	NSURL *updateUrl = [NSURL URLWithString:updateUrl relativeToURL:baseUrl];
    ASIHTTPRequest *updateRequest = [self createPostRequestWithUrl:updateUrl info:userInformation andDelegate:delegate];
    [updateRequest startAsynchronous];
}



@end
