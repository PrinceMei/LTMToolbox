//
//  LTMUIView+BlocksKit.m
//  LTMBlocksKit
//

#import "LTMUIView+BlocksKit.h"
#import "LTMUIGestureRecognizer+BlocksKit.h"

@implementation UIView (LTMUIViewBlocksAdditions)

- (void)ltm_whenTouches:(NSUInteger)numberOfTouches tapped:(NSUInteger)numberOfTaps handler:(void (^)(void))block
{
	if (!block) return;
	
	UITapGestureRecognizer *gesture = [UITapGestureRecognizer ltm_recognizerWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
		if (state == UIGestureRecognizerStateRecognized) block();
	}];
	
	gesture.numberOfTouchesRequired = numberOfTouches;
	gesture.numberOfTapsRequired = numberOfTaps;

	[self.gestureRecognizers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		if (![obj isKindOfClass:[UITapGestureRecognizer class]]) return;

		UITapGestureRecognizer *tap = obj;
		BOOL rightTouches = (tap.numberOfTouchesRequired == numberOfTouches);
		BOOL rightTaps = (tap.numberOfTapsRequired == numberOfTaps);
		if (rightTouches && rightTaps) {
			[gesture requireGestureRecognizerToFail:tap];
		}
	}];

	[self addGestureRecognizer:gesture];
}

- (void)ltm_whenTapped:(void (^)(void))block
{
	[self ltm_whenTouches:1 tapped:1 handler:block];
}

- (void)ltm_whenDoubleTapped:(void (^)(void))block
{
	[self ltm_whenTouches:1 tapped:2 handler:block];
}

- (void)ltm_eachSubview:(void (^)(UIView *subview))block
{
	NSParameterAssert(block != nil);

	[self.subviews enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger idx, BOOL *stop) {
		block(subview);
	}];
}

@end
