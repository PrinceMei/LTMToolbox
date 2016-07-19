//
//  DKHex.m
//  DKSecurity
//
//  Created by wangxiaoxiang on 16/4/19.
//  Copyright © 2016年 wangxiaoxiang. All rights reserved.
//

#import "LFCCHexStringEncoding.h"

@implementation LFCCHexStringEncoding
+ (NSString *)encodeBytes:(const void *)bytes length:(NSUInteger)length
{
    NSMutableString *result;
    
    result = [[NSMutableString alloc] initWithCapacity:length * 2];
    for (size_t i = 0; i < length; i++) {
        [result appendFormat:@"%02x", ((const uint8_t *) bytes)[i]];
    }
    return result;
}

+ (NSString *)encodeData:(NSData *)data
{
    return [[self class] encodeBytes:data.bytes length:data.length];
}

+ (NSData *)decode:(NSString *)hexString
{
    NSMutableData *     result;
    NSUInteger          cursor;
    NSUInteger          limit;
    
    result = nil;
    cursor = 0;
    limit = [hexString length];
    if ((limit % 2) == 0) {
        result = [[NSMutableData alloc] init];
        
        while (cursor != limit) {
            unsigned int    thisUInt;
            uint8_t         thisByte;
            
            if ( sscanf([[hexString substringWithRange:NSMakeRange(cursor, 2)] UTF8String], "%x", &thisUInt) != 1 ) {
                result = nil;
                break;
            }
            thisByte = (uint8_t) thisUInt;
            [result appendBytes:&thisByte length:sizeof(thisByte)];
            cursor += 2;
        }
    }
    
    return result;
}
@end
