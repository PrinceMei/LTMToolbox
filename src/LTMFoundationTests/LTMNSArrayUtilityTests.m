//
//  LTMNSArrayUtilityTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/20.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMNSArrayUtility.h"


static inline bool compareArr(NSArray *arr1, NSArray *arr2) {
    if (arr1.count != arr2.count) {
        return NO;
    }else{
        for (int i = 0 ; i < arr1.count; i++) {
            if (![arr1[i] isEqual:arr2[i]]) {
                return NO;
                break;
            }
        }
    }
    return YES;
}

@interface LTMNSArrayUtilityTests : XCTestCase

@end

@implementation LTMNSArrayUtilityTests

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
    
    
    //  merge Array1 Array2 construct a newArray
    NSArray *arr1 = @[
                      @"C",
                      @"b",
                      @"a"
                      ];
    
    NSArray *arr2 = @[
                      @"3",
                      @"5",
                      ];
    
    NSArray *arr3 = [LTMNSArrayUtility mergeArray1:arr1 array2:arr2 mergeSelector:nil];
    
    NSArray *arr4 = @[
                      @"3",
                      @"5",
                      @"C",
                      @"a",
                      @"b"
                      ];
    
    XCTAssertTrue(compareArr(arr3, arr4));
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
