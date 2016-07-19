//
//  LFContentSize.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/1.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LTMContentSizeUtility : NSObject

///=============================================================================
/// @name 计算字符串的绘制大小
///=============================================================================
// 计算内容的size
+ (CGSize) sizeForContent:(NSString *)content size:(CGSize)size font:(UIFont *)font mode:(NSLineBreakMode)lineBreakMode;

//计算固定高度的行宽
+ (CGFloat) widthForContent:(NSString *)content height:(CGFloat)height font:(UIFont *)font;

//计算固定宽度的行高
+ (CGFloat) heightForContent:(NSString *)content width:(CGFloat)width  font:(UIFont *)font;



@end
