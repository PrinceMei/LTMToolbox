//
//  LTMURLCoderTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/21.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMURLCoder.h"

@interface LTMURLCoderTests : XCTestCase

@end

@implementation LTMURLCoderTests

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
    
    NSString *str = @"来疯laifeng";
    NSString *str1 =  [LTMURLCoder encode:str];
    NSString *res = [LTMURLCoder decode:str1];
    
    XCTAssertTrue([str isEqualToString:res]);
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
