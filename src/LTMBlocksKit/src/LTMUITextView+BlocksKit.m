//
//  LTMUITextView+BlocksKit.h
//  LTMBlocksKit
//

#import "LTMUITextView+BlocksKit.h"
#import "LTMBlocksKitPrivate.h"

#pragma mark Delegate

@interface LTMA2DynamicUITextViewDelegate : LTMA2DynamicDelegate

@end

@implementation LTMA2DynamicUITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
	BOOL ret = YES;
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textViewShouldBeginEditing:)])
		ret = [realDelegate textViewShouldBeginEditing:textView];
	BOOL (^block)(UITextView *) = [self blockImplementationForMethod:_cmd];
	if (block)
		ret &= block(textView);
	return ret;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textViewDidBeginEditing:)])
		[realDelegate textViewDidBeginEditing:textView];
	void (^block)(UITextView *) = [self blockImplementationForMethod:_cmd];
	if (block)
		block(textView);
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
	BOOL ret = YES;
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textViewShouldEndEditing:)])
		ret = [realDelegate textViewShouldEndEditing:textView];
	BOOL (^block)(UITextView *) = [self blockImplementationForMethod:_cmd];
	if (block)
		ret &= block(textView);
	return ret;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textViewDidEndEditing:)])
		[realDelegate textViewDidEndEditing:textView];
	void (^block)(UITextView *) = [self blockImplementationForMethod:_cmd];
	if (block)
		block(textView);
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
	BOOL ret = YES;
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)])
		ret = [realDelegate textView:textView shouldChangeTextInRange:range replacementText:text];
	BOOL (^block)(UITextView *, NSRange, NSString *) = [self blockImplementationForMethod:_cmd];
	if (block)
		ret &= block(textView, range, text);
	return ret;
}

- (void)textViewDidChange:(UITextView *)textView
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textViewDidChange:)])
		[realDelegate textViewDidChange:textView];
	void (^block)(UITextView *) = [self blockImplementationForMethod:_cmd];
	if (block)
		block(textView);
}

- (void)textViewDidChangeSelection:(UITextView *)textView
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textViewDidChangeSelection:)])
		[realDelegate textViewDidChangeSelection:textView];
	void (^block)(UITextView *) = [self blockImplementationForMethod:_cmd];
	if (block)
		block(textView);
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange
{
	BOOL ret = YES;
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textView:shouldInteractWithTextAttachment:inRange:)])
		ret = [realDelegate textView:textView shouldInteractWithTextAttachment:textAttachment inRange:characterRange];
	BOOL (^block)(UITextView *, NSTextAttachment *, NSRange) = [self blockImplementationForMethod:_cmd];
	if (block)
		ret &= block(textView, textAttachment, characterRange);
	return ret;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
	BOOL ret = YES;
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textView:shouldInteractWithURL:inRange:)])
		ret = [realDelegate textView:textView shouldInteractWithURL:URL inRange:characterRange];
	BOOL (^block)(UITextView *, NSURL *, NSRange) = [self blockImplementationForMethod:_cmd];
	if (block)
		ret &= block(textView, URL, characterRange);
	return ret;
}

@end

#pragma mark - Category

@implementation UITextView (LTMUITextViewBlocksAdditions)

@dynamic ltm_shouldBeginEditingBlock, ltm_didBeginEditingBlock, ltm_shouldEndEditingBlock, ltm_didEndEditingBlock, ltm_shouldChangeCharactersInRangeWithReplacementTextBlock, ltm_didChangeBlock, ltm_didChangeSelecionBlock, ltm_shouldInteractWithTextAttachmentInRangeBlock, ltm_shouldInteractWithURLInRangeBlock;

+ (void)load {
	[self ltm_registerDynamicDelegate];
	[self ltm_linkDelegateMethods: @{
									@"ltm_shouldBeginEditingBlock":
										@"textViewShouldBeginEditing:",
									
									@"ltm_didBeginEditingBlock":
										@"textViewDidBeginEditing:",
									
									@"ltm_shouldEndEditingBlock":
										@"textViewDidBeginEditing:",
									
									@"ltm_didEndEditingBlock" :
										@"textViewDidEndEditing:",
									
									@"ltm_shouldChangeCharactersInRangeWithReplacementTextBlock" :
										@"textView:shouldChangeTextInRange:replacementText:",
									
									@"ltm_didChangeBlock" :
										@"textViewDidChange:",
									
									@"ltm_didChangeSelecionBlock" :
										@"textViewDidChangeSelection:",
									
									@"ltm_shouldInteractWithTextAttachmentInRangeBlock" :
										@"textView:shouldInteractWithTextAttachment:inRange:",
									
									@"ltm_shouldInteractWithURLInRangeBlock" :
										@"textView:shouldInteractWithURL:inRange:",
									}];
}

@end
