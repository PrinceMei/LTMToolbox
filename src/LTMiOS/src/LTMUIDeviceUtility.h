//
//  LFUIDeviceUtils.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/12.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^ cameraAuthorziedBlock) (void);

@interface LTMUIDeviceUtility : NSObject

+ (BOOL)isPad;

+ (BOOL)isSimulator;

+ (BOOL)canMakePhoneCalls;

+ (NSString *)machineModel;

+ (NSString *)machineModelName;

+ (CGSize)screenSize;

+ (CGFloat)systemVersionByFloat;

+ (int64_t)diskSpace;

+ (int64_t)diskSpaceFree;

+ (int64_t)diskSpaceUsed;

+ (int64_t)memoryTotal;

+ (int64_t)memoryUsed;

+ (int64_t)memoryFree;

+ (int64_t)memoryActive;

+ (int64_t)memoryInactive;

+ (int64_t)memoryWired;

+ (int64_t)memoryPurgable;

+ (NSString*)cpuType;

+ (NSString *)cpuSubtype;

+ (BOOL)systemVersionLowerThan:(NSString *)version;

+ (BOOL)systemVersionHigherThan:(NSString *)version;

+ (BOOL)isJailbroken;

+ (void)cameraAuthorzied:(cameraAuthorziedBlock)authorizedBlock notAuthorized:(cameraAuthorziedBlock)notAuthorizedlock;

+ (NSString*)deviceID;
@end
