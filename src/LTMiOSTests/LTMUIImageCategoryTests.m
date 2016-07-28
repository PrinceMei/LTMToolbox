//
//  LTMUIImageCategoryTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/25.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMUIView+Snapshot.h"
#import "LTMUIImage+RoundedCorner.h"
#import "LTMUIImage+Rotate.h"
#import "LTMUIImage+Resize.h"
#import "LTMUIImage+Alpha.h"

@interface LTMUIImageCategoryTests : XCTestCase
- (UIImage *)testImageNamed:(NSString *)imageName;
@end

@implementation LTMUIImageCategoryTests{
    UIView *_snapView;
}

- (UIImage *)testImageNamed:(NSString *)imageName {
    NSBundle *myBundle = [NSBundle bundleForClass:[self class]];
    NSString *imagePath = [myBundle pathForResource:imageName ofType:@"png"];
    UIImage *result = [UIImage imageWithContentsOfFile:imagePath];
    return result;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _snapView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _snapView.backgroundColor = [UIColor orangeColor];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    
    UIImage *origImg = [self testImageNamed:@"leftArrow"];
    
    // UIView Snapshot
    UIImage *snapImage = [_snapView ltm_snapshot];
    XCTAssert(CGSizeEqualToSize(snapImage.size, CGSizeMake(100, 100)));


    // UIImage  RoundedCorner
#warning - 1、如果是屏幕快照的话，图片的DPI改变了，导致roundCorderImg的尺寸有可能不一样（和屏幕的scale倍数成正比）
#warning - 2、对于工程中的图片，得到的是 nil
    UIImage *roundCorderImg = [origImg ltm_roundedCornerImage:5 borderSize:0];
    XCTAssertNotNil(roundCorderImg);
    
    
    // UIImage Rotate   顺时针旋转90度
    UIImage *rightImg = [origImg ltm_rotatedImageWithOrientation:UIImageOrientationRight];
    XCTAssertNotNil(rightImg);
    
    // UIImage Resize
    UIImage *cropImg = [origImg ltm_croppedImage:CGRectMake(20, 20, 40, 40)];
    XCTAssertNotNil(cropImg);
    
    UIImage *thumbIMg = [origImg ltm_thumbnailImage:5 transparentBorder:2 cornerRadius:5 interpolationQuality:0];
    XCTAssertNotNil(thumbIMg);
    
    UIImage *resizedImg = [origImg ltm_resizedImage:CGSizeMake(70, 70) interpolationQuality:3];
    XCTAssertNotNil(resizedImg);
    
    UIImage *resizedImgWithMode = [origImg ltm_resizedImageWithContentMode:UIViewContentModeScaleAspectFill bounds:CGSizeMake(45, 45) interpolationQuality:0];
    XCTAssertNotNil(resizedImgWithMode);
    XCTAssertNotNil(resizedImgWithMode);
    
    
    // UIImage Alpha
    BOOL isHasAlpha = [origImg ltm_hasAlpha];
    XCTAssertTrue(isHasAlpha);
    XCTAssertFalse([snapImage ltm_hasAlpha]);
    
    UIImage *snapImgAlhpa = [snapImage ltm_imageWithAlpha];
    XCTAssertNotNil(snapImgAlhpa);
    XCTAssertTrue([snapImgAlhpa ltm_hasAlpha]);
    
    
    UIImage *transImg = [snapImgAlhpa ltm_transparentBorderImage:5];
    XCTAssertNotNil(transImg);
    XCTAssertNotNil([origImg ltm_transparentBorderImage:5]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
