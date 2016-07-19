//
//  LFPath.m
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/6/30.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import "LTMPaths.h"

#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "LFCore requires ARC support."
#endif

NSString* LFPathForDocumentsResource(NSString* relativePath) {
    static NSString* documentsPath = nil;
    if (nil == documentsPath) {
        NSArray* dirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                            NSUserDomainMask,
                                                            YES);
        documentsPath = [dirs objectAtIndex:0];
    }
    return [documentsPath stringByAppendingPathComponent:relativePath];
}

NSString* LFPathForLibraryResource(NSString* relativePath) {
    static NSString* libraryPath = nil;
    if (nil == libraryPath) {
        NSArray* dirs = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,
                                                            NSUserDomainMask,
                                                            YES);
        libraryPath = [dirs objectAtIndex:0];
    }
    return [libraryPath stringByAppendingPathComponent:relativePath];
}

NSString* LFPathForCachesResource(NSString* relativePath) {
    static NSString* cachesPath = nil;
    if (nil == cachesPath) {
        NSArray* dirs = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,
                                                            NSUserDomainMask,
                                                            YES);
        cachesPath = [dirs objectAtIndex:0];
    }
    return [cachesPath stringByAppendingPathComponent:relativePath];
}

