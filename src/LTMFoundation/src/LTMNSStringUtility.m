//
//  LFNSStringUtils.m
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/1.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import "LTMNSStringUtility.h"
#import "LFCommonCrypto.h"

@implementation LTMNSStringUtility


#pragma mark --md5
+ (NSString *)MD5:(NSString *)inString{
    
   return [self MD5WithData:[inString dataUsingEncoding:NSUTF8StringEncoding]];
    
}

+ (NSString *)MD5WithData:(NSData *)inData{
    
    NSData *md5Data = [LFCommonDigest MD5:inData];
    
    NSString *md5String = [LFCCHexStringEncoding encodeData:md5Data];
    
    return md5String;
}

#pragma mark --Utilities

+ (NSString *)stringWithUUID{
    
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return (__bridge_transfer NSString *)string;
}

+ (NSString *)stringByTrim:(NSString *)string{
    
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [string stringByTrimmingCharactersInSet:set];
}

+ (BOOL)stringIsNotBlank:(NSString *)string{
    
    if (!string) {
        return NO;
    }else if ([@"" isEqualToString:string] || [@"(null)" isEqualToString:string]){
        return NO;
    }
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < string.length; i++) {
        unichar c = [string characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}

+ (NSString *)filenameWithString:(NSString *)string  appendingByNameScale:(CGFloat)scale{
    
    if (scale - 1 <= __FLT_EPSILON__ || string.length == 0 || [string hasSuffix:@"/"]) return string.copy;
    return [string stringByAppendingFormat:@"@%@x", @(scale)];

}

+ (NSString *)filenameWithString:(NSString *)string  appendingByPathScale:(CGFloat)scale{
    
    if (scale - 1 <= __FLT_EPSILON__ || string.length == 0 || [string hasSuffix:@"/"]) return string.copy;
    NSString *ext = string.pathExtension;
    NSRange extRange = NSMakeRange(string.length - ext.length, 0);
    if (ext.length > 0) extRange.location -= 1;
    NSString *scaleStr = [NSString stringWithFormat:@"@%@x", @(scale)];
    return [string stringByReplacingCharactersInRange:extRange withString:scaleStr];
}

+ (CGFloat)pathScaleWithString:(NSString *)string{
    
    if (string.length == 0 || [string hasSuffix:@"/"]) return 1;
    NSString *name = string.stringByDeletingPathExtension;
    __block CGFloat scale = 1;
    [self enumerateString:name regexMatches:@"@[0-9]+\\.?[0-9]*x$" usingBlock:^(NSString *match, NSInteger index, NSRange matchRange, BOOL *stop) {
        scale = [match substringWithRange:NSMakeRange(1, match.length - 2)].doubleValue;
    }];
    return scale;
}

+ (void)enumerateString:(NSString *)string regexMatches:(NSString *)regex usingBlock:(void (^)(NSString *match, NSInteger index, NSRange matchRange, BOOL *stop))block {
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex options:NSRegularExpressionAnchorsMatchLines error:nil];
    NSArray *matches = [pattern matchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    if (matches.count > 0) {
        [matches enumerateObjectsUsingBlock: ^(NSTextCheckingResult *result, NSUInteger idx, BOOL *stop) {
            block([string substringWithRange:result.range], idx, result.range, stop);
        }];
    }
}


@end
