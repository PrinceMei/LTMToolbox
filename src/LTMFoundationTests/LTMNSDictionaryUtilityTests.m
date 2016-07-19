//
//  LTMNSDictionaryUtilityTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/19.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMNSDictionaryUtility.h"

static inline bool compareStringArr(NSArray *arr1, NSArray *arr2) {
    if (arr1.count != arr2.count) {
        return NO;
    }else{
        for (int i = 0 ; i < arr1.count; i++) {
            if (![arr1[i] isEqualToString:arr2[i]]) {
                return NO;
                break;
            }
        }
    }
    return YES;
}

@interface LTMNSDictionaryUtilityTests : XCTestCase

@end

@implementation LTMNSDictionaryUtilityTests

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
    
    
    // 返回所有的keys 按字典排列
    NSDictionary *dic = @{
                          @"b"    : @"213",
                          @"来疯"  : @"12",
                          @"a123" : @"1",
                          @"z"    : @"x"
                          };
    NSArray *arr1 = @[
                     @"a123",
                     @"b",
                     @"z",
                     @"来疯"
                     ];
    
    NSArray *arr2 = [LTMNSDictionaryUtility allKeysSorted:dic];
    XCTAssert(compareStringArr(arr1, arr2));
    
    
    // 返回所有的values 按字典排序
    NSArray *arr3 = @[
                      @"1",
                      @"213",
                      @"x",
                      @"12"
                      ];
    NSArray *arr4 = [LTMNSDictionaryUtility allValuesSortedByKeys:dic];
    XCTAssert(compareStringArr(arr3, arr4));
    
    
    // key -> double
    dic = @{
            @"s" : @"3.14",
            @"s1" : @[]
            };
   double d1 = [LTMNSDictionaryUtility dictionary:dic doubleForKey:@"s" defaultValue:3.14];
   double d2 = [LTMNSDictionaryUtility dictionary:dic doubleForKey:@"s1" defaultValue:2];
   double d3 = [LTMNSDictionaryUtility dictionary:dic doubleForKey:@"s2" defaultValue:4];
    XCTAssertEqualWithAccuracy(d1, 3.14, 3);
    XCTAssertEqualWithAccuracy(d2, 2, 3);
    XCTAssertEqualWithAccuracy(d3, 4, 3);
    
    
    
    // key -> float
    dic = @{
            @"s" : @"3.14",
            @"s1" : @[]
            };
    float f1 = [LTMNSDictionaryUtility dictionary:dic floatForKey:@"s" defaultValue:3.14];
    float f2 = [LTMNSDictionaryUtility dictionary:dic floatForKey:@"s1" defaultValue:2];
    float f3 = [LTMNSDictionaryUtility dictionary:dic floatForKey:@"s2" defaultValue:4];
    XCTAssertEqualWithAccuracy(f1, 3.14, 3);
    XCTAssertEqualWithAccuracy(f2, 2, 3);
    XCTAssertEqualWithAccuracy(f3, 4, 3);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
