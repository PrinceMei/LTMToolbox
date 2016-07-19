//
//  LFNSStringUtils.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/1.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface LTMNSStringUtility : NSObject


///=============================================================================
/// @name md5
///=============================================================================
//md5
+ (NSString *)MD5:(NSString *)inString;

//md5
+ (NSString *)MD5WithData:(NSData *)inData;


///=============================================================================
/// @name Utilities
///=============================================================================
/*!
 	@method
 	@abstract
 	@discussion	返回一个随机 UUID 例如 "D1178E50-2A4D-4F1F-9BD3-F6AAB00E06B1"
 	@result
 */
+ (NSString *)stringWithUUID;

/*!
 	@method
 	@abstract
 	@discussion	切去头尾的空白字符 (空格/换行等)
 	@result
 */
+ (NSString *)stringByTrim:(NSString *)string;

/*!
 	@method
 	@abstract
 	@discussion	是否非空 (例如 nil, @"", @"  ", @"\n" 返回 NO)
 	@param 	string
 	@result
 */
+ (BOOL)stringIsNotBlank:(NSString *)string;

/**
 为文件名添加 @2x, @3x 的后缀: @"name" -> @"name@2x"
 这里假设没有扩展名
 
 e.g.
 <table>
 <tr><th>Before     </th><th>After(scale:2)</th></tr>
 <tr><td>"icon"     </td><td>"icon@2x"     </td></tr>
 <tr><td>"icon "    </td><td>"icon @2x"    </td></tr>
 <tr><td>"icon.top" </td><td>"icon.top@2x" </td></tr>
 <tr><td>"/p/name"  </td><td>"/p/name@2x"  </td></tr>
 <tr><td>"/path/"   </td><td>"/path/"      </td></tr>
 </table>
 
 @param scale Resource scale.
 @return String by add scale modifier, or just return if it's not end with file name.
 */
+ (NSString *)filenameWithString:(NSString *)string  appendingByNameScale:(CGFloat)scale;

/**
 为完整文件名添加 @2x, @3x 后缀: @"name.png" -> @"name@2x.png"
 这里假设有扩展名
 
 e.g.
 <table>
 <tr><th>Before     </th><th>After(scale:2)</th></tr>
 <tr><td>"icon.png" </td><td>"icon@2x.png" </td></tr>
 <tr><td>"icon..png"</td><td>"icon.@2x.png"</td></tr>
 <tr><td>"icon"     </td><td>"icon@2x"     </td></tr>
 <tr><td>"icon "    </td><td>"icon @2x"    </td></tr>
 <tr><td>"icon."    </td><td>"icon.@2x"    </td></tr>
 <tr><td>"/p/name"  </td><td>"/p/name@2x"  </td></tr>
 <tr><td>"/path/"   </td><td>"/path/"      </td></tr>
 </table>
 
 @param scale Resource scale.
 @return String by add scale modifier, or just return if it's not end with file name.
 */
+ (NSString *)filenameWithString:(NSString *)string  appendingByPathScale:(CGFloat)scale;

/**
 解析字符串的scale.
 例如 icon@2x.png 返回 2.
 
 e.g.
 <table>
 <tr><th>Path            </th><th>Scale </th></tr>
 <tr><td>"icon.png"      </td><td>1     </td></tr>
 <tr><td>"icon@2x.png"   </td><td>2     </td></tr>
 <tr><td>"icon@2.5x.png" </td><td>2.5   </td></tr>
 <tr><td>"icon@2x"       </td><td>1     </td></tr>
 <tr><td>"icon@2x..png"  </td><td>1     </td></tr>
 <tr><td>"icon@2x.png/"  </td><td>1     </td></tr>
 </table>
 */
+ (CGFloat)pathScaleWithString:(NSString *)string;



@end
