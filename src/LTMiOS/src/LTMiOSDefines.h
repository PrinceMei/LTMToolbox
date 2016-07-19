//
//  LFUIKitDefines.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/6/30.
//  Copyright © 2016年 Youku. All rights reserved.
//

#ifndef LTMiOSDefines_h
#define LTMiOSDefines_h

#import <UIKit/UIKit.h>

///系统版本
#ifndef kiOS7Later
#define kiOS7Later ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
#endif

#ifndef LF_SWAP
#define LF_SWAP(a, b)  do { __typeof__(a) _tmp_ = (a); (a) = (b); (b) = _tmp_; } while (0)
#endif


static inline CGRect CGRectCeil(CGRect rect){
    return CGRectMake(ceil(rect.origin.x), ceil(rect.origin.y), ceil(rect.size.width), ceil(rect.size.height));
}

static inline CGSize CGSizeCeil(CGSize size){
    return  CGSizeMake(ceil(size.width), ceil(size.height));
}

static inline CGFloat DegreesToRadians(CGFloat degrees) {
    return degrees * M_PI / 180;
}

static inline CGFloat RadiansToDegrees(CGFloat radians) {
    return radians * 180 / M_PI;
}


#endif /* LFUIKitDefines_h */
