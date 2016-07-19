//
//  LFUIScrollViewUtils.m
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/12.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import "LTMUIScrollViewUtility.h"

@implementation LTMUIScrollViewUtility

+ (void)scrollView:(UIScrollView *)scrollView scrollToTopAnimated:(BOOL)animated{
    
    CGPoint off = scrollView.contentOffset;
    off.y = 0 - scrollView.contentInset.top;
    [scrollView setContentOffset:off animated:animated];

}

+ (void)scrollView:(UIScrollView *)scrollView scrollToBottomAnimated:(BOOL)animated{
    
    CGPoint off = scrollView.contentOffset;
    off.y = scrollView.contentSize.height - scrollView.bounds.size.height + scrollView.contentInset.bottom;
    [scrollView setContentOffset:off animated:animated];

}

+ (void)scrollView:(UIScrollView *)scrollView scrollToLeftAnimated:(BOOL)animated{
    
    CGPoint off = scrollView.contentOffset;
    off.x = 0 - scrollView.contentInset.left;
    [scrollView setContentOffset:off animated:animated];

}

+ (void)scrollView:(UIScrollView *)scrollView scrollToRightAnimated:(BOOL)animated{
    
    CGPoint off = scrollView.contentOffset;
    off.x = scrollView.contentSize.width - scrollView.bounds.size.width + scrollView.contentInset.right;
    [scrollView setContentOffset:off animated:animated];

}

@end
