//
//  NSString+hash.m
//  LFToolboxKit
//
//  Created by wangxiaoxiang on 16/7/15.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import "LTMNSString+Digits.h"
#import "LFCommonCrypto.h"
#import "LTMStringEncoding.h"


static LTMStringEncoding *g_hexStringCoder = nil;

@implementation NSString (LTMNSStringDigitsAdditions)

+ (void)initialize
{
    if (self == [NSString class]) {
        g_hexStringCoder = [LTMStringEncoding hexStringEncoding];
    }
}

- (NSString *)ltm_MD2Digits {
    NSData *md2Data = [LFCommonDigest MD2:[self dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *md2String = [g_hexStringCoder encode:md2Data];
    return md2String;
}

- (NSString *)ltm_MD4Digits {
    NSData *md4Data = [LFCommonDigest MD4:[self dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *md4String = [g_hexStringCoder encode:md4Data];
    return md4String;
}

- (NSString *)ltm_MD5Digits {
    NSData *md5Data = [LFCommonDigest MD5:[self dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *md5String = [g_hexStringCoder encode:md5Data];
    return md5String;
}

- (NSString *)ltm_SHA1Digits {
    NSData *sha1Data = [LFCommonDigest SHA1:[self dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *sha1String = [g_hexStringCoder encode:sha1Data];
    return sha1Data;
}

- (NSString *)ltm_SHA224Digits {
    NSData *sha224Data = [LFCommonDigest SHA224:[self dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *sha224String = [g_hexStringCoder encode:sha224Data];
    return sha224String;
}

- (NSString *)ltm_SHA256Digits {
    NSData *sha256Data = [LFCommonDigest SHA256:[self dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *sha256String = [g_hexStringCoder encode:sha256Data];
    return sha256String;
}

- (NSString *)ltm_SHA384Digits {
    NSData *sha384Data = [LFCommonDigest SHA384:[self dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *sha384String = [g_hexStringCoder encode:sha384Data];
    return sha384String;
}

- (NSString *)ltm_SHA512Digits {
    NSData *sha512Data = [LFCommonDigest SHA512:[self dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *sha512String = [g_hexStringCoder encode:sha512Data];
    return sha512String;
}



@end
