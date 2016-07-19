//
//  NSString+Digits.h
//  LFToolboxKit
//
//  Created by wangxiaoxiang on 16/7/15.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LTMNSStringDigitsAdditions)

- (NSString *)ltm_MD2Digits;

- (NSString *)ltm_MD4Digits;

- (NSString *)ltm_MD5Digits;

- (NSString *)ltm_SHA1Digits;

- (NSString *)ltm_SHA224Digits;

- (NSString *)ltm_SHA256Digits;

- (NSString *)ltm_SHA384Digits;

- (NSString *)ltm_SHA512Digits;

@end
