//
//  LFObjectTransformer.h
//  LFToolboxKit
//
//  Created by lishuo on 16/7/13.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LFObjectTransformer : NSObject
//基本对象转换
+ (NSString *)data2string:(NSData *)data;
+ (NSData *)string2data:(NSString *)string;

+ (NSData *)array2data:(NSArray *)array;
+ (NSArray *)data2array:(NSData *)data;

+ (NSData *)dictionary2data:(NSDictionary *)dictionary;
+ (NSDictionary *)data2dictionary:(NSData *)data;

+ (NSData *)array2JSONdata:(NSArray *)array;
+ (NSArray *)JSONdata2array:(NSData *)data;

+ (NSData *)dictionary2JSONdata:(NSDictionary *)dictionary;
+ (NSDictionary *)JSONdata2dictionary:(NSData *)data;

+ (Byte *)data2byte:(NSData *)data;
+ (NSData *)byte2data:(Byte *)byte;


//其他转换
+ (NSString *)date2string:(NSDate *)date formatter:(NSString *)formatter;
+ (NSDate *)string2date:(NSString *)string formatter:(NSString *)formatter;

+ (NSString *)URLl2string:(NSURL *)url;
+ (NSURL *)string2URL:(NSString *)string;

+ (UIImage *)data2image:(NSData *)data;
+ (NSData *)image2data:(UIImage *)image;

//编码、加密
+ (NSData *)data2base64data:(NSData *)data;
+ (NSData *)base64data2data:(NSData *)base64data;

+ (NSString *)string2MD5string:(NSString *)string;

+ (NSString *)string2URLencodingString:(NSString *)string;
+ (NSString *)URLencodingString2string:(NSString *)base64string;
@end
