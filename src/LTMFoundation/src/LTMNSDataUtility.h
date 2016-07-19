//
//  LFNSDataUtils.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/8.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTMNSDataUtility : NSObject

/// 从 main bundle 里加载数据 (和 [UIImage imageNamed:] 类似).
+ (NSData *)dataNamed:(NSString *)name;

#pragma mark - 编码
///=============================================================================
/// @name 编码
///=============================================================================


/// 用 UTF8 解码
+ (NSString *)utf8StringWithData:(NSData *)data;

/// 转换为大写 hex 字符串
+ (NSString *)hexStringWithData:(NSData *)data;

/// 用 hex 字符串(不区分大小写)创建NSData。 失败则返回nil。
+ (NSData *)dataWithHexString:(NSString *)hexString;



@end
