//
//  LTMUIViewSnapshotTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/25.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMUIView+Snapshot.h"

@interface LTMUIViewSnapshotTests : XCTestCase

@end

@implementation LTMUIViewSnapshotTests{
    UIView *_snapView;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _snapView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 80)];
    _snapView.backgroundColor = [UIColor orangeColor];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    UIImage *snapImage = [_snapView ltm_snapshot];
    XCTAssert(CGSizeEqualToSize(snapImage.size, CGSizeMake(100, 80)));
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
