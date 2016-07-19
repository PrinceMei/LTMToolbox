
//
//  LFNSBundleUtils.m
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/8.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import "LTMNSBundleUtility.h"
#import <UIKit/UIKit.h>
#import "LTMNSStringUtility.h"

#define SUPPORT_SCALES @[@3, @2, @1]
@implementation LTMNSBundleUtility

+ (NSString *)pathForScaledResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)bundlePath{
    
    if (name.length == 0) return nil;
    if ([name hasSuffix:@"/"]) return [[NSBundle mainBundle] pathForResource:name ofType:ext inDirectory:bundlePath];
    
    NSString *path = nil;
    
    // first search screen's scale, then search from high to low.
    NSArray *scales = [self allScales];
    for (int s = 0; s < scales.count; s++) {
        CGFloat scale = ((NSNumber *)scales[s]).floatValue;
        NSString *scaledName = ext.length ?  [LTMNSStringUtility filenameWithString:name appendingByNameScale:scale]
        :  [LTMNSStringUtility filenameWithString:name appendingByPathScale:scale];
        path = [[NSBundle mainBundle] pathForResource:scaledName ofType:ext inDirectory:bundlePath];
        if (path) break;
    }
    
    return path;

}


+ (NSArray *)allScales {
    static NSMutableArray *scales;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // first search screen's scale, then search from high to low.
        scales = SUPPORT_SCALES.mutableCopy;
        NSInteger screenScale = [UIScreen mainScreen].scale;
        [scales removeObject:@(screenScale)];
        [scales insertObject:@(screenScale) atIndex:0];
    });
    return scales;
}
@end
