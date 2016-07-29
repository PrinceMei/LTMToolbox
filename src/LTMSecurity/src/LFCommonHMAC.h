//
//  DKCommonHMAC.h
//  DKSecurity
//
//  Created by wangxiaoxiang on 16/5/27.
//  Copyright © 2016年 wangxiaoxiang. All rights reserved.
//

#import <Foundation/Foundation.h>



enum {
    kLFHmacAlgSHA1,
    kLFHmacAlgMD5,
    kLFHmacAlgSHA256,
    kLFHmacAlgSHA384,
    kLFHmacAlgSHA512,
    kLFHmacAlgSHA224
};
typedef uint32_t LFHmacAlgorithm;

@interface LFCommonHMAC : NSObject
+ (NSData/*output data*/ *)hamc:(NSData *)inputData key:(NSData *)key algorithm:(LFHmacAlgorithm)algorithm;

+ (NSData/*output data*/ *)hamc:(NSData *)inputData key:(NSData *)key algorithm:(LFHmacAlgorithm)algorithm error:(NSError *__autoreleasing *)error;
@end
