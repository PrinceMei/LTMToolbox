//
//  LTMUIGestureRecognizer+BlocksKit.m
//  LTMBlocksKit
//

#import "LTMUIGestureRecognizer+BlocksKit.h"
#import "LTMNSObject+BlocksKit.h"
@import ObjectiveC.runtime;

static const void *LTMGestureRecognizerBlockKey = &LTMGestureRecognizerBlockKey;
static const void *LTMGestureRecognizerDelayKey = &LTMGestureRecognizerDelayKey;
static const void *LTMGestureRecognizerShouldHandleActionKey = &LTMGestureRecognizerShouldHandleActionKey;

@interface UIGestureRecognizer (LTMUIGestureRecognizerBlocksAdditionsInternal)

@property (nonatomic, setter = ltm_setShouldHandleAction:) BOOL ltm_shouldHandleAction;

- (void)ltm_handleAction:(UIGestureRecognizer *)recognizer;

@end

@implementation UIGestureRecognizer (LTMUIGestureRecognizerBlocksAdditions)

+ (instancetype)ltm_recognizerWithHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))block delay:(NSTimeInterval)delay
{
	return [[[self class] alloc] ltm_initWithHandler:block delay:delay];
}

- (instancetype)ltm_initWithHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))block delay:(NSTimeInterval)delay
{
	self = [self initWithTarget:self action:@selector(ltm_handleAction:)];
	if (!self) return nil;

	self.ltm_handler = block;
	self.ltm_handlerDelay = delay;

	return self;
}

+ (instancetype)ltm_recognizerWithHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))block
{
	return [self ltm_recognizerWithHandler:block delay:0.0];
}

- (instancetype)ltm_initWithHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))block
{
	return (self = [self ltm_initWithHandler:block delay:0.0]);
}

- (void)ltm_handleAction:(UIGestureRecognizer *)recognizer
{
	void (^handler)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) = recognizer.ltm_handler;
	if (!handler) return;
	
	NSTimeInterval delay = self.ltm_handlerDelay;
	CGPoint location = [self locationInView:self.view];
	void (^block)(void) = ^{
		if (!self.ltm_shouldHandleAction) return;
		handler(self, self.state, location);
	};

	self.ltm_shouldHandleAction = YES;

    [NSObject ltm_performAfterDelay:delay usingBlock:block];
}

- (void)ltm_setHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))handler
{
	objc_setAssociatedObject(self, LTMGestureRecognizerBlockKey, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))ltm_handler
{
	return objc_getAssociatedObject(self, LTMGestureRecognizerBlockKey);
}

- (void)ltm_setHandlerDelay:(NSTimeInterval)delay
{
	NSNumber *delayValue = delay ? @(delay) : nil;
	objc_setAssociatedObject(self, LTMGestureRecognizerDelayKey, delayValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)ltm_handlerDelay
{
	return [objc_getAssociatedObject(self, LTMGestureRecognizerDelayKey) doubleValue];
}

- (void)ltm_setShouldHandleAction:(BOOL)flag
{
	objc_setAssociatedObject(self, LTMGestureRecognizerShouldHandleActionKey, @(flag), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)ltm_shouldHandleAction
{
	return [objc_getAssociatedObject(self, LTMGestureRecognizerShouldHandleActionKey) boolValue];
}

- (void)ltm_cancel
{
	self.ltm_shouldHandleAction = NO;
}

@end
