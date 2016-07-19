//
//  LTMNSDataUtilityTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/19.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMNSDataUtility.h"

@interface LTMNSDataUtilityTests : XCTestCase

@end

@implementation LTMNSDataUtilityTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#define XCTStringTrue(str1, str2) XCTAssertTrue([str1 isEqualToString:str2])
- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    // UTF8 解码
    NSString *str1 = @"来疯";
    NSData *data1 = [str1 dataUsingEncoding: NSUTF8StringEncoding];
    NSString *res1 = [LTMNSDataUtility utf8StringWithData:data1];
    XCTStringTrue(str1, res1);
    
    
    // hex编码 转换为大写
    data1 = [str1 dataUsingEncoding:NSUTF8StringEncoding];
    res1 = [LTMNSDataUtility hexStringWithData:data1];
    XCTStringTrue(@"E69DA5E796AF", res1);
    
    
    // hex解码
    data1 =[LTMNSDataUtility dataWithHexString:@"3132"];
    str1 = [[NSString alloc]initWithData:data1 encoding:NSUTF8StringEncoding];
    XCTStringTrue(@"12", str1);
    
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
