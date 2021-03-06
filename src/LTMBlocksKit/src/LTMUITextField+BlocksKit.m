//
//  LTMUITextField+BlocksKit.m
//  LTMBlocksKit
//

#import "LTMUITextField+BlocksKit.h"
#import "LTMBlocksKitPrivate.h"

#pragma mark Delegate

@interface LTMA2DynamicUITextFieldDelegate : LTMA2DynamicDelegate

@end

@implementation LTMA2DynamicUITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
	BOOL ret = YES;
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textFieldShouldBeginEditing:)])
		ret = [realDelegate textFieldShouldBeginEditing:textField];
	BOOL (^block)(UITextField *) = [self blockImplementationForMethod:_cmd];
	if (block)
		ret &= block(textField);
	return ret;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textFieldDidBeginEditing:)])
		[realDelegate textFieldDidBeginEditing:textField];
	void (^block)(UITextField *) = [self blockImplementationForMethod:_cmd];
	if (block)
		block(textField);
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
	BOOL ret = YES;
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textFieldShouldEndEditing:)])
		ret = [realDelegate textFieldShouldEndEditing:textField];
	BOOL (^block)(UITextField *) = [self blockImplementationForMethod:_cmd];
	if (block)
		ret &= block(textField);
	return ret;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textFieldDidEndEditing:)])
		[realDelegate textFieldDidEndEditing:textField];
	void (^block)(UITextField *) = [self blockImplementationForMethod:_cmd];
	if (block)
		block(textField);
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	BOOL ret = YES;
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)])
		ret = [realDelegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
	BOOL (^block)(UITextField *, NSRange, NSString *) = [self blockImplementationForMethod:_cmd];
	if (block)
		ret &= block(textField, range, string);
	return ret;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
	BOOL ret = YES;
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textFieldShouldClear:)])
		ret = [realDelegate textFieldShouldClear:textField];
	BOOL (^block)(UITextField *) = [self blockImplementationForMethod:_cmd];
	if (block)
		ret &= block(textField);
	return ret;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	BOOL ret = YES;
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textFieldShouldReturn:)])
		ret = [realDelegate textFieldShouldReturn:textField];
	BOOL (^block)(UITextField *) = [self blockImplementationForMethod:_cmd];
	if (block)
		ret &= block(textField);
	return ret;
}

@end

#pragma mark - Category

@implementation UITextField (LTMUITextFieldBlocksAdditions)

@dynamic ltm_shouldBeginEditingBlock, ltm_didBeginEditingBlock, ltm_shouldEndEditingBlock, ltm_didEndEditingBlock, ltm_shouldChangeCharactersInRangeWithReplacementStringBlock, ltm_shouldClearBlock, ltm_shouldReturnBlock;

+ (void)load {
    [self ltm_registerDynamicDelegate];
    [self ltm_linkDelegateMethods: @{
        @"ltm_shouldBeginEditingBlock": @"textFieldShouldBeginEditing:",
        @"ltm_didBeginEditingBlock": @"textFieldDidBeginEditing:",
        @"ltm_shouldEndEditingBlock": @"textFieldShouldEndEditing:",
        @"ltm_didEndEditingBlock" : @"textFieldDidEndEditing:",
        @"ltm_shouldChangeCharactersInRangeWithReplacementStringBlock" : @"textField:shouldChangeCharactersInRange:replacementString:",
        @"ltm_shouldClearBlock" : @"textFieldShouldClear:",
        @"ltm_shouldReturnBlock" : @"textFieldShouldReturn:",
    }];
}

@end
