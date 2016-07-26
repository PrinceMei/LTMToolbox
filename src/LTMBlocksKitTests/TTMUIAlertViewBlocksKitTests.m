//
//  TTMUIAlertViewBlocksKitTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/25.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMUIAlertView+BlocksKit.h"
#import "LTMNSObject+A2DynamicDelegate.h"

@interface TTMUIAlertViewBlocksKitTests : XCTestCase

@end
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
@implementation TTMUIAlertViewBlocksKitTests{
    UIAlertView *_subject;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _subject = [[UIAlertView alloc] ltm_initWithTitle:@"Hello BlocksKit" message:@"This is a message."];
}


- (void)testInit {
    XCTAssertTrue([_subject isKindOfClass:[UIAlertView class]],@"subject is UIAlertView");
    XCTAssertTrue([_subject.delegate isEqual:_subject.ltm_dynamicDelegate], @"the delegate is not dynamic");
    XCTAssertEqualObjects(_subject.title,@"Hello BlocksKit",@"the UIAlertView title is %@",_subject.title);
    XCTAssertEqual(_subject.numberOfButtons, (NSInteger)0,@"the action sheet has %ld buttons", (long)_subject.numberOfButtons);
    XCTAssertFalse(_subject.isVisible,@"the action sheet is not visible");
}

- (void)testAddButtonWithHandler {
    __block NSInteger total = 0;
    
    NSInteger index1 = [_subject ltm_addButtonWithTitle:@"Button 1" handler:^{ total++; }];
    NSInteger index2 = [_subject ltm_addButtonWithTitle:@"Button 2" handler:^{ total += 2; }];
    
    XCTAssertEqual(_subject.numberOfButtons,(NSInteger)2,@"the alert view has %ld buttons", (long)_subject.numberOfButtons);
    
    NSString *title = @"Button";
    title = [_subject buttonTitleAtIndex:index1];
    XCTAssertEqualObjects(title,@"Button 1",@"the UIActionSheet adds a button with title %@",title);
    
    title = [_subject buttonTitleAtIndex:index2];
    XCTAssertEqualObjects(title,@"Button 2",@"the UIActionSheet adds a button with title %@",title);
    
    [_subject.ltm_dynamicDelegate alertView:_subject clickedButtonAtIndex:index1];
    [_subject.ltm_dynamicDelegate alertView:_subject clickedButtonAtIndex:index2];
    
    XCTAssertEqual(total, (NSInteger)3, @"Not all block handlers were called.");
}

- (void)testSetCancelButtonWithHandler {
    __block BOOL blockCalled = NO;
    
    NSInteger index = [_subject ltm_setCancelButtonWithTitle:@"Cancel" handler:^{ blockCalled = YES; }];
    XCTAssertEqual(_subject.numberOfButtons,(NSInteger)1,@"the alert view has %ld buttons", (long)_subject.numberOfButtons);
    XCTAssertEqual(_subject.cancelButtonIndex,(NSInteger)index,@"the alert view cancel button index is %ld", (long)_subject.cancelButtonIndex);
    
    NSString *title = [_subject buttonTitleAtIndex:index];
    XCTAssertEqualObjects(title,@"Cancel",@"the UIActionSheet adds a button with title %@",title);
    
    [_subject.ltm_dynamicDelegate alertViewCancel:_subject];
    
    XCTAssertTrue(blockCalled, @"Block handler was not called.");
}

- (void)testDelegationBlocks {
    __block BOOL willShow = NO;
    __block BOOL didShow = NO;
    
    _subject.ltm_willShowBlock = ^(UIAlertView *view) { willShow = YES; };
    _subject.ltm_didShowBlock = ^(UIAlertView *view) { didShow = YES; };
    
    [_subject.ltm_dynamicDelegate willPresentAlertView:_subject];
    [_subject.ltm_dynamicDelegate didPresentAlertView:_subject];
    
    XCTAssertTrue(willShow, @"willShowBlock not fired.");
    XCTAssertTrue(didShow, @"didShowblock not fired.");
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
#pragma clang diagnostic pop

@end
