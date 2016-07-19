//
//  UTKTypeUtility.h
//  UTK
//
//  Created by wangxiaoxiang on 16/5/17.
//  Copyright © 2016年 wangxiaoxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTMTypeUtility : NSObject

//MARK:object
+ (NSString *)stringValue:(id)object;
+ (NSArray *)arrayValue:(id)object;
+ (NSDictionary *)dictionaryValue:(id)object;
+ (NSURL *)URLValue:(id)object;

+ (NSNumber *)numberValue:(id)object;
+ (NSNumber *)numberWithString:(NSString *)string formatter:(NSNumberFormatter *)formatter;

+ (id)objectValue:(id)object;
+ (id)objectValue:(id)object ofClass:(Class)expectedClass;
+ (id)objectValue:(id)object ofClass:(Class)expectedClass defaultValue:(id)defaultValue;

//MARK:char
+ (char)charValue:(id)object;
+ (unsigned char)unsignedCharValue:(id)object;

//MARK:short
+ (short)shortValue:(id)object;
+ (unsigned short)unsignedShortValue:(id)object;

//MARK:int
+ (int)intValue:(id)object;
+ (unsigned int)unsignedIntValue:(id)object;

//MARK:long
+ (long)longValue:(id)object;
+ (unsigned long)unsignedLongValue:(id)object;


//MARK:long long
+ (long long)longLongValue:(id)object;
+ (unsigned long long)unsignedLongLongValue:(id)object;


//MARK:double
+ (float)floatValue:(id)object;
+ (double)doubleValue:(id)object;
+ (NSTimeInterval)timeIntervalValue:(id)object;

//MARK:integer
+ (NSInteger)integerValue:(id)object;
+ (NSUInteger)unsignedIntegerValue:(id)object;

@end
