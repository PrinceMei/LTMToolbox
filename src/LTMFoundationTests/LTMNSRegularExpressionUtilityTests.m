//
//  LTMNSRegularExpressionUtilityTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/29.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMNSRegularExpressionUtility.h"

@interface LTMNSRegularExpressionUtilityTests : XCTestCase

@end

@implementation LTMNSRegularExpressionUtilityTests

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
    
    // 网址
    NSString *regx = @"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+";
    [LTMNSRegularExpressionUtility matchsInString:@"http://v.laifeng.com/74165" regex:regx];
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
