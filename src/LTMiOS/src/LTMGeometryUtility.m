//
//  LTMGeometryUtils.m
//  LaiFeng
//
//  Created by wangxiaoxiang on 16/6/8.
//  Copyright © 2016年 live Interactive. All rights reserved.
//

#import "LTMGeometryUtility.h"

CGRect LTMCGAlignRectangles(CGRect alignee, CGRect aligner, LTMRectAlignment alignment) {
    switch (alignment) {
        case LTMRectAlignTop:
            alignee.origin.x = aligner.origin.x + (CGRectGetWidth(aligner) * .5f - CGRectGetWidth(alignee) * .5f);
            alignee.origin.y = aligner.origin.y + CGRectGetHeight(aligner) - CGRectGetHeight(alignee);
            break;
            
        case LTMRectAlignTopLeft:
            alignee.origin.x = aligner.origin.x;
            alignee.origin.y = aligner.origin.y + CGRectGetHeight(aligner) - CGRectGetHeight(alignee);
            break;
            
        case LTMRectAlignTopRight:
            alignee.origin.x = aligner.origin.x + CGRectGetWidth(aligner) - CGRectGetWidth(alignee);
            alignee.origin.y = aligner.origin.y + CGRectGetHeight(aligner) - CGRectGetHeight(alignee);
            break;
            
        case LTMRectAlignLeft:
            alignee.origin.x = aligner.origin.x;
            alignee.origin.y = aligner.origin.y + (CGRectGetHeight(aligner) * .5f - CGRectGetHeight(alignee) * .5f);
            break;
            
        case LTMRectAlignBottomLeft:
            alignee.origin.x = aligner.origin.x;
            alignee.origin.y = aligner.origin.y;
            break;
            
        case LTMRectAlignBottom:
            alignee.origin.x = aligner.origin.x + (CGRectGetWidth(aligner) * .5f - CGRectGetWidth(alignee) * .5f);
            alignee.origin.y = aligner.origin.y;
            break;
            
        case LTMRectAlignBottomRight:
            alignee.origin.x = aligner.origin.x + CGRectGetWidth(aligner) - CGRectGetWidth(alignee);
            alignee.origin.y = aligner.origin.y;
            break;
            
        case LTMRectAlignRight:
            alignee.origin.x = aligner.origin.x + CGRectGetWidth(aligner) - CGRectGetWidth(alignee);
            alignee.origin.y = aligner.origin.y + (CGRectGetHeight(aligner) * .5f - CGRectGetHeight(alignee) * .5f);
            break;
            
        default:
        case LTMRectAlignCenter:
            alignee.origin.x = aligner.origin.x + (CGRectGetWidth(aligner) * .5f - CGRectGetWidth(alignee) * .5f);
            alignee.origin.y = aligner.origin.y + (CGRectGetHeight(aligner) * .5f - CGRectGetHeight(alignee) * .5f);
            break;
    }
    return alignee;
}

CGRect LTMCGScaleRectangleToSize(CGRect scalee, CGSize size, LTMScaling scaling) {
    switch (scaling) {
            
        case LTMScaleToFillProportionally:
        case LTMScaleProportionally: {
            CGFloat height = CGRectGetHeight(scalee);
            CGFloat width = CGRectGetWidth(scalee);
            if (isnormal(height) && isnormal(width) &&
                (height > size.height || width > size.width)) {
                CGFloat horiz = size.width / width;
                CGFloat vert = size.height / height;
                BOOL expand = (scaling == LTMScaleToFillProportionally);
                // We use the smaller scale unless expand is true. In that case, larger.
                CGFloat newScale = ((horiz < vert) ^ expand) ? horiz : vert;
                scalee = LTMCGRectScale(scalee, newScale, newScale);
            }
            break;
        }
            
        case LTMScaleToFit:
            scalee.size = size;
            break;
            
        case LTMScaleNone:
        default:
            // Do nothing
            break;
    }
    return scalee;
}