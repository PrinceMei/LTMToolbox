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
    
    if (pthread_main_np()) return [[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:userInfo];
    
    
    [self postNotificationOnMainThreadWithName:name object:object userInfo:userInfo waitUntilDone:NO];
}


#pragma mark --private Method
+ (void)postNotificationOnMainThreadWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo waitUntilDone:(BOOL)wait {
    
    NSMutableDictionary *info = [[NSMutableDictionary allocWithZone:nil] initWithCapacity:3];
    if (name) [info setObject:name forKey:@"name"];
    if (object) [info setObject:object forKey:@"object"];
    if (userInfo) [info setObject:userInfo forKey:@"userInfo"];
    [[self class] performSelectorOnMainThread:@selector(postNotification:) withObject:info waitUntilDone:wait];
}

+ (void)postNotification:(NSDictionary *)info {
    
    NSString *name = [info objectForKey:@"name"];
    id object = [info objectForKey:@"object"];
    NSDictionary *userInfo = [info objectForKey:@"userInfo"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:userInfo];
}

@end
