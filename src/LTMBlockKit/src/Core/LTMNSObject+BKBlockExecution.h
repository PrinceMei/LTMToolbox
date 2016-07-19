//
//  LTMNSObject+BKBlockExecution.h
//  BlocksKit
//

#import "LTMDefines.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef __nonnull id <NSObject, NSCopying> BKCancellationToken;

/** Block execution on *any* object.

 This category overhauls the `performSelector:` utilities on
 NSObject to instead use blocks.  Not only are the blocks performed
 extremely speedily, thread-safely, and asynchronously using
 Grand Central Dispatch, but each convenience method also returns
 a pointer that can be used to cancel the execution before it happens!

 Includes code by the following:

 - [Peter Steinberger](https://github.com/steipete)
 - [Zach Waldowski](https://github.com/zwaldowski)

 */
@interface NSObject (LTMNSObjectBlockExecutionAdditions)

/** Executes a block after a given delay on the reciever.

 @warning *Important:* Use of the **self** reference in a block is discouraged.
 The block argument @c obj should be used instead.

 @param delay A measure in seconds.
 @param block A single-argument code block, where @c obj is the reciever.
 @return An opaque, temporary token that may be used to cancel execution.
 */
- (BKCancellationToken)ltm_performAfterDelay:(NSTimeInterval)delay usingBlock:(void (^)(id obj))block;

/** Executes a block after a given delay.
 
 @see ltm_performAfterDelay:usingBlock:
 @param delay A measure in seconds.
 @param block A code block.
 @return An opaque, temporary token that may be used to cancel execution.
 */
+ (BKCancellationToken)ltm_performAfterDelay:(NSTimeInterval)delay usingBlock:(void (^)(void))block;


/** Executes a block in the background after a given delay on the receiver.
 
 This method is functionally identical to @c -ltm_performAfterDelay:usingBlock:
 except the block will be performed on a background queue.
 
 @warning *Important:* Use of the **self** reference in a block is discouraged.
 The block argument @c obj should be used instead.
 
 @see ltm_performAfterDelay:usingBlock:
 @param delay A measure in seconds.
 @param block A single-argument code block, where @c obj is the reciever.
 @return An opaque, temporary token that may be used to cancel execution.
 */
- (BKCancellationToken)ltm_performInBackgroundAfterDelay:(NSTimeInterval)delay usingBlock:(void (^)(id obj))block;

/** Executes a block in the background after a given delay.
 
 This method is functionally identical to @c +ltm_performAfterDelay:usingBlock:
 except the block will be performed on a background queue.
 
 @see ltm_performAfterDelay:usingBlock:
 @param delay A measure in seconds.
 @param block A code block.
 @return An opaque, temporary token that may be used to cancel execution.
 */
+ (BKCancellationToken)ltm_performInBackgroundAfterDelay:(NSTimeInterval)delay usingBlock:(void (^)(void))block;

/** Executes a block in the background after a given delay.
 
 This method is functionally identical to @c -ltm_performAfterDelay:usingBlock:
 except the block will be performed on a background queue.
 
 @warning *Important:* Use of the **self** reference in a block is discouraged.
 The block argument @c obj should be used instead.
 
 @see ltm_performAfterDelay:usingBlock:
 @param queue A background queue.
 @param delay A measure in seconds.
 @param block A single-argument code block, where @c obj is the reciever.
 @return An opaque, temporary token that may be used to cancel execution.
 */
- (BKCancellationToken)ltm_performOnQueue:(dispatch_queue_t)queue afterDelay:(NSTimeInterval)delay usingBlock:(void (^)(id obj))block;

/** Executes a block in the background after a given delay.
 
 This method is functionally identical to @c +ltm_performAfterDelay:usingBlock:
 except the block will be performed on a background queue.
 
 @see ltm_performAfterDelay:usingBlock:
 @param queue A background queue.
 @param delay A measure in seconds.
 @param block A code block.
 @return An opaque, temporary token that may be used to cancel execution.
 */
+ (BKCancellationToken)ltm_performOnQueue:(dispatch_queue_t)queue afterDelay:(NSTimeInterval)delay usingBlock:(void (^)(void))block;

/** Cancels the potential execution of a block.
 
 @warning *Important:* It is not recommended to cancel a block executed
 with a delay of @c 0.
 
 @param token A cancellation token, as returned from one of the `ltm_perform`
 methods.
 */
+ (void)ltm_cancelBlock:(BKCancellationToken)token;

@end

@interface NSObject (LTMNSObjectBlockExecutionAdditions_Deprecated)

- (BKCancellationToken)ltm_performBlock:(void (^)(id obj))block afterDelay:(NSTimeInterval)delay DEPRECATED_MSG_ATTRIBUTE("Replaced with -ltm_performAfterDelay:usingBlock:");
+ (BKCancellationToken)ltm_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay DEPRECATED_MSG_ATTRIBUTE("Replaced with +ltm_performAfterDelay:usingBlock:");
- (BKCancellationToken)ltm_performBlockInBackground:(void (^)(id obj))block afterDelay:(NSTimeInterval)delay DEPRECATED_MSG_ATTRIBUTE("Replaced with -ltm_performInBackgroundAfterDelay:usingBlock:");
+ (BKCancellationToken)ltm_performBlockInBackground:(void (^)(void))block afterDelay:(NSTimeInterval)delay DEPRECATED_MSG_ATTRIBUTE("Replaced with +ltm_performInBackgroundAfterDelay:usingBlock:");
+ (BKCancellationToken)ltm_performBlock:(void (^)(void))block onQueue:(dispatch_queue_t)queue afterDelay:(NSTimeInterval)delay DEPRECATED_MSG_ATTRIBUTE("Replaced with -ltm_performOnQueue:afterDelay:usingBlock:");
- (BKCancellationToken)ltm_performBlock:(void (^)(id obj))block onQueue:(dispatch_queue_t)queue afterDelay:(NSTimeInterval)delay DEPRECATED_MSG_ATTRIBUTE("Replaced with -ltm_performOnQueue:afterDelay:usingBlock:");

@end

NS_ASSUME_NONNULL_END
