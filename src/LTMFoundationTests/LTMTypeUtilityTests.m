//
//  LTMTypeUtilityTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/21.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMTypeUtility.h"

@interface LTMTypeUtilityTests : XCTestCase

@end

@implementation LTMTypeUtilityTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testObject {

    // 将 NSString、NSNumber、NSURL 对象 转化为 NSString对象
    XCTAssertTrue([@"123" isEqualToString:[LTMTypeUtility stringValue:@(123)]]);
    XCTAssertTrue([@"123" isEqualToString:[LTMTypeUtility stringValue:[NSURL URLWithString:@"123"]]]);
    XCTAssertNil([LTMTypeUtility stringValue:[NSDate date]]);
    
    // 将 NSArray、 NSMutableArray 转化为 NSArray
    id arr =  [LTMTypeUtility arrayValue:[NSMutableArray arrayWithObjects:@"123", nil]];
    XCTAssertTrue([arr isEqualToArray:@[@"123"]]);
    arr = [LTMTypeUtility arrayValue:@{@"ab":@"123"}];
    XCTAssertNil(arr);
    
    // 将 NSDictionary、 NSMutableDictionary 转化为 NSDictionary
    id dic = [LTMTypeUtility dictionaryValue:@{@"a":@"123"}.mutableCopy];
    XCTAssertTrue([dic isEqualToDictionary:@{@"a":@"123"}]);
    dic = [LTMTypeUtility dictionaryValue:@[]];
    XCTAssertNil(dic);
    
    // 将 NSURL、NSString 转化为 NSURL
    id url = [LTMTypeUtility URLValue:@"1234"];
    XCTAssertTrue([[NSURL URLWithString:@"1234"] isEqual:url]);
    
    // 将 NSNumber、 NSMutableNumber、 (NSString、 NSMutableString)[数字类型] 转化为 NSNumber
    id num = [LTMTypeUtility numberValue:@(123)];
    XCTAssertTrue([num isEqual:@(123)]);
    num = [LTMTypeUtility numberValue:@"1234"];
    XCTAssertTrue([num isEqual:@(1234)]);
    num = [LTMTypeUtility  numberValue:@"ad我的123"];
    XCTAssertNil(num);
    
    // 获取指定格式的NSNumber
    NSNumberFormatter *numF = [[NSNumberFormatter alloc]init];
    numF.numberStyle = kCFNumberFormatterScientificStyle;
    num = [LTMTypeUtility numberWithString:@"123456" formatter:numF];
    XCTAssertTrue([num isEqual:@(123456)]);
}

- (void)testChar{
    // char(-128~127)
    int ch = [LTMTypeUtility charValue:@(-128)];
    
    // unsigned char (0~255)
    int unCh = [LTMTypeUtility unsignedCharValue:@(255)];
    
    XCTAssertTrue(ch = -128);
    XCTAssertTrue(unCh = 255);
    
    unCh = [LTMTypeUtility unsignedCharValue:@(-128)];
    XCTAssertNotEqual(-128, unCh);
    
    ch = [LTMTypeUtility charValue:@(200)];
    XCTAssertNotEqual(ch, 200);
}



- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
