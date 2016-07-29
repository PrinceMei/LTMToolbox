//
//  DKCommonCrypto.h
//  DKSecurity
//
//  Created by wangxiaoxiang on 16/5/27.
//  Copyright © 2016年 wangxiaoxiang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LFCommonCryptor : NSObject


#pragma mark - AES256 crypt
+ (NSData *)AES256Encrypt:(NSData *)inputData key: (NSData *) key error: (NSError * *) error;
+ (NSData *)AES256Decrypt:(NSData *)inputData key: (NSData *) key error: (NSError **) error;

+ (NSData *)AES256Encrypt:(NSData *)inputData key: (NSData *) key initializationVector:(NSData *)initializationVector error: (NSError **) error;
+ (NSData *)AES256Decrypt:(NSData *)inputData key: (NSData *) key initializationVector:(NSData *)initializationVector error: (NSError **) error;

#pragma mark - DES crypt

+ (NSData *)DESEncrypt:(NSData *)inputData key: (NSData *) key error: (NSError **) error;
+ (NSData *)DESDecrypt:(NSData *)inputData key: (NSData *) key error: (NSError **) error;

#pragma mark - CAST crypt

+ (NSData *)CASTEncrypt:(NSData *)inputData key: (NSData *) key error: (NSError **) error;
+ (NSData *)CASTDecrypt:(NSData *)inputData key: (NSData *) key error: (NSError **) error;

@end
