//
//  LTMUIAlertView+BlocksKit.m
//  LTMBlocksKit
//

#import "LTMUIAlertView+BlocksKit.h"
#import "LTMA2DynamicDelegate.h"
#import "LTMNSObject+A2BlockDelegate.h"
#import "LTMNSObject+A2DynamicDelegate.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark Delegate

@interface A2DynamicUIAlertViewDelegate : LTMA2DynamicDelegate <UIAlertViewDelegate>

@end

@implementation A2DynamicUIAlertViewDelegate

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
	BOOL should = YES;
	
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(alertViewShouldEnableFirstOtherButton:)])
		should &= [realDelegate alertViewShouldEnableFirstOtherButton:alertView];
	
	BOOL (^block)(UIAlertView *) = [self blockImplementationForMethod:_cmd];
	if (block)
		should &= block(alertView);
	
	return should;
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(alertViewCancel:)])
		[realDelegate alertViewCancel:alertView];
	
	id key = @(alertView.cancelButtonIndex);
	void (^cancelBlock)(void) = (self.handlers)[key];
	if (cancelBlock)
		cancelBlock();
}

- (void)willPresentAlertView:(UIAlertView *)alertView
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(willPresentAlertView:)])
		[realDelegate willPresentAlertView:alertView];
	
	void (^block)(UIAlertView *) = [self blockImplementationForMethod:_cmd];
	if (block)
		block(alertView);
}

- (void)didPresentAlertView:(UIAlertView *)alertView
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(didPresentAlertView:)])
		[realDelegate didPresentAlertView:alertView];
	
	void (^block)(UIAlertView *) = [self blockImplementationForMethod:_cmd];
	if (block)
		block(alertView);
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(alertView:willDismissWithButtonIndex:)])
		[realDelegate alertView:alertView willDismissWithButtonIndex:buttonIndex];
	
	void (^block)(UIAlertView *, NSInteger) = [self blockImplementationForMethod:_cmd];
	if (block)
		block(alertView, buttonIndex);
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(alertView:didDismissWithButtonIndex:)])
		[realDelegate alertView:alertView didDismissWithButtonIndex:buttonIndex];
	
	void (^block)(UIAlertView *, NSInteger) = [self blockImplementationForMethod:_cmd];
	if (block)
		block(alertView, buttonIndex);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(alertView:clickedButtonAtIndex:)])
		[realDelegate alertView:alertView clickedButtonAtIndex:buttonIndex];
	
	void (^block)(UIAlertView *, NSInteger) = [self blockImplementationForMethod:_cmd];
	if (block)
		block(alertView, buttonIndex);
	
	id key = @(buttonIndex);
	void (^buttonBlock)(void) = (self.handlers)[key];
	if (buttonBlock)
		buttonBlock();
}

@end

#pragma mark - Category

@implementation UIAlertView (LTMUIAlertViewBlocksAdditions)

@dynamic ltm_willShowBlock, ltm_didShowBlock, ltm_willDismissBlock, ltm_didDismissBlock, ltm_shouldEnableFirstOtherButtonBlock;

+ (void)load
{
	@autoreleasepool {
		[self ltm_registerDynamicDelegate];
		[self ltm_linkDelegateMethods:@{
			@"ltm_willShowBlock": @"willPresentAlertView:",
			@"ltm_didShowBlock": @"didPresentAlertView:",
			@"ltm_willDismissBlock": @"alertView:willDismissWithButtonIndex:",
			@"ltm_didDismissBlock": @"alertView:didDismissWithButtonIndex:",
			@"ltm_shouldEnableFirstOtherButtonBlock": @"alertViewShouldEnableFirstOtherButton:"
		}];
	}
}

#pragma mark Convenience

+ (instancetype)ltm_showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles handler:(void (^)(UIAlertView *alertView, NSInteger buttonIndex))block
{
	// If no buttons were specified, cancel button becomes "Dismiss"
	if (!cancelButtonTitle.length && !otherButtonTitles.count)
		cancelButtonTitle = NSLocalizedString(@"Dismiss", nil);
	
	UIAlertView *alertView = [[[self class] alloc] initWithTitle:title message:message delegate:self.ltm_dynamicDelegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];

	// Set other buttons
	[otherButtonTitles enumerateObjectsUsingBlock:^(NSString *button, NSUInteger idx, BOOL *stop) {
		[alertView addButtonWithTitle:button];
	}];

	// Set `didDismissBlock`
	if (block) alertView.ltm_didDismissBlock = block;
	
	// Show alert view
	[alertView show];
	
	return alertView;
}

#pragma mark Initializers

+ (instancetype)ltm_alertViewWithTitle:(NSString *)title
{
	return [self ltm_alertViewWithTitle:title message:nil];
}

+ (instancetype)ltm_alertViewWithTitle:(NSString *)title message:(NSString *)message
{
	return [[[self class] alloc] ltm_initWithTitle:title message:message];
}

- (instancetype)ltm_initWithTitle:(NSString *)title message:(NSString *)message
{
	self = [self initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
	if (!self) return nil;

	self.delegate = self.ltm_dynamicDelegate;

	return self;
}

#pragma Actions

- (NSInteger)ltm_addButtonWithTitle:(NSString *)title handler:(void (^)(void))block
{
	NSAssert(title.length, @"A button without a title cannot be added to the alert view.");
	NSInteger index = [self addButtonWithTitle:title];
	[self ltm_setHandler:block forButtonAtIndex:index];
	return index;
}

- (NSInteger)ltm_setCancelButtonWithTitle:(NSString *)title handler:(void (^)(void))block
{
	if (!title.length)
		title = NSLocalizedString(@"Cancel", nil);
	NSInteger cancelButtonIndex = [self addButtonWithTitle:title];
	self.cancelButtonIndex = cancelButtonIndex;
	[self ltm_setHandler:block forButtonAtIndex:cancelButtonIndex];
	return cancelButtonIndex;
}

#pragma mark Properties

- (void)ltm_setHandler:(void (^)(void))block forButtonAtIndex:(NSInteger)index
{
	id key = @(index);
	if (block)
		[self.ltm_dynamicDelegate handlers][key] = [block copy];
	else
		[[self.ltm_dynamicDelegate handlers] removeObjectForKey:key];
}

- (void (^)(void))ltm_handlerForButtonAtIndex:(NSInteger)index
{
	return [self.ltm_dynamicDelegate handlers][@(index)];
}

- (void (^)(void))ltm_cancelBlock
{
	return [self ltm_handlerForButtonAtIndex:self.cancelButtonIndex];
}

- (void)ltm_setCancelBlock:(void (^)(void))block
{
	if (block && self.cancelButtonIndex == -1) {
		[self ltm_setCancelButtonWithTitle:nil handler:block];
		return;
	}
	
	[self ltm_setHandler:block forButtonAtIndex:self.cancelButtonIndex];
}

@end

#pragma clang diagnostic pop
