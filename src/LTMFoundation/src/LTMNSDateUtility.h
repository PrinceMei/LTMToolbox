//
//  LFNSDateUtils.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/8.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTMNSDateUtility : NSObject

#pragma mark - 日期格式化
///=============================================================================
/// @name 日期格式化
///=============================================================================

/**
 将日期格式化成字符串
 支持格式:http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
 @param format 格式，例如 @"yyyy-MM-dd HH:mm:ss"
 */
+ (NSString *)stringWithDate:(NSDate *)date format:(NSString *)format;

/**
 将日期格式化成字符串
 支持格式:http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
 @param format 格式，例如 @"yyyy-MM-dd HH:mm:ss"
 */
+ (NSString *)stringWithDate:(NSDate *)date format:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;

/**
 以 ISO8601 格式化日期。例如： "2010-07-09T16:13:30+12:00"
 */
+ (NSString *)stringWithISOFormat:(NSDate *)date;

/**
 从字符串解析出日期 (解析失败则返回nil)
 @param dateString 日期字符串，例如 "2010-07-09 16:13:30"
 @param format     日期格式，例如 "yyyy-MM-dd HH:mm:ss"
 */
+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format;

/**
 从字符串解析出日期 (解析失败则返回nil)
 @param dateString 日期字符串，例如 "2010-07-09 16:13:30"
 @param format     日期格式，例如 "yyyy-MM-dd HH:mm:ss"
 */
+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;

/**
 将 ISO8601 格式的字符串解析成日期。
 @param dateString 时间字符串，例如 "2010-07-09T16:13:30+12:00"
 */
+ (NSDate *)dateWithISOFormatString:(NSString *)dateString;


@end
