//
//  LTMWeakProxyTestCase.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/19.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMWeakProxy.h"

@interface LTMWeakProxyTestCase : XCTestCase{
    NSTimer *timer1;
    NSTimer *timer2;
}
@end

@implementation LTMWeakProxyTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    timer1 = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(doTimer1) userInfo:nil repeats:YES];
    
    timer2 = [NSTimer timerWithTimeInterval:1.0 target:[LTMWeakProxy proxyWithTarget:self] selector:@selector(doTimer2) userInfo:nil repeats:YES];
}

- (void) doTimer1 {

}

- (void) doTimer2 {
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    // 分析引用计数的个数
    NSInteger count1 = CFGetRetainCount((__bridge CFTypeRef)(timer1));
    NSInteger count2 = CFGetRetainCount((__bridge CFTypeRef)(timer2));
    
    XCTAssertTrue(count1 == 2);
    XCTAssertTrue(count2 == 1);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
