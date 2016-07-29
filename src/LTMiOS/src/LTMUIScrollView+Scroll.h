//
//  UIScrollView+LTMUIScrollView.h
//  LTMToolbox
//
//  Created by Charming04 on 16/7/29.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (LTMUIScrollViewScrollAdditions)

- (void) ltm_scrollToTopAnimated:(BOOL)animated;

- (void) ltm_scrollToBottomAnimated:(BOOL)animated;

- (void) ltm_scrollToLeftAnimated:(BOOL)animated;

- (void) ltm_scrollToRightAnimated:(BOOL)animated;

@end
