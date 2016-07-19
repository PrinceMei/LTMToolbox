//
//  LTMUIControl+BlocksKit.m
//  LTMBlocksKit
//

#import "LTMUIControl+BlocksKit.h"
@import ObjectiveC.runtime;

static const void *LTMControlHandlersKey = &LTMControlHandlersKey;

#pragma mark Private

@interface LTMControlWrapper : NSObject <NSCopying>

- (id)initWithHandler:(void (^)(id sender))handler forControlEvents:(UIControlEvents)controlEvents;

@property (nonatomic) UIControlEvents controlEvents;
@property (nonatomic, copy) void (^handler)(id sender);

@end

@implementation LTMControlWrapper

- (id)initWithHandler:(void (^)(id sender))handler forControlEvents:(UIControlEvents)controlEvents
{
	self = [super init];
	if (!self) return nil;

	self.handler = handler;
	self.controlEvents = controlEvents;

	return self;
}

- (id)copyWithZone:(NSZone *)zone
{
	return [[LTMControlWrapper alloc] initWithHandler:self.handler forControlEvents:self.controlEvents];
}

- (void)invoke:(id)sender
{
	self.handler(sender);
}

@end

#pragma mark Category

@implementation UIControl (LTMUIControlBlocksAdditions)

- (void)ltm_addEventHandler:(void (^)(id sender))handler forControlEvents:(UIControlEvents)controlEvents
{
	NSParameterAssert(handler);
	
	NSMutableDictionary *events = objc_getAssociatedObject(self, LTMControlHandlersKey);
	if (!events) {
		events = [NSMutableDictionary dictionary];
		objc_setAssociatedObject(self, LTMControlHandlersKey, events, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}

	NSNumber *key = @(controlEvents);
	NSMutableSet *handlers = events[key];
	if (!handlers) {
		handlers = [NSMutableSet set];
		events[key] = handlers;
	}
	
	LTMControlWrapper *target = [[LTMControlWrapper alloc] initWithHandler:handler forControlEvents:controlEvents];
	[handlers addObject:target];
	[self addTarget:target action:@selector(invoke:) forControlEvents:controlEvents];
}

- (void)ltm_removeEventHandlersForControlEvents:(UIControlEvents)controlEvents
{
	NSMutableDictionary *events = objc_getAssociatedObject(self, LTMControlHandlersKey);
	if (!events) {
		events = [NSMutableDictionary dictionary];
		objc_setAssociatedObject(self, LTMControlHandlersKey, events, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}

	NSNumber *key = @(controlEvents);
	NSSet *handlers = events[key];

	if (!handlers)
		return;

	[handlers enumerateObjectsUsingBlock:^(id sender, BOOL *stop) {
		[self removeTarget:sender action:NULL forControlEvents:controlEvents];
	}];

	[events removeObjectForKey:key];
}

- (BOOL)ltm_hasEventHandlersForControlEvents:(UIControlEvents)controlEvents
{
	NSMutableDictionary *events = objc_getAssociatedObject(self, LTMControlHandlersKey);
	if (!events) {
		events = [NSMutableDictionary dictionary];
		objc_setAssociatedObject(self, LTMControlHandlersKey, events, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}

	NSNumber *key = @(controlEvents);
	NSSet *handlers = events[key];
	
	if (!handlers)
		return NO;
	
	return !!handlers.count;
}

@end
