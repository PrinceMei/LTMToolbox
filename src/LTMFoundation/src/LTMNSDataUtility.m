//
//  LFNSDataUtils.m
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/8.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import "LTMNSDataUtility.h"


@implementation LTMNSDataUtility

+ (NSData *)dataNamed:(NSString *)name{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@""];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return data;
}

/// 用 UTF8 解码
+ (NSString *)utf8StringWithData:(NSData *)data{
    
    if (data.length > 0) {
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return @"";
}

/// 转换为大写 hex 字符串
+ (NSString *)hexStringWithData:(NSData *)data{
    
    NSUInteger length = data.length;
    NSMutableString *result = [NSMutableString stringWithCapacity:length * 2];
    const unsigned char *byte = data.bytes;
    for (int i = 0; i < length; i++, byte++) {
        [result appendFormat:@"%02X", *byte];
    }
    return result;
}

/// 用 hex 字符串(不区分大小写)创建NSData。 失败则返回nil。
+ (NSData *)dataWithHexString:(NSString *)hexStr{
    
    hexStr = [hexStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    hexStr = [hexStr lowercaseString];
    NSUInteger len = hexStr.length;
    if (!len) return nil;
    unichar *buf = malloc(sizeof(unichar) * len);
    if (!buf) return nil;
    [hexStr getCharacters:buf range:NSMakeRange(0, len)];
    
    NSMutableData *result = [NSMutableData data];
    unsigned char bytes;
    char str[3] = { '\0', '\0', '\0' };
    int i;
    for (i = 0; i < len / 2; i++) {
        str[0] = buf[i * 2];
        str[1] = buf[i * 2 + 1];
        bytes = strtol(str, NULL, 16);
        [result appendBytes:&bytes length:1];
    }
    free(buf);
    return result;

}

@end
