//
//  LTMUIWebViewBlocksKitTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/25.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMUIWebView+BlocksKit.h"
#import "LTMNSObject+A2DynamicDelegate.h"

@interface LTMUIWebViewBlocksKitTests : XCTestCase<UIWebViewDelegate>

@end

@implementation LTMUIWebViewBlocksKitTests{
    UIWebView *_subject;
    BOOL shouldStartLoadDelegate, didStartLoadDelegate, didFinishLoadDelegate, didFinishWithErrorDelegate;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _subject = [[UIWebView alloc] initWithFrame:CGRectZero];
}

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    shouldStartLoadDelegate = YES;
    return YES;
}

- (void) webViewDidStartLoad:(UIWebView *)webView {
    didStartLoadDelegate = YES;
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
    didFinishLoadDelegate = YES;
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    didFinishWithErrorDelegate = YES;
}


- (void) testShouldStartLoad {
    _subject.delegate = self;
    
    __block BOOL shouldStartLoadBlock = NO;
    _subject.ltm_shouldStartLoadBlock = ^BOOL(UIWebView *view, NSURLRequest *req, UIWebViewNavigationType type) {
        shouldStartLoadBlock = YES;
        return YES;
    };
    
    BOOL shouldStartLoad = [_subject.ltm_dynamicDelegate webView:_subject shouldStartLoadWithRequest:nil navigationType:UIWebViewNavigationTypeLinkClicked];
    
    XCTAssertTrue(shouldStartLoad, @"Web view is allowed to load");
    XCTAssertTrue(shouldStartLoadBlock, @"Block hander was called");
    XCTAssertTrue(shouldStartLoadDelegate, @"Delegate was called");
}

- (void)testDidStartLoad {
    _subject.delegate = self;
    
    __block BOOL didStartLoadBlock = NO;
    _subject.ltm_didStartLoadBlock = ^(UIWebView *view) {
        didStartLoadBlock = YES;
    };
    
    [_subject.ltm_dynamicDelegate webViewDidStartLoad:_subject];
    
    XCTAssertTrue(didStartLoadBlock, @"Block handler was called");
    XCTAssertTrue(didStartLoadDelegate, @"Delegate was called");
}

- (void)testDidFinishLoad {
    _subject.delegate = self;
    
    __block BOOL didFinishLoadBlock = NO;
    _subject.ltm_didFinishLoadBlock = ^(UIWebView *view) {
        didFinishLoadBlock = YES;
    };
    
    [_subject.ltm_dynamicDelegate webViewDidFinishLoad:_subject];
    
    XCTAssertTrue(didFinishLoadBlock, @"Block handler was called");
    XCTAssertTrue(didFinishLoadDelegate, @"Delegate was called");
}

- (void)testDidFinishWithError {
    _subject.delegate = self;
    
    __block BOOL didFinishWithErrorBlock = NO;
    _subject.ltm_didFinishWithErrorBlock = ^(UIWebView *view, NSError *err) {
        didFinishWithErrorBlock = YES;
    };
    
    [_subject.ltm_dynamicDelegate webView:_subject didFailLoadWithError:nil];
    
    XCTAssertTrue(didFinishWithErrorBlock, @"Block handler was called");
    XCTAssertTrue(didFinishWithErrorDelegate, @"Delegate was called");
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
