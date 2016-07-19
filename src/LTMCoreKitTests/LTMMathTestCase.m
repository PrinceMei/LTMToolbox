//
//  LTMMathTestCase.m
//  LTMToolbox
//
//  Created by zhiwei wang on 16/7/18.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMCoreKit.h"

@interface LTMMathTestCase : XCTestCase

@end

@implementation LTMMathTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    CGRect testRect = CGRectMake(123.33, 345.45, 45.98, 34.98);
    
    CGRect floorRect = [LTMMath floorCGRect:testRect];
    XCTAssertTrue(CGRectEqualToRect(CGRectMake(123, 345, 45, 34), floorRect));
    
    CGRect ceilCGRect = [LTMMath ceilCGRect:testRect];
    XCTAssertTrue(CGRectEqualToRect(CGRectMake(124, 346, 46, 35), ceilCGRect));
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
