//
//  TestRequest.m
//  Snowplow
//
//  Copyright (c) 2013-2014 Snowplow Analytics Ltd. All rights reserved.
//
//  This program is licensed to you under the Apache License Version 2.0,
//  and you may not use this file except in compliance with the Apache License
//  Version 2.0. You may obtain a copy of the Apache License Version 2.0 at
//  http://www.apache.org/licenses/LICENSE-2.0.
//
//  Unless required by applicable law or agreed to in writing,
//  software distributed under the Apache License Version 2.0 is distributed on
//  an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
//  express or implied. See the Apache License Version 2.0 for the specific
//  language governing permissions and limitations there under.
//
//  Authors: Jonathan Almeida
//  Copyright: Copyright (c) 2013-2014 Snowplow Analytics Ltd
//  License: Apache License Version 2.0
//

#import <XCTest/XCTest.h>
#import "SnowplowRequest.h"
#import "SnowplowPayload.h"

@interface TestRequest : XCTestCase
extern NSString * const TEST_SERVER;
@end

@implementation TestRequest

//NSString *const TEST_SERVER = @"http://localhost:3000/events";
NSString *const TEST_SERVER = @"http://segfault.ngrok.com/events";

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testFlushBuffer
{

    NSURL *url = [[NSURL alloc] initWithString:TEST_SERVER];
    SnowplowRequest *sample_req = [[SnowplowRequest alloc] initWithURLRequest:url httpMethod:@"POST"];
    SnowplowPayload *sample_event = [[SnowplowPayload alloc] init];
    
    [sample_event addValueToPayload:@"something" withKey:@"nv"];
    [sample_event addValueToPayload:@"newstuff" withKey:@"pv"];
    
    [sample_req addPayloadToBuffer:sample_event];
    
    [sample_req flushBuffer];
}

@end
