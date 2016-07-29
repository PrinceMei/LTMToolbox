//
//  UIColor+LFAdd.h
//
//
//  Created by guoyaoyuan on 13-4-4.
//  Copyright (c) 2013 live Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN UIColor * LTMUIColorHRGB(uint32_t rgbValue);

UIKIT_EXTERN UIColor * LTMUIColorHRGBA(uint32_t rgbaValue);

UIKIT_EXTERN UIColor * LTMUIColorRGB(uint8_t r, uint8_t g, uint8_t b);

UIKIT_EXTERN UIColor * LTMUIColorRGBA(uint8_t r, uint8_t g, uint8_t b, CGFloat a);

@interface UIColor (LTMUIColorRGBAdditions)

+ (UIColor *)ltm_colorWithHRGB:(uint32_t)hrgbValue;
+ (UIColor *)ltm_colorWithHRGBA:(uint32_t)hrgbaValue;

+ (UIColor *)ltm_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;
+ (UIColor *)ltm_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue alpha:(CGFloat)alpha;
@end
