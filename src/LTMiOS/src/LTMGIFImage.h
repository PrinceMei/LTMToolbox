//
//  LFGIFImage.h
//
//
//  Created by guoyaoyuan on 14/10/20.
//  Copyright (c) 2014 live Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 LFAnimatedImage 协议。实现该协议的 UIImage 都可以放到 LFAnimatedImageView 来显示动画。
 */
@protocol LTMAnimatedImage <NSObject>
@required

/// 总图片数.
- (NSUInteger)animatedImageCount;

/// 动画重复次数. 0表示无限循环.
- (NSUInteger)animatedImageRepeatCount;

/// 每帧的 Bytes (用来优化内存缓存)
- (NSUInteger)animatedImageBytesPerFrame;

/// 返回一帧图片 (该方法将在后台线程被调用).
/// @param index  Index from 0.
- (UIImage *)animatedImageAtIndex:(NSUInteger)index;

/// 返回一帧图片的显示时间
/// @param index  Index from 0.
- (NSTimeInterval)animatedImageDurationAtIndex:(NSUInteger)index;

@end

/**
 可以显示 GIF 的 Image。

 @discussion 该类和 UIImage 用法一样，可以作为 UIImage 的完整替代品。
 只有当被显示在 LFAnimatedImageView 里时，才会有动画效果。
 
 示例代码:
     // icon@2x.gif
     LFGIFImage *image = [LFGIFImage imageNamed:@"icon"];
     LFAnimatedImageView *imageView = [LFAnimatedImageView alloc] initWithImage:image];
     [view addSubView:imageView];
 */
@interface LTMGIFImage : UIImage <LTMAnimatedImage>

// 下面方法声明和 UIImage 一样， 只是为了避免编译警告
+ (LTMGIFImage *)imageNamed:(NSString *)name; // 不再缓存
+ (LTMGIFImage *)imageWithContentsOfFile:(NSString *)path;
+ (LTMGIFImage *)imageWithData:(NSData *)data;
+ (LTMGIFImage *)imageWithData:(NSData *)data scale:(CGFloat)scale;

@end
