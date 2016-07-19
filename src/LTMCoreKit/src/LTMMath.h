//
//  LFMath.h
//  LaiFeng
//
//  Created by wangxiaoxiang on 16/6/12.
//  Copyright © 2016年 live Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LTMMath : NSObject

#pragma mark -
#pragma mark - ceil
+ (CGRect)ceilCGRect:(CGRect)bounds;

+ (CGSize)ceilCGSize:(CGSize)size;

+ (CGPoint)ceilCGPoint:(CGPoint)point;

+ (CGFloat)ceilCGFloat:(CGFloat)floatValue;

#pragma mark -
#pragma mark - floor
+ (CGRect)floorCGRect:(CGRect)bounds;

+ (CGFloat)floorCGFloat:(CGFloat)floatValue;

+ (CGSize)floorCGSize:(CGSize)size;

+ (CGPoint)floorCGPoint:(CGPoint)point;


#pragma mark -
#pragma mark - hash
+ (NSUInteger)hashWithCGFloat:(CGFloat)value;
+ (NSUInteger)hashWithCString:(const char *)value;
+ (NSUInteger)hashWithDouble:(double)value;
+ (NSUInteger)hashWithFloat:(float)value;
+ (NSUInteger)hashWithInteger:(NSUInteger)value;
+ (NSUInteger)hashWithInteger:(NSUInteger)value1 integer:(NSUInteger)value2;
+ (NSUInteger)hashWithIntegerArray:(NSUInteger *)values count:(NSUInteger)count;
+ (NSUInteger)hashWithLong:(unsigned long long)value;
+ (NSUInteger)hashWithPointer:(const void *)value;

@end
