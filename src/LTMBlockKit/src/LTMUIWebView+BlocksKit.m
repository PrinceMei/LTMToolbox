//
//  LTMUIWebView+BlocksKit.m
//  LTMBlocksKit
//

#import "LTMUIWebView+BlocksKit.h"
#import "LTMA2DynamicDelegate.h"
#import "LTMNSObject+A2DynamicDelegate.h"
#import "LTMNSObject+A2BlockDelegate.h"

#pragma mark Custom delegate

@interface A2DynamicUIWebViewDelegate : LTMA2DynamicDelegate <UIWebViewDelegate>
@end

@implementation A2DynamicUIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	BOOL ret = YES;
	
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(webView:shouldStartLoadWithRequest:navigationType:)])
		ret = [realDelegate webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];

	BOOL (^block)(UIWebView *, NSURLRequest *, UIWebViewNavigationType) = [self blockImplementationForMethod:_cmd];
	if (block)
		ret &= block(webView, request, navigationType);

	return ret;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(webViewDidStartLoad:)])
		[realDelegate webViewDidStartLoad:webView];

	void (^block)(UIWebView *) = [self blockImplementationForMethod:_cmd];
	if (block) block(webView);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(webViewDidFinishLoad:)])
		[realDelegate webViewDidFinishLoad:webView];

	void (^block)(UIWebView *) = [self blockImplementationForMethod:_cmd];
	if (block) block(webView);
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(webView:didFailLoadWithError:)])
		[realDelegate webView:webView didFailLoadWithError:error];

	void (^block)(UIWebView *, NSError *) = [self blockImplementationForMethod:_cmd];
	if (block) block(webView, error);
}

@end

#pragma mark Category

@implementation UIWebView (LTMUIWebViewBlocksAdditions)

@dynamic ltm_shouldStartLoadBlock, ltm_didStartLoadBlock, ltm_didFinishLoadBlock, ltm_didFinishWithErrorBlock;

+ (void)load
{
	@autoreleasepool {
		[self ltm_registerDynamicDelegate];
		[self ltm_linkDelegateMethods:@{
			@"ltm_shouldStartLoadBlock": @"webView:shouldStartLoadWithRequest:navigationType:",
			@"ltm_didStartLoadBlock": @"webViewDidStartLoad:",
			@"ltm_didFinishLoadBlock": @"webViewDidFinishLoad:",
			@"ltm_didFinishWithErrorBlock": @"webView:didFailLoadWithError:"
		}];
	}
}

@end
