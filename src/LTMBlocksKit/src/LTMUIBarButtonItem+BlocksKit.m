//
//  LTMUIBarButtonItem+BlocksKit.m
//  LTMBlocksKit
//

#import "LTMUIBarButtonItem+BlocksKit.h"
@import ObjectiveC.runtime;

static const void *LTMBarButtonItemBlockKey = &LTMBarButtonItemBlockKey;

@interface UIBarButtonItem (LTMUIBarButtonItemBlocksAdditionPrivate)

- (void)ltm_handleAction:(UIBarButtonItem *)sender;

@end

@implementation UIBarButtonItem (LTMUIBarButtonItemBlocksAdditions)

- (instancetype)ltm_initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem handler:(void (^)(id sender))action
{
	self = [self initWithBarButtonSystemItem:systemItem target:self action:@selector(ltm_handleAction:)];
	if (!self) return nil;

	objc_setAssociatedObject(self, LTMBarButtonItemBlockKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);

	return self;
}

- (instancetype)ltm_initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style handler:(void (^)(id sender))action
{
	self = [self initWithImage:image style:style target:self action:@selector(ltm_handleAction:)];
	if (!self) return nil;

	objc_setAssociatedObject(self, LTMBarButtonItemBlockKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);

	return self;
}

- (instancetype)ltm_initWithImage:(UIImage *)image landscapeImagePhone:(UIImage *)landscapeImagePhone style:(UIBarButtonItemStyle)style handler:(void (^)(id sender))action
{
	self = [self initWithImage:image landscapeImagePhone:landscapeImagePhone style:style target:self action:@selector(ltm_handleAction:)];
	if (!self) return nil;

	objc_setAssociatedObject(self, LTMBarButtonItemBlockKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);

	return self;
}

- (instancetype)ltm_initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style handler:(void (^)(id sender))action
{
	self = [self initWithTitle:title style:style target:self action:@selector(ltm_handleAction:)];
	if (!self) return nil;

	objc_setAssociatedObject(self, LTMBarButtonItemBlockKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);

	return self;
}

- (void)ltm_handleAction:(UIBarButtonItem *)sender
{
	void (^block)(id) = objc_getAssociatedObject(self, LTMBarButtonItemBlockKey);
	if (block) block(sender);
}

@end
