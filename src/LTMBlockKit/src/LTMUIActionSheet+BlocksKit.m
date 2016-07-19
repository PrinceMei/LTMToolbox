//
//  LTMUIActionSheet+BlocksKit.m
//  LTMBlocksKit
//

#import "LTMUIActionSheet+BlocksKit.h"
#import "LTMA2DynamicDelegate.h"
#import "LTMNSObject+A2DynamicDelegate.h"
#import "LTMNSObject+A2BlockDelegate.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark Custom delegate

@interface A2DynamicUIActionSheetDelegate : LTMA2DynamicDelegate <UIActionSheetDelegate>

@property (nonatomic, assign) BOOL didHandleButtonClick;

@end

@implementation A2DynamicUIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)])
		[realDelegate actionSheet:actionSheet clickedButtonAtIndex:buttonIndex];

	void (^handler)(void) = self.handlers[@(buttonIndex)];

	// Note: On iPad with iOS 8 GM seed, `actionSheet:clickedButtonAtIndex:` always gets called twice if you tap any button other than Cancel;
	// In other words, assume you have two buttons: OK and Cancel; if you tap OK, this method will be called once for the OK button and once
	// for the Cancel button. This could result in some really obscure bugs, so adding `didHandleButtonClick` property maintains iOS 7 compatibility.
	if (handler && self.didHandleButtonClick == NO) {
		self.didHandleButtonClick = YES;

		// Presenting view controllers from within action sheet delegate does not work on iPad running iOS 8 GM seed, without delay
		dispatch_async(dispatch_get_main_queue(), handler);
	}
}

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(willPresentActionSheet:)])
		[realDelegate willPresentActionSheet:actionSheet];

	void (^block)(UIActionSheet *) = [self blockImplementationForMethod:_cmd];
	if (block) block(actionSheet);
}

- (void)didPresentActionSheet:(UIActionSheet *)actionSheet
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(didPresentActionSheet:)])
		[realDelegate didPresentActionSheet:actionSheet];

	void (^block)(UIActionSheet *) = [self blockImplementationForMethod:_cmd];
	if (block) block(actionSheet);
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(actionSheet:willDismissWithButtonIndex:)])
		[realDelegate actionSheet:actionSheet willDismissWithButtonIndex:buttonIndex];

	void (^block)(UIActionSheet *, NSInteger) = [self blockImplementationForMethod:_cmd];
	if (block) block(actionSheet, buttonIndex);
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(actionSheet:didDismissWithButtonIndex:)])
		[realDelegate actionSheet:actionSheet didDismissWithButtonIndex:buttonIndex];

	void (^block)(UIActionSheet *, NSInteger) = [self blockImplementationForMethod:_cmd];
	if (block) block(actionSheet, buttonIndex);
	self.didHandleButtonClick = NO;
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(actionSheetCancel:)])
		[realDelegate actionSheetCancel:actionSheet];

	void (^block)(void) = actionSheet.ltm_cancelBlock;
	if (block) block();
}

@end

#pragma mark - Category

@implementation UIActionSheet (LTMUIActionSheetBlockAdditions)

@dynamic ltm_willShowBlock, ltm_didShowBlock, ltm_willDismissBlock, ltm_didDismissBlock;

+ (void)load
{
	@autoreleasepool {
		[self ltm_registerDynamicDelegate];
		[self ltm_linkDelegateMethods:@{
			@"ltm_willShowBlock": @"willPresentActionSheet:",
			@"ltm_didShowBlock": @"didPresentActionSheet:",
			@"ltm_willDismissBlock": @"actionSheet:willDismissWithButtonIndex:",
			@"ltm_didDismissBlock": @"actionSheet:didDismissWithButtonIndex:"
		}];
	}
}

#pragma mark Initializers

+ (instancetype)ltm_actionSheetWithTitle:(NSString *)title {
	return [[[self class] alloc] ltm_initWithTitle:title];
}

- (instancetype)ltm_initWithTitle:(NSString *)title {
	self = [self initWithTitle:title delegate:self.ltm_dynamicDelegate cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
	if (!self) { return nil; }
	self.delegate = self.ltm_dynamicDelegate;
	return self;
}

#pragma mark Actions

- (NSInteger)ltm_addButtonWithTitle:(NSString *)title handler:(void (^)(void))block {
	NSAssert(title.length, @"A button without a title cannot be added to an action sheet.");
	NSInteger index = [self addButtonWithTitle:title];
	[self ltm_setHandler:block forButtonAtIndex:index];
	return index;
}

- (NSInteger)ltm_setDestructiveButtonWithTitle:(NSString *)title handler:(void (^)(void))block {
	NSInteger index = [self ltm_addButtonWithTitle:title handler:block];
	self.destructiveButtonIndex = index;
	return index;
}

- (NSInteger)ltm_setCancelButtonWithTitle:(NSString *)title handler:(void (^)(void))block {
	NSInteger cancelButtonIndex = self.cancelButtonIndex;

	if ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) && !title.length)
		title = NSLocalizedString(@"Cancel", nil);

	if (title.length)
		cancelButtonIndex = [self addButtonWithTitle:title];

	[self ltm_setHandler:block forButtonAtIndex:cancelButtonIndex];
	self.cancelButtonIndex = cancelButtonIndex;
	return cancelButtonIndex;
}

#pragma mark Properties

- (void)ltm_setHandler:(void (^)(void))block forButtonAtIndex:(NSInteger)index {
	A2DynamicUIActionSheetDelegate *delegate = self.ltm_ensuredDynamicDelegate;

	if (block) {
		delegate.handlers[@(index)] = [block copy];
	} else {
		[delegate.handlers removeObjectForKey:@(index)];
	}
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
	[self ltm_setHandler:block forButtonAtIndex:self.cancelButtonIndex];
}

@end

#pragma clang diagnostic pop
