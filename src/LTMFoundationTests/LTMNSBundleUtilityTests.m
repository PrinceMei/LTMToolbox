//
//  LTMNSBundleUtilityTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/29.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMNSBundleUtility.h"

@interface LTMNSBundleUtilityTests : XCTestCase

@end

@implementation LTMNSBundleUtilityTests

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
    
#warning - pathForScaledResource 内部的实现不能指定 mainBundle， 要适合任意bundle才行，逻辑测试中不含有mainBundle所以下面的方法不能通过
    NSString *bundlePath = [[NSBundle bundleForClass:[self class]] bundlePath];
    NSString *path =[LTMNSBundleUtility pathForScaledResource:@"test1" ofType:@"png" inDirectory:bundlePath];
    XCTAssertNotNil(path);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
