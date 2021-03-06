//
//  UTKTypeUtility.m
//  UTK
//
//  Created by wangxiaoxiang on 16/5/17.
//  Copyright © 2016年 wangxiaoxiang. All rights reserved.
//

#import "LTMTypeUtility.h"
#import "LTMFoundationDefines.h"

@implementation LTMTypeUtility
#pragma mark - Class Methods

//MARK:object
+ (NSString *)stringValue:(id)object {
    if ([object isKindOfClass:[NSString class]]) {
        return (NSString *)object;
    } else if ([object isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)object stringValue];
    } else if ([object isKindOfClass:[NSURL class]]) {
        return [(NSURL *)object absoluteString];
    } else {
        return nil;
    }
}

+ (NSArray *)arrayValue:(id)object {
    return (NSArray *)[self objectValue:object ofClass:[NSArray class]];
}

+ (NSDictionary *)dictionaryValue:(id)object {
    return (NSDictionary *)[self objectValue:object ofClass:[NSDictionary class]];
}


+ (NSURL *)URLValue:(id)object {
    if ([object isKindOfClass:[NSURL class]]) {
        return (NSURL *)object;
    } else if ([object isKindOfClass:[NSString class]]) {
        return [[NSURL alloc] initWithString:(NSString *)object];
    } else {
        return nil;
    }
}

+ (NSNumber *)numberValue:(id)object{
    if ([object isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)object;
    } else if ([object isKindOfClass:[NSString class]]) {
        //formater
        NSNumberFormatter *numberFormatter= [[NSNumberFormatter alloc] init];
        numberFormatter.numberStyle = NSNumberFormatterNoStyle;
        return [self numberWithString:object formatter:numberFormatter];
    } else {
        return nil;
    }
}

+ (NSNumber *)numberWithString:(NSString *)string formatter:(NSNumberFormatter *)formatter {
    return [formatter numberFromString:string];
}


+ (id)objectValue:(id)object {
    return ([object isKindOfClass:[NSNull class]] ? nil : object);
}

+ (id)objectValue:(id)object ofClass:(Class)expectedClass {
    return [self objectValue:object ofClass:expectedClass defaultValue:nil];
}

+ (id)objectValue:(id)object ofClass:(Class)expectedClass defaultValue:(id)defaultValue {
    return ([object isKindOfClass:expectedClass] ? object : defaultValue);
}


//MARK:char
+ (char)charValue:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)object charValue];
    } else if ([object isKindOfClass:[NSString class]]) {
        return [(NSString *)object intValue];
    } else {
        return 0;
    }
}
+ (unsigned char)unsignedCharValue:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)object unsignedCharValue];
    } else if ([object isKindOfClass:[NSString class]]) {
        int value = [(NSString *)object intValue];
        return value < 0? 0 : value;
    } else {
        return 0;
    }
}


//MARK:short
+ (short)shortValue:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)object shortValue];
    } else if ([object isKindOfClass:[NSString class]]) {
        return [(NSString *)object intValue];
    } else {
        return 0;
    }
}

+ (unsigned short)unsignedShortValue:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)object unsignedShortValue];
    } else if ([object isKindOfClass:[NSString class]]) {
        int value = [(NSString *)object intValue];
        return value < 0? 0 : value;
    } else {
        return 0;
    }
}

//MARK:int
+ (int)intValue:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)object intValue];
    } else if ([object isKindOfClass:[NSString class]]) {
        return [(NSString *)object intValue];
    } else {
        return 0;
    }
}
+ (unsigned int)unsignedIntValue:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)object unsignedIntValue];
    } else if ([object isKindOfClass:[NSString class]]) {
        long long longLongValue = [(NSString *)object longLongValue];
        return longLongValue < 0 ? 0 : (unsigned int)longLongValue;
    } else {
        return 0;
    }
}


//MARK:long
+ (long)longValue:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)object longValue];
    } else if ([object isKindOfClass:[NSString class]]) {
        return [(NSString *)object longLongValue];
    } else {
        return 0;
    }
}

+ (unsigned long)unsignedLongValue:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)object unsignedLongValue];
    } else if ([object isKindOfClass:[NSString class]]) {
        return [(NSString *)object longLongValue];
    } else {
        return 0;
    }
}

//MARK:long long
+ (long long)longLongValue:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)object longLongValue];
    } else if ([object isKindOfClass:[NSString class]]) {
        return [(NSString *)object longLongValue];
    } else {
        return 0;
    }
}
+ (unsigned long long)unsignedLongLongValue:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)object longLongValue];
    } else if ([object isKindOfClass:[NSString class]]) {
        long long longLongValue = [(NSString *)object longLongValue];
        return longLongValue < 0 ? 0 :longLongValue;
    } else {
        return 0;
    }
}

//MARK:double
+ (float)floatValue:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)object floatValue];
    } else if ([object isKindOfClass:[NSString class]]) {
        return [(NSString *)object floatValue];
    } else {
        return 0.f;
    }
}
+ (double)doubleValue:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)object doubleValue];
    } else if ([object isKindOfClass:[NSString class]]) {
        return [(NSString *)object doubleValue];
    } else {
        return 0.f;
    }
}

+ (NSTimeInterval)timeIntervalValue:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)object doubleValue];
    } else if ([object isKindOfClass:[NSString class]]) {
        return [(NSString *)object doubleValue];
    } else {
        return 0;
    }
}

//MARK:integer
+ (NSInteger)integerValue:(id)object
{
    if ([object isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)object integerValue];
    } else if ([object isKindOfClass:[NSString class]]) {
        return [(NSString *)object integerValue];
    } else {
        return 0;
    }
}

+ (NSUInteger)unsignedIntegerValue:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)object unsignedIntegerValue];
    } else {
        // there is no direct support for strings containing unsigned values > NSIntegerMax - not worth writing ourselves
        // right now, so just cap unsigned values at NSIntegerMax until we have a need for larger
        NSInteger integerValue = [self integerValue:object];
        if (integerValue < 0) {
            integerValue = 0;
        }
        return (NSUInteger)integerValue;
    }
}


+ (BOOL)boolValue:(id)object
{
    if ([object isKindOfClass:[NSNumber class]]) {
        // @0 or @NO returns NO, otherwise YES
        return [(NSNumber *)object boolValue];
    } else if ([object isKindOfClass:[NSString class]]) {
        // Returns YES on encountering one of "Y", "y", "T", "t", or a digit 1-9, otherwise NO
        return [(NSString *)object boolValue];
    } else {
        return ([self objectValue:object] != nil);
    }
}


#pragma mark - Object Lifecycle

- (instancetype)init {
    LTM_NO_DESIGNATED_INITIALIZER();
    return nil;
}


@end
