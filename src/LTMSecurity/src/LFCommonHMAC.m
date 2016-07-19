//
//  DKCommonHMAC.m
//  DKSecurity
//
//  Created by wangxiaoxiang on 16/5/27.
//  Copyright © 2016年 wangxiaoxiang. All rights reserved.
//

#import "LFCommonHMAC.h"
FOUNDATION_STATIC_INLINE CC_LONG LFCommonHMACLength(CCHmacAlgorithm algorithm) {
    
    CC_LONG length = -1;
    switch (algorithm) {
        case kCCHmacAlgSHA1:
            length = CC_SHA1_DIGEST_LENGTH;
            break;
        case kCCHmacAlgSHA224:
            length = CC_SHA224_DIGEST_LENGTH;
            break;
        case kCCHmacAlgSHA256:
            length = CC_SHA256_DIGEST_LENGTH;
            break;
        case kCCHmacAlgSHA384:
            length = CC_SHA384_DIGEST_LENGTH;
            break;
        case kCCHmacAlgSHA512:
            length = CC_SHA512_DIGEST_LENGTH;
            break;
        case kCCHmacAlgMD5:
            length = CC_MD5_DIGEST_LENGTH;
            break;
        default:
            break;
    }
    return length;
}

@implementation LFCommonHMAC
+ (NSData *)hamc:(NSData *)inputData key:(NSData *)key algorithm:(CCHmacAlgorithm)algorithm {
    return [self hamc:inputData key:key algorithm:algorithm error:nil];
}

+ (NSData *)hamc:(NSData *)inputData key:(NSData *)key algorithm:(CCHmacAlgorithm)algorithm error:(NSError *__autoreleasing *)error {
    //确认长度
    CC_LONG length = LFCommonHMACLength(algorithm);
    if (length == -1) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:@"com.youku.DKSecurity" code:-1 userInfo:@{NSLocalizedDescriptionKey:@"algorithm err"}];
            return nil;
        }
    }
    
    unsigned char *digest;
    digest = malloc(length);
    
    CCHmac(algorithm, key.bytes, key.length, inputData.bytes, inputData.length, digest);
    
    NSData *digestData = [NSData dataWithBytes:digest length:length];
    free(digest);
    return digestData;
}
@end
