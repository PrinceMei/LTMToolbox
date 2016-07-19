//
//  LTMUIWebView+BlocksKit.h
//  LTMBlocksKit
//

#import "LTMBlocksKitDefines.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/** Block callbacks for UIWebView.

 @warning UIWebView is only available on a platform with UIKit.
*/

@interface UIWebView (LTMUIWebViewBlocksAdditions)

/** The block to be decide whether a URL will be loaded. 
 
 @warning If the delegate implements webView:shouldStartLoadWithRequest:navigationType:,
 the return values of both the delegate method and the block will be considered.
*/
@property (nonatomic, copy, setter = ltm_setShouldStartLoadBlock:, nullable) BOOL (^ltm_shouldStartLoadBlock)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType);

/** The block that is fired when the web view starts loading. */
@property (nonatomic, copy, setter = ltm_setDidStartLoadBlock:, nullable) void (^ltm_didStartLoadBlock)(UIWebView *webView);

/** The block that is fired when the web view finishes loading. */
@property (nonatomic, copy, setter = ltm_setDidFinishLoadBlock:, nullable) void (^ltm_didFinishLoadBlock)(UIWebView *webView);

/** The block that is fired when the web view stops loading due to an error. */
@property (nonatomic, copy, setter = ltm_setDidFinishWithErrorBlock:, nullable) void (^ltm_didFinishWithErrorBlock)(UIWebView *webView, NSError *error);

@end

NS_ASSUME_NONNULL_END