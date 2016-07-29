//
//  UIScrollView+LTMUIScrollView.m
//  LTMToolbox
//
//  Created by Charming04 on 16/7/29.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import "LTMUIScrollView+Scroll.h"

@implementation UIScrollView (LTMUIScrollViewScrollAdditions)

- (void) ltm_scrollToTopAnimated:(BOOL)animated{
    
    CGPoint off = self.contentOffset;
    off.y = 0 - self.contentInset.top;
    [self setContentOffset:off animated:animated];
}

- (void) ltm_scrollToBottomAnimated:(BOOL)animated{
    
    CGPoint off = self.contentOffset;
    off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
    [self setContentOffset:off animated:animated];
}

- (void) ltm_scrollToLeftAnimated:(BOOL)animated{
    
    CGPoint off = self.contentOffset;
    off.x = 0 - self.contentInset.left;
    [self setContentOffset:off animated:animated];
}

- (void) ltm_scrollToRightAnimated:(BOOL)animated{
    
    CGPoint off = self.contentOffset;
    off.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    [self setContentOffset:off animated:animated];
}


@end
