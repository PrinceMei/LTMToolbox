//
//  LFContentSize.m
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/1.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import "LTMContentSizeUtility.h"
#import "LTMiOSDefines.h"

@implementation LTMContentSizeUtility

#pragma mark --绘制
// 计算内容的size
+ (CGSize) sizeForContent:(NSString *)content size:(CGSize)size font:(UIFont *)font mode:(NSLineBreakMode)lineBreakMode{
    
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12.0];
    if (kiOS7Later) {
        NSMutableDictionary *attr = @{}.mutableCopy;
        attr[NSFontAttributeName] = font;
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
            paragraphStyle.lineBreakMode = lineBreakMode;
            attr[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        CGRect rect = [content boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attr context:nil];
        result = rect.size;
    }
    else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [content sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    
    return CGSizeCeil(result);
        
}

//计算固定高度的行宽
+ (CGFloat) widthForContent:(NSString *)content height:(CGFloat)height font:(UIFont *)font{
    CGSize size = [self sizeForContent:content size:CGSizeMake(HUGE, height) font:font mode:NSLineBreakByWordWrapping];
    return  size.width;
}

//计算固定宽度的行高
+ (CGFloat) heightForContent:(NSString *)content width:(CGFloat)width  font:(UIFont *)font{
    CGSize size = [self sizeForContent:content size:CGSizeMake(width, HUGE) font:font mode:NSLineBreakByWordWrapping];
    return  size.height;
}



@end
