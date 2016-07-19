//
//  LFNSRegularExpressionUtils.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/4.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTMNSRegularExpressionUtility : NSObject

/*!
 	@method
 	@abstract
 	@discussion	字符串是否匹配正则
 	@param 	string 	匹配的字符串
 	@param 	regex 	正则表达式
 	@result
 */
+ (BOOL)matchsInString:(NSString *)string regex:(NSString *)regex;


/*!
 	@method
 	@abstract
 	@discussion	遍历所有正则匹配
 	@param 	string 	匹配的字符串
 	@param 	regex 	正则表达式
    @param match 匹配的 subString
    @param index 第几个匹配 (从0开始)
    @param matchRange 匹配的 subString 的范围
    @param stop 设置为NO则停止遍历
 	@result
 */
+ (void)enumerateMatchesInString:(NSString *)string
                           regex:(NSString *)regex
                      usingBlock:(void (^)(NSString *match, NSInteger index, NSRange matchRange, BOOL *stop))block;

/*!
    @method
    @abstract
    @discussion	遍历所有正则匹配
    @param 	string 	匹配的字符串
    @param     caseIns 不区分大小写
    @param 	regex 	正则表达式
    @param match 匹配的 subString
    @param index 第几个匹配 (从0开始)
    @param matchRange 匹配的 subString 的范围
    @param stop 设置为NO则停止遍历
    @result
 */
+ (void)enumerateMatchesInString:(NSString *)string
                 caseInsensitive:(BOOL)caseIns
                           regex:(NSString *)regex
                      usingBlock:(void (^)(NSString *match, NSInteger index, NSRange matchRange, BOOL *stop))block;

/*!
 	@method
 	@abstract
 	@discussion	替换所有正则匹配的字符串
 	@param 	string 	 匹配的字符串
 	@param 	regex 	表达式
 	@param 	replacement 	替换的字符串
 	@result
 */
+ (NSString *)matchsInString:(NSString *)string
                       regex:(NSString *)regex
              replacedString:(NSString *)replacement;



@end
