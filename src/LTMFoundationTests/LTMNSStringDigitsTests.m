//
//  LTMNSStringDigitsTests.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/19.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMNSString+Digits.h"

@interface LTMNSStringDigitsTests : XCTestCase

@end

@implementation LTMNSStringDigitsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


#define XCTStringTrue(str1, str2) XCTAssertTrue([str1 isEqualToString:str2])
- (void)testMDx {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSString *str = @"laifeng";
    
    NSString *md2Str = @"19e1eab89f41cedd32fae51e5162e5e6";
    NSString *md4Str = @"dfd7b8e1728f8b616440e7069b971fde";
    NSString *md5Str = @"de29595e0cb8b4a477b4378e896d6721";
    
    XCTStringTrue(md2Str, [str ltm_MD2Digits]);
    XCTStringTrue(md4Str, [str ltm_MD4Digits]);
    XCTStringTrue(md5Str, [str ltm_MD5Digits]);
}


- (void)testSha {
    NSString *str = @"laifeng";
    
    
    NSString *sha1 = @"1dbca065018a08799c3de850c7cba8356711a9c9";
    NSString *sha224 = @"164fb91588484279efba58703bffca66e7c68beee87b40a72fd88880";
    NSString *sha256 = @"9a74c723f76c2e42b26cefae73d09666acc9f27d3dc55756de455b2edaaa91f9";
    NSString *sha384 = @"d747e6909062621075bec771171c92d55617a60505de580247c9283fc4c54828bb439c589736375533b96f056b1da586";
    NSString *sha512 = @"9a539e993de68f2d3bd97111c675fc2ad52b47adc55d853d89873496ed41478caacdeecdac4fcde9518dedf019242103cfa9ed1c37932aa92a20f81abf1a25d0";
    
    XCTStringTrue(sha1, [str ltm_SHA1Digits]);
    XCTStringTrue(sha224, [str ltm_SHA224Digits]);
    XCTStringTrue(sha256, [str ltm_SHA256Digits]);
    XCTStringTrue(sha384, [str ltm_SHA384Digits]);
    XCTStringTrue(sha512, [str ltm_SHA512Digits]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
