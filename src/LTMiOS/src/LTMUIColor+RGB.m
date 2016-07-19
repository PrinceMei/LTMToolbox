//
//  UIColor+LFAdd.m
//
//
//  Created by guoyaoyuan on 13-4-4.
//  Copyright (c) 2013 live Interactive. All rights reserved.
//

#import "LTMUIColor+RGB.h"

static const CGFloat kFBRGBMax = 255.0f;
static const uint32_t kColorMaskRed     = 0xFF000000;
static const uint32_t kColorMaskGreen   = 0xFF0000;
static const uint32_t kColorMaskBlue    = 0xFF00;
static const uint32_t kColorMaskAlpha   = 0xFF;

UIColor *LTMUIColorHRGB(uint32_t rgbValue)
{
    uint32_t newValue = (rgbValue << 8) | kColorMaskAlpha;
    return LTMUIColorHRGBA(newValue);
}

UIColor *LTMUIColorHRGBA(uint32_t rgbaValue)
{
    //  R   G  B  A
    //0xFF FF FF FF
    uint8_t r = (rgbaValue & kColorMaskRed) >> 24;
    uint8_t g = (rgbaValue & kColorMaskGreen) >> 16;
    uint8_t b = (rgbaValue & kColorMaskBlue) >> 8;
    uint8_t a = (rgbaValue & kColorMaskAlpha) / kFBRGBMax;
    return LTMUIColorRGBA(r,g,b,a);
}

UIColor *LTMUIColorRGBA(uint8_t r, uint8_t g, uint8_t b, CGFloat a)
{
    return [UIColor colorWithRed:(r / kFBRGBMax)
                           green:(g / kFBRGBMax)
                            blue:(b / kFBRGBMax)
                           alpha:a];
}

UIColor *LTMUIColorRGB(uint8_t r, uint8_t g, uint8_t b)
{
    return LTMUIColorRGBA(r, g, b, 1.0f);
}

@implementation UIColor (LTMUIColorRGBAdditions)

@end
