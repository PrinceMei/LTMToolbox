//
//  DKHex.h
//  DKSecurity
//
//  Created by wangxiaoxiang on 16/4/19.
//  Copyright © 2016年 wangxiaoxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFCCHexStringEncoding : NSObject

#pragma mark - encode
+ (NSString *)encodeBytes:(const void *)bytes length:(NSUInteger)length;

+ (NSString *)encodeData:(NSData *)data;

#pragma mark - decode
+ (NSData *)decode:(NSString *)hexString;
@end
