//
//  LTMUIActionSheetBlocksKitTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/25.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMUIActionSheet+BlocksKit.h"
#import "LTMNSObject+A2DynamicDelegate.h"

@interface LTMUIActionSheetBlocksKitTests : XCTestCase

@end
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
@implementation LTMUIActionSheetBlocksKitTests{
    UIActionSheet *_subject;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _subject = [[UIActionSheet alloc] ltm_initWithTitle:@"Hello BlocksKit"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testInit {
    XCTAssertTrue([_subject isKindOfClass:[UIActionSheet class]],@"subject is UIActionSheet");
    XCTAssertTrue([_subject.delegate isEqual:_subject.ltm_dynamicDelegate], @"the delegate is not the dynamic delegate");
    XCTAssertEqualObjects(_subject.title,@"Hello BlocksKit",@"the UIActionSheet title is %@",_subject.title);
    XCTAssertEqual(_subject.numberOfButtons, (NSInteger)0, @"the action sheet has %ld buttons", (long)_subject.numberOfButtons);
    XCTAssertFalse(_subject.isVisible,@"the action sheet is not visible");
}

- (void)testAddButtonWithHandler {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Button 2 callback"];
    
    NSInteger index1 = [_subject ltm_addButtonWithTitle:@"Button 1" handler:^{
        XCTFail();
    }];
    NSInteger index2 = [_subject ltm_addButtonWithTitle:@"Button 2" handler:^{
        [expectation fulfill];
    }];
    
    XCTAssertEqual(_subject.numberOfButtons, (NSInteger)2, @"the action sheet has %ld buttons", (long)_subject.numberOfButtons);
    
    NSString *title = @"Button";
    title = [_subject buttonTitleAtIndex:index1];
    XCTAssertEqualObjects(title,@"Button 1",@"the UIActionSheet adds a button with title %@",title);
    
    title = [_subject buttonTitleAtIndex:index2];
    XCTAssertEqualObjects(title,@"Button 2",@"the UIActionSheet adds a button with title %@",title);
    
    [_subject.ltm_dynamicDelegate actionSheet:_subject clickedButtonAtIndex:index2];
    
    [self waitForExpectationsWithTimeout:1 handler:NULL];
}

- (void)testSetDestructiveButtonWithHandler {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Destructive button callback"];
    
    NSInteger index = [_subject ltm_setDestructiveButtonWithTitle:@"Delete" handler:^{
        [expectation fulfill];
    }];
    XCTAssertEqual(_subject.numberOfButtons, (NSInteger)1, @"the action sheet has %ld buttons", (long)_subject.numberOfButtons);
    XCTAssertEqual(_subject.destructiveButtonIndex, index, @"the action sheet destructive button index is %ld", (long)_subject.destructiveButtonIndex);
    
    NSString *title = [_subject buttonTitleAtIndex:index];
    XCTAssertEqualObjects(title,@"Delete",@"the UIActionSheet adds a button with title %@",title);
    
    [_subject.ltm_dynamicDelegate actionSheet:_subject clickedButtonAtIndex:index];
    
    [self waitForExpectationsWithTimeout:1 handler:NULL];
}

- (void)testSetCancelButtonWithHandler {
    __block BOOL blockCalled = NO;
    
    NSInteger index = [_subject ltm_setCancelButtonWithTitle:@"Cancel" handler:^{ blockCalled = YES; }];
    XCTAssertEqual(_subject.numberOfButtons,(NSInteger)1,@"the action sheet has %ld buttons", (long)_subject.numberOfButtons);
    XCTAssertEqual(_subject.cancelButtonIndex,(NSInteger)index,@"the action sheet cancel button index is %ld", (long)_subject.destructiveButtonIndex);
    
    NSString *title = [_subject buttonTitleAtIndex:index];
    XCTAssertEqualObjects(title,@"Cancel",@"the UIActionSheet adds a button with title %@",title);
    
    [_subject.ltm_dynamicDelegate actionSheetCancel:_subject];
    
    XCTAssertTrue(blockCalled, @"Block handler was not called.");
}

- (void)testDelegationBlocks {
    __block BOOL willShow = NO;
    __block BOOL didShow = NO;
    
    _subject.ltm_willShowBlock = ^(UIActionSheet *sheet) { willShow = YES; };
    _subject.ltm_didShowBlock = ^(UIActionSheet *sheet) { didShow = YES; };
    
    [_subject.ltm_dynamicDelegate willPresentActionSheet:_subject];
    [_subject.ltm_dynamicDelegate didPresentActionSheet:_subject];
    
    XCTAssertTrue(willShow, @"willShowBlock not fired.");
    XCTAssertTrue(didShow, @"didShowblock not fired.");
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

#pragma clang diagnostic pop

@end
