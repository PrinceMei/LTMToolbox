//
//  LFNSRegularExpressionUtils.m
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/4.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import "LTMNSRegularExpressionUtility.h"

@implementation LTMNSRegularExpressionUtility

//字符串是否匹配正则
+ (BOOL)matchsInString:(NSString *)string regex:(NSString *)regex{
    
    NSError *error = nil;
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex options:NSRegularExpressionAnchorsMatchLines error:&error];
    if (error) {
        return NO;
    }
    return ([pattern numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)] > 0);
}

+ (void)enumerateMatchesInString:(NSString *)string regex:(NSString *)regex usingBlock:(void (^)(NSString *match, NSInteger index, NSRange matchRange, BOOL *stop))block{
    NSError *error = nil;
    //NSRegularExpressionAnchorsMatchLines 允许^和$在匹配的开始和结束行
    NSRegularExpression *pattern =  [NSRegularExpression regularExpressionWithPattern:regex options:NSRegularExpressionAnchorsMatchLines error:&error];
    if (error) {
        return;
    }
    
    NSArray *matches = [pattern matchesInString:string options:0 range:NSMakeRange(0, string.length)];
    if (matches.count > 0) {
        [matches enumerateObjectsUsingBlock:^(NSTextCheckingResult *result, NSUInteger idx, BOOL * _Nonnull stop) {
            block([string substringWithRange:result.range], idx, result.range, stop);
        }];
    }
}

+ (void)enumerateMatchesInString:(NSString *)string caseInsensitive:(BOOL)caseIns regex:(NSString *)regex usingBlock:(void (^)(NSString *match, NSInteger index, NSRange matchRange, BOOL *stop))block{
    NSError *error = nil;
    //NSRegularExpressionAnchorsMatchLines 允许^和$在匹配的开始和结束行
    //NSRegularExpressionCaseInsensitive    不区分大小写的
    NSRegularExpressionOptions op = NSRegularExpressionAnchorsMatchLines;
    if (caseIns) {
        op |= NSRegularExpressionCaseInsensitive;
    }
    
    NSRegularExpression *pattern =  [NSRegularExpression regularExpressionWithPattern:regex options:op error:&error];
    if (error) {
        return;
    }
    
    NSArray *matches = [pattern matchesInString:string options:0 range:NSMakeRange(0, string.length)];
    if (matches.count > 0) {
        [matches enumerateObjectsUsingBlock:^(NSTextCheckingResult *result, NSUInteger idx, BOOL * _Nonnull stop) {
            block([string substringWithRange:result.range], idx, result.range, stop);
        }];
    }
}

+ (NSString *)matchsInString:(NSString *)string regex:(NSString *)regex replacedString:(NSString *)replacement{
    
    NSError *error = nil;
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex options:NSRegularExpressionAnchorsMatchLines error:&error];
    if (error) {
        return  nil;
    }
    return [pattern stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, string.length) withTemplate:replacement];
}

@end
