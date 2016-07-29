//
//  LFNSNotificationCenterUtils.m
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/11.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import "LTMNSNotificationCenterUtility.h"
#include <pthread.h>

@implementation LTMNSNotificationCenterUtility

#pragma mark --public Method


+ (void)postNotificationOnMainThreadWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo{
    
    if (pthread_main_np()) return [self postNotificationWithName:name object:object userInfo:userInfo];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:userInfo];
    });
}

+ (void)postNotificationWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:userInfo];
}


@end
