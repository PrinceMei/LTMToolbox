//
//  LTMNSObject+A2DynamicDelegate.m
//  BlocksKit
//

#import "LTMNSObject+A2DynamicDelegate.h"
@import ObjectiveC.runtime;
#import "LTMA2DynamicDelegate.h"

extern Protocol *ltm_a2_dataSourceProtocol(Class cls);
extern Protocol *ltm_a2_delegateProtocol(Class cls);

static Class a2_dynamicDelegateClass(Class cls, NSString *suffix)
{
	while (cls) {
		NSString *className = [NSString stringWithFormat:@"LTMA2Dynamic%@%@", NSStringFromClass(cls), suffix];
		Class ddClass = NSClassFromString(className);
		if (ddClass) return ddClass;

		cls = class_getSuperclass(cls);
	}

	return [LTMA2DynamicDelegate class];
}

static dispatch_queue_t a2_backgroundQueue(void)
{
	static dispatch_once_t onceToken;
	static dispatch_queue_t backgroundQueue = nil;
	dispatch_once(&onceToken, ^{
		backgroundQueue = dispatch_queue_create("BlocksKit.DynamicDelegate.Queue", DISPATCH_QUEUE_SERIAL);
	});
	return backgroundQueue;
}

@implementation NSObject (LTMA2DynamicDelegateAdditions)

- (id)ltm_dynamicDataSource
{
	Protocol *protocol = ltm_a2_dataSourceProtocol([self class]);
	Class class = a2_dynamicDelegateClass([self class], @"DataSource");
	return [self ltm_dynamicDelegateWithClass:class forProtocol:protocol];
}
- (id)ltm_dynamicDelegate
{
	Protocol *protocol = ltm_a2_delegateProtocol([self class]);
	Class class = a2_dynamicDelegateClass([self class], @"Delegate");
	return [self ltm_dynamicDelegateWithClass:class forProtocol:protocol];
}
- (id)ltm_dynamicDelegateForProtocol:(Protocol *)protocol
{
	Class class = [LTMA2DynamicDelegate class];
	NSString *protocolName = NSStringFromProtocol(protocol);
	if ([protocolName hasSuffix:@"Delegate"]) {
		class = a2_dynamicDelegateClass([self class], @"Delegate");
	} else if ([protocolName hasSuffix:@"DataSource"]) {
		class = a2_dynamicDelegateClass([self class], @"DataSource");
	}

	return [self ltm_dynamicDelegateWithClass:class forProtocol:protocol];
}
- (id)ltm_dynamicDelegateWithClass:(Class)cls forProtocol:(Protocol *)protocol
{
	/**
	 * Storing the dynamic delegate as an associated object of the delegating
	 * object not only allows us to later retrieve the delegate, but it also
	 * creates a strong relationship to the delegate. Since delegates are weak
	 * references on the part of the delegating object, a dynamic delegate
	 * would be deallocated immediately after its declaring scope ends.
	 * Therefore, this strong relationship is required to ensure that the
	 * delegate's lifetime is at least as long as that of the delegating object.
	 **/

	__block LTMA2DynamicDelegate *dynamicDelegate;

	dispatch_sync(a2_backgroundQueue(), ^{
		dynamicDelegate = objc_getAssociatedObject(self, (__bridge const void *)protocol);

		if (!dynamicDelegate)
		{
			dynamicDelegate = [[cls alloc] initWithProtocol:protocol];
			objc_setAssociatedObject(self, (__bridge const void *)protocol, dynamicDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
		}
	});

	return dynamicDelegate;
}

@end
