//
//  LTMViewRecyclerTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/29.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMViewRecycler.h"


@interface LTMTestView<LTMRecyclableView> : UIView
@property (nonatomic, copy) NSString* reuseIdentifier;
@end

@implementation LTMTestView

@synthesize reuseIdentifier = _reuseIdentifier;

-(void)setReuseIdentifier:(NSString *)reuseIdentifier{
    _reuseIdentifier = reuseIdentifier;
}

-(NSString *)reuseIdentifier {
    return _reuseIdentifier;
}

@end

@interface LTMViewRecyclerTests : XCTestCase

@end

@implementation LTMViewRecyclerTests{
    LTMViewRecycler *recycler;
}

static NSString *ID = @"reuseView";

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    
    
    recycler = [[LTMViewRecycler alloc]init];
    LTMTestView *resueView = [recycler dequeueReusableViewWithIdentifier:ID];
    XCTAssertNil(resueView);
    
    if (resueView == nil) {
        resueView = [[LTMTestView alloc] init];
        resueView.reuseIdentifier = ID;
        [recycler recycleView:resueView];
    }
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    LTMTestView *resueView = [recycler dequeueReusableViewWithIdentifier:ID];
    XCTAssertNotNil(resueView);
    
    [recycler removeAllViews];
    LTMTestView *resueView1 = [recycler dequeueReusableViewWithIdentifier:ID];
    XCTAssertNil(resueView1);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
