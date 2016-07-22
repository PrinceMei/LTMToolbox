//
//  LTMURLArgumentsTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/22.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMURLArguments.h"

@interface LTMURLArgumentsTests : XCTestCase

@end

@implementation LTMURLArgumentsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    

    //queryStr 不包含baseURL
    NSString *queryStr = @"d=admin&c=manage&m=get_view_category&type=2&isInReview=0&muban_data_ver=8&apptype=3";
    NSDictionary *dic = [LTMURLArguments dictionaryWithQueryString:queryStr];

    NSDictionary *resDic = @{
                             @"apptype" : @"3",
                             @"c" : @"manage",
                             @"isInReview" : @"0",
                             @"m" : @"get_view_category",
                             @"muban_data_ver" : @"8",
                             @"type" : @"2",
                             @"d" : @"admin"
                             };
    
    XCTAssertTrue([dic isEqualToDictionary:resDic]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
