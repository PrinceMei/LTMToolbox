//
//  LTMUITextFieldBlocksKitTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/25.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMUITextField+BlocksKit.h"
#import "LTMNSObject+A2DynamicDelegate.h"

@interface LTMUITextFieldBlocksKitTests : XCTestCase

@property (nonatomic, retain) UITextField *subject;

@end

@implementation LTMUITextFieldBlocksKitTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _subject = [[UITextField alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testBlockDelegateMethods
{
    __block BOOL shouldBegin;
    __block BOOL didBegin;
    __block BOOL shouldEnd;
    __block BOOL didEnd;
    __block BOOL shouldChange;
    __block BOOL shouldClear;
    __block BOOL shouldReturn;
    
    self.subject.ltm_shouldBeginEditingBlock = ^(UITextField *textField) { shouldBegin = YES; return YES; };
    self.subject.ltm_didBeginEditingBlock = ^(UITextField *textField) { didBegin = YES; };
    self.subject.ltm_shouldEndEditingBlock = ^(UITextField *textField) { shouldEnd = YES; return YES; };
    self.subject.ltm_didEndEditingBlock = ^(UITextField *textField) { didEnd = YES; };
    self.subject.ltm_shouldChangeCharactersInRangeWithReplacementStringBlock = ^(UITextField *textField, NSRange range, NSString *replacement) { shouldChange = YES; return YES; };
    self.subject.ltm_shouldClearBlock = ^(UITextField *textField) { shouldClear = YES; return YES; };
    self.subject.ltm_shouldReturnBlock = ^(UITextField *textField) { shouldReturn = YES; return YES; };
    
    [self.subject.ltm_dynamicDelegate textFieldShouldBeginEditing:self.subject];
    [self.subject.ltm_dynamicDelegate textFieldDidBeginEditing:self.subject];
    [self.subject.ltm_dynamicDelegate textFieldShouldEndEditing:self.subject];
    [self.subject.ltm_dynamicDelegate textFieldDidEndEditing:self.subject];
    [self.subject.ltm_dynamicDelegate textField:self.subject shouldChangeCharactersInRange:NSMakeRange(0, 1) replacementString:@""];
    [self.subject.ltm_dynamicDelegate textFieldShouldClear:self.subject];
    [self.subject.ltm_dynamicDelegate textFieldShouldReturn:self.subject];
    
    XCTAssertTrue(shouldBegin, @"ltm_shouldBeginEditingBlock didn't fire");
    XCTAssertTrue(didBegin, @"ltm_didBeginEditingBlock didn't fire");
    XCTAssertTrue(shouldEnd, @"ltm_shouldEndEditingBlock didn't fire");
    XCTAssertTrue(didEnd, @"ltm_didEndEditingBlock didn't fire");
    XCTAssertTrue(shouldChange, @"ltm_shouldChangeCharactersInRangeWithReplacementStringBlock didn't fire");
    XCTAssertTrue(shouldClear, @"ltm_shouldClearBlock didn't fire");
    XCTAssertTrue(shouldReturn, @"ltm_shouldReturnBlock didn't fire");
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
