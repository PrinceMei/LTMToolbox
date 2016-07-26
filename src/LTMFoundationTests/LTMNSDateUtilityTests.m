//
//  LTMNSDateUtilityTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/19.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMNSDateUtility.h"

@interface LTMNSDateUtilityTests : XCTestCase

@end

@implementation LTMNSDateUtilityTests

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
    
    
    // 将日期格式转化为字符串
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:0];
    NSString *str = [LTMNSDateUtility stringWithDate:date format:@"yyyy-MM-dd"];
    XCTStringTrue(@"1970-01-01", str);
    
    str = [LTMNSDateUtility stringWithDate:date format:@"yy/MM/dd ss"];
    XCTStringTrue(@"70/01/01 00", str);
    
    // 将日期格式转化为字符串 timeZone locale
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSLocale *locale = [NSLocale systemLocale];
    
    str = [LTMNSDateUtility stringWithDate:date format:@"yyyy-MM-dd" timeZone:zone locale:locale];
    XCTStringTrue(@"1970-01-01", str);
    
    // ISO8601格式
    str = [LTMNSDateUtility stringWithISOFormat:date];
    XCTStringTrue(@"1970-01-01T08:00:00+0800", str);
    /// 实际得到的结果为1970-01-01T08:00:00+0800
    
    str = @"2016-07-19 15:34:50";
    date = [LTMNSDateUtility dateWithString:str format:@"yyyy-MM-dd HH:mm:ss"];
    //  2016-07-19 07:34:50 +0000
    
    // 将ISO8601 解析成日期
    str = @"2010-07-09T16:13:30+12:00";
    date = [LTMNSDateUtility dateWithISOFormatString:str];
    // 2010-07-09 04:13:30 +0000
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
