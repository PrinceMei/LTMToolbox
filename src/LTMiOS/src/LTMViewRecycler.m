//
//  LFViewRecycler.m
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/6/30.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import "LTMViewRecycler.h"

#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "LFUIKit requires ARC support."
#endif

@interface LTMViewRecycler()
@property (nonatomic, strong) NSMutableDictionary* reuseIdentifiersToRecycledViews;
@end


@implementation LTMViewRecycler

#pragma  mark --life cycle
-(instancetype)init
{
    if ((self = [super init])) {
        _reuseIdentifiersToRecycledViews = [NSMutableDictionary new];
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(reduceMemoryUsage)
                   name:UIApplicationDidReceiveMemoryWarningNotification
                 object:nil];
    }
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark --Memory Warnings
- (void)reduceMemoryUsage{
    [self removeAllViews];
}

#pragma mark --Public
- (UIView<LFRecyclableView> *)dequeueReusableViewWithIdentifier:(NSString *)reuseIdentifier{
    NSMutableArray * views  = [_reuseIdentifiersToRecycledViews objectForKey:reuseIdentifier];
    UIView<LFRecyclableView> * view = [views lastObject];
    if (nil != view) {
        [views removeLastObject];
        if ([view respondsToSelector:@selector(prepareForReuse)]) {
            [view prepareForReuse];
        }
    }
    return view;
}

- (void)recycleView:(UIView<LFRecyclableView> *)view{
    NSString* reuseIdentifier = nil;
    if ([view respondsToSelector:@selector(reuseIdentifier)]) {
        reuseIdentifier = [view reuseIdentifier];
    }
    
    if (nil == reuseIdentifier) {
        reuseIdentifier = NSStringFromClass([view class]);
    }
    
    if (nil == reuseIdentifier) {
        return;
    }
    
    NSMutableArray* views = [_reuseIdentifiersToRecycledViews objectForKey:reuseIdentifier];
    if (nil == views) {
        views = [NSMutableArray new];
        [_reuseIdentifiersToRecycledViews setObject:views forKey:reuseIdentifier];
    }
    [views addObject:view];
}

#pragma  mark --Private 
- (void)removeAllViews{
    [_reuseIdentifiersToRecycledViews removeAllObjects];
}



@end
