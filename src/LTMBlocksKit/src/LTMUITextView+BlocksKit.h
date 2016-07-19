//
//  LTMUITextView+BlocksKit.h
//  LTMBlocksKit
//
//  Contributed by Su, Hsing-Yu
//

#import <UIKit/UITextView.h>

/** Block callbacks for UITextView.
 
 @warning UITextView is only available on a platform with UIKit.
 
 Created by Su, Hsing-Yu (https://github.com/aipeople) and
 contributed to LTMBlocksKit.
 */
@interface UITextView (LTMUITextViewBlocksAdditions)

/**
 *	The block that fires before the receiver begins editing
 *
 *  The return value indicates whether the receiver should begin editing
 */
@property (nonatomic, copy) BOOL(^ltm_shouldBeginEditingBlock)(__kindof UITextView *textView);

/**
 *	The block that fires after the receiver begins editing
 */
@property (nonatomic, copy) void(^ltm_didBeginEditingBlock)(__kindof UITextView *textView);

/**
 *	The block that fires before the receiver ends editing
 *
 *  The return value indicates whether the receiver should end editing
 */
@property (nonatomic, copy) BOOL(^ltm_shouldEndEditingBlock)(__kindof UITextView *textView);

/**
 *	The block that fires after the receiver ends editing
 */
@property (nonatomic, copy) void(^ltm_didEndEditingBlock)(__kindof UITextView *textView);

/**
 *	The block that fires when the receiver's text will change
 *
 *  The return value indicates whether the receiver should replace the characters in the given range with the replacement string
 */
@property (nonatomic, copy) BOOL(^ltm_shouldChangeCharactersInRangeWithReplacementTextBlock)(__kindof UITextView *textView, NSRange range, NSString *text);

/**
 *	The block that fires after the receiver's text changed
 */
@property (nonatomic, copy) void(^ltm_didChangeBlock)(__kindof UITextView *textView);

/**
 *	The block that fires after the receiver changes selection
 */
@property (nonatomic, copy) void(^ltm_didChangeSelecionBlock)(__kindof UITextView *textView);

/**
 *  The block that fires when the user tring to interact with the receiver's text attachment
 *
 *  The return value indicates whether the user should interact with the text attachment
 */
@property (nonatomic, copy) BOOL(^ltm_shouldInteractWithTextAttachmentInRangeBlock)(__kindof UITextView *textView, NSTextAttachment *attachment, NSRange range);

/**
 *  The block that fires when the user tring to interact with an URL in the given range
 *
 *  The return value indicates whether the receiver should response to the interaction or not
 */
@property (nonatomic, copy) BOOL(^ltm_shouldInteractWithURLInRangeBlock)(__kindof UITextView *textView, NSURL *url, NSRange range);

@end
