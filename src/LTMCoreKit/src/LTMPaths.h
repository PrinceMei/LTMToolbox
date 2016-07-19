//
//  LFPath.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/6/30.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <Foundation/Foundation.h>

#if defined __cplusplus
extern "C" {
#endif
    
    /**
     * Create a path with the documents directory and the relative path appended.
     *
     * @returns The documents path concatenated with the given relative path.
     */
    NSString* LFPathForDocumentsResource(NSString* relativePath);
    
    /**
     * Create a path with the Library directory and the relative path appended.
     *
     * @returns The Library path concatenated with the given relative path.
     */
    NSString* LFPathForLibraryResource(NSString* relativePath);
    
    /**
     * Create a path with the caches directory and the relative path appended.
     *
     * @returns The caches path concatenated with the given relative path.
     */
    NSString* LFPathForCachesResource(NSString* relativePath);
    
#if defined __cplusplus
};
#endif

/**@}*/// End of Paths ////////////////////////////////////////////////////////////////////////////

