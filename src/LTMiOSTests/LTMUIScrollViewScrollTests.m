//
//  LTMUIScrollViewUtilityTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/29.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMUIScrollView+Scroll.h"

@interface LTMUIScrollViewUtilityTests : XCTestCase

@end

@implementation LTMUIScrollViewUtilityTests

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
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = CGRectMake(0, 0, 200, 400);
    scrollView.contentOffset = CGPointMake(0, 100);
    [scrollView ltm_scrollToTopAnimated:YES];
    XCTAssert(CGPointEqualToPoint(scrollView.contentOffset, CGPointMake(0, 0)));
    
    
    scrollView.contentSize = CGSizeMake(200, 1000);
    [scrollView ltm_scrollToBottomAnimated:YES];
    XCTAssert(CGPointEqualToPoint(scrollView.contentOffset, CGPointMake(0, 600)));
    
    
    scrollView.contentOffset = CGPointMake(100, 0);
    [scrollView ltm_scrollToLeftAnimated:YES];
    XCTAssert(CGPointEqualToPoint(scrollView.contentOffset, CGPointMake(0, 0)));
    
    
    scrollView.contentSize = CGSizeMake(800, 400);
    [scrollView ltm_scrollToRightAnimated:YES];
    XCTAssert(CGPointEqualToPoint(scrollView.contentOffset, CGPointMake(600, 0)));
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
