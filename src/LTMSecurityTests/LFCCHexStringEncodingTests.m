//
//  LFCCHexStringEncodingTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/22.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LFCCHexStringEncoding.h"

@interface LFCCHexStringEncodingTests : XCTestCase

@end

@implementation LFCCHexStringEncodingTests

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
    
    
    // encode  将byte数组转化为字符串
    Byte byte[] = {1,255};
    
    NSString *str = [LFCCHexStringEncoding encodeBytes:byte length:2];
    NSString *res = @"01ff";
    XCTAssertTrue([str isEqualToString:res]);
    
    // encodeData
    NSData *data = [NSData dataWithBytes:byte length:2];
    NSString *res2 = [LFCCHexStringEncoding encodeData:data];
     XCTAssertTrue([str isEqualToString:res2]);
    
    
    // decode
    NSData *dataRes = [LFCCHexStringEncoding decode:res2];
    XCTAssertTrue([data isEqualToData:dataRes]);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
