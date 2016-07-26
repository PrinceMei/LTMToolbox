//
//  LTMIUIControlBlocksKitTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/25.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMUIControl+BlocksKit.h"


@interface LTMIUIControlBlocksKitTests : XCTestCase

@end

@implementation LTMIUIControlBlocksKitTests{
    UIControl *_subject;
    NSInteger _total;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _subject = [UIControl new];
    _total = 0;
    
    __unsafe_unretained LTMIUIControlBlocksKitTests *weakSelf = self;
    [_subject ltm_addEventHandler:^(id sender) {
        weakSelf->_total++;
    } forControlEvents:UIControlEventTouchUpInside];
}

- (void)testHasEventHandler {
    BOOL hasHandler = [_subject ltm_hasEventHandlersForControlEvents:UIControlEventTouchUpInside];
    XCTAssertTrue(hasHandler, @"Control doesn't have the handler.");
}

- (void)testRemoveEventHandler {
    [_subject ltm_removeEventHandlersForControlEvents:UIControlEventTouchUpInside];
    
    BOOL hasHandler = [_subject ltm_hasEventHandlersForControlEvents:UIControlEventTouchUpInside];
    XCTAssertFalse(hasHandler, @"Control still has the handler.");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
