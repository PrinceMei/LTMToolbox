//
//  LTMUIDeviceUtilityTests.m
//  LTMToolbox
//
//  Created by zhiwei wang on 16/7/19.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LTMUIDeviceUtility.h"
#include <sys/sysctl.h>

@interface LTMUIDeviceUtilityTests : XCTestCase

@end

@implementation LTMUIDeviceUtilityTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    BOOL padTmp = [LTMUIDeviceUtility isPad] == (([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)] ?
                                               [[UIDevice currentDevice] userInterfaceIdiom] :
                                               UIUserInterfaceIdiomPhone));
    XCTAssertTrue(padTmp);
    
    
    BOOL simulatorTmp = [LTMUIDeviceUtility isSimulator] ==  (NSNotFound != [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location);
    XCTAssertTrue(simulatorTmp);
    
    BOOL canMakePhoneCallsTmp = [LTMUIDeviceUtility canMakePhoneCalls] == [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]];
    XCTAssertTrue(canMakePhoneCallsTmp);
    
    {
        NSString *model;
        size_t size;
        sysctlbyname("hw.machine", NULL, &size, NULL, 0);
        char *machine = malloc(size);
        sysctlbyname("hw.machine", machine, &size, NULL, 0);
        model = [NSString stringWithUTF8String:machine];
        free(machine);
        BOOL machineTmp = [[LTMUIDeviceUtility machineModel] isEqualToString:model];
        XCTAssertTrue(machineTmp);
        
        if (machineTmp) {
            NSString *name;
            if ([model isEqualToString:@"iPhone1,1"]) name = @"iPhone 1G";
            else if ([model isEqualToString:@"iPhone1,2"]) name = @"iPhone 3G";
            else if ([model isEqualToString:@"iPhone2,1"]) name = @"iPhone 3GS";
            else if ([model isEqualToString:@"iPhone3,1"]) name = @"iPhone 4 (GSM)";
            else if ([model isEqualToString:@"iPhone3,2"]) name = @"iPhone 4";
            else if ([model isEqualToString:@"iPhone3,3"]) name = @"iPhone 4 (CDMA)";
            else if ([model isEqualToString:@"iPhone4,1"]) name = @"iPhone 4S";
            else if ([model isEqualToString:@"iPhone5,1"]) name = @"iPhone 5";
            else if ([model isEqualToString:@"iPhone5,2"]) name = @"iPhone 5";
            else if ([model isEqualToString:@"iPhone5,3"]) name = @"iPhone 5c";
            else if ([model isEqualToString:@"iPhone5,4"]) name = @"iPhone 5c";
            else if ([model isEqualToString:@"iPhone6,1"]) name = @"iPhone 5s";
            else if ([model isEqualToString:@"iPhone6,2"]) name = @"iPhone 5s";
            else if ([model isEqualToString:@"iPhone7,1"]) name = @"iPhone 6 Plus";
            else if ([model isEqualToString:@"iPhone7,2"]) name = @"iPhone 6";
            
            else if ([model isEqualToString:@"iPod1,1"]) name = @"iPod 1";
            else if ([model isEqualToString:@"iPod2,1"]) name = @"iPod 2";
            else if ([model isEqualToString:@"iPod3,1"]) name = @"iPod 3";
            else if ([model isEqualToString:@"iPod4,1"]) name = @"iPod 4";
            else if ([model isEqualToString:@"iPod5,1"]) name = @"iPod 5";
            
            else if ([model isEqualToString:@"iPad1,1"]) name = @"iPad 1";
            else if ([model isEqualToString:@"iPad2,1"]) name = @"iPad 2 (WiFi)";
            else if ([model isEqualToString:@"iPad2,2"]) name = @"iPad 2 (GSM)";
            else if ([model isEqualToString:@"iPad2,3"]) name = @"iPad 2 (CDMA)";
            else if ([model isEqualToString:@"iPad2,4"]) name = @"iPad 2";
            else if ([model isEqualToString:@"iPad2,5"]) name = @"iPad mini 1";
            else if ([model isEqualToString:@"iPad2,6"]) name = @"iPad mini 1";
            else if ([model isEqualToString:@"iPad2,7"]) name = @"iPad mini 1";
            else if ([model isEqualToString:@"iPad3,1"]) name = @"iPad 3 (WiFi)";
            else if ([model isEqualToString:@"iPad3,2"]) name = @"iPad 3 (4G)";
            else if ([model isEqualToString:@"iPad3,3"]) name = @"iPad 3 (4G)";
            else if ([model isEqualToString:@"iPad3,4"]) name = @"iPad 4";
            else if ([model isEqualToString:@"iPad3,5"]) name = @"iPad 4";
            else if ([model isEqualToString:@"iPad3,6"]) name = @"iPad 4";
            else if ([model isEqualToString:@"iPad4,1"]) name = @"iPad Air";
            else if ([model isEqualToString:@"iPad4,2"]) name = @"iPad Air";
            else if ([model isEqualToString:@"iPad4,3"]) name = @"iPad Air";
            else if ([model isEqualToString:@"iPad4,4"]) name = @"iPad mini 2";
            else if ([model isEqualToString:@"iPad4,5"]) name = @"iPad mini 2";
            else if ([model isEqualToString:@"iPad4,6"]) name = @"iPad mini 2";
            else if ([model isEqualToString:@"iPad4,7"]) name = @"iPad mini 3";
            else if ([model isEqualToString:@"iPad4,8"]) name = @"iPad mini 3";
            else if ([model isEqualToString:@"iPad4,9"]) name = @"iPad mini 3";
            else if ([model isEqualToString:@"iPad5,3"]) name = @"iPad Air 2";
            else if ([model isEqualToString:@"iPad5,4"]) name = @"iPad Air 2";
            
            else if ([model isEqualToString:@"i386"]) name = @"Simulator x86";
            else if ([model isEqualToString:@"x86_64"]) name = @"Simulator x64";
            else name = model;
            
            XCTAssertTrue([name isEqualToString:[LTMUIDeviceUtility machineModelName]]);
        }
    }
    
    CGSize scSize = [LTMUIDeviceUtility screenSize];
    XCTAssertTrue((scSize.width >= 320) && (scSize.height >= 480));
    

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
