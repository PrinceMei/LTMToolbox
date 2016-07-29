//
//  LTMGeometryUtilityTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/29.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMGeometryUtility.h"

@interface LTMGeometryUtilityTests : XCTestCase

@end

@implementation LTMGeometryUtilityTests

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
    
    // LTMCGMidMinX
    CGRect rect = CGRectMake(400, 50, 400, 150);
    CGPoint midMinXPoint = LTMCGMidMinX(rect);
    XCTAssert(CGPointEqualToPoint(midMinXPoint, CGPointMake(400, 125)));
    
    // LTMCGMidMaxX
    CGPoint midMaxXPoint = LTMCGMidMaxX(rect);
    XCTAssert(CGPointEqualToPoint(midMaxXPoint, CGPointMake(800, 125)));
    
    // LTMCGMidMaxY
    CGPoint midMaxYPoint = LTMCGMidMaxY(rect);
    XCTAssert(CGPointEqualToPoint(midMaxYPoint, CGPointMake(600, 200)));
    
    // LTMCGMidMinY
    CGPoint midMinYPoint = LTMCGMidMinY(rect);
    XCTAssert(CGPointEqualToPoint(midMinYPoint, CGPointMake(600, 50)));
    
    // LTMCGCenter
    CGPoint midCenterPoint = LTMCGCenter(rect);
    XCTAssert(CGPointEqualToPoint(midCenterPoint, CGPointMake(600, 125)));
    
    // LTMCGRectSize
    CGSize rectSize = LTMCGRectSize(rect);
    XCTAssert(CGSizeEqualToSize(rectSize, CGSizeMake(400, 150)));
    
    
    CGSize size = CGSizeMake(200, 100);
    // LTMCGRectOfSize
    CGRect rectOfSize = LTMCGRectOfSize(size);
    XCTAssert(CGRectEqualToRect(CGRectMake(0, 0, 200, 100), rectOfSize));
    
    // LTMCGRectScale
    CGRect rectScale = LTMCGRectScale(rect, 0.5, 2);
    XCTAssert(CGRectEqualToRect(rectScale, CGRectMake(400, 50, 200, 300)));
    
    // LTMCGAlignRectangles
    // LTMCGScaleRectangleToSize
    
    // LTMCGDistanceBetweenPoints
    CGFloat distanceTwoPoints = 10.f;
    CGFloat distance = LTMCGDistanceBetweenPoints(CGPointMake(0, 0), CGPointMake(6, 8));
    XCTAssert(distanceTwoPoints == distance);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
