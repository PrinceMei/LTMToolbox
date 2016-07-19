/*!
 @header
 @abstract
 @discussion	像UITableviewCell 提供复用机制
 @author	wangzhiwei
 @copyright	youku
 @version	1.0 2016-06-30 14:46:33 Creation
 */

#import <UIKit/UIKit.h>

/**
 * For recycling views in scroll views.
 *
 *
 * View recycling is an important aspect of iOS memory management and performance when building
 * scroll views. UITableView uses view recycling via the table cell dequeue mechanism.
 * LFViewRecycler implements this recycling functionality, allowing you to implement recycling
 * mechanisms in your own views and controllers.
 *
 *
 * <h2>Example Use</h2>
 *
 * Imagine building a UITableView. We'll assume that a viewRecycler object exists in the view.
 *
 * Views are usually recycled once they are no longer on screen, so within a did scroll event
 * we might have code like the following:
 *
 @code
 for (UIView<LFRecyclableView>* view in visibleViews) {
 if (![self isVisible:view]) {
 [viewRecycler recycleView:view];
 [view removeFromSuperview];
 }
 }
 @endcode
 *
 * This will take the views that are no longer visible and add them to the recycler. At a later
 * point in that same didScroll code we will check if there are any new views that are visible.
 * This is when we try to dequeue a recycled view from the recycler.
 *
 @code
 UIView<LFRecyclableView>* view = [viewRecycler dequeueReusableViewWithIdentifier:reuseIdentifier];
 if (nil == view) {
 // Allocate a new view that conforms to the LFRecyclableView protocol.
 view = [[[...]] autorelease];
 }
 [self addSubview:view];
 @endcode
 *
 */



/**
 * The LFRecyclableView protocol defines a set of optional methods that a view may implement to
 * handle being added to a LFViewRecycler.
 */
@protocol LFRecyclableView <NSObject>

@optional

/**
 * The identifier used to categorize views into buckets for reuse.
 *
 * Views will be reused when a new view is requested with a matching identifier.
 *
 * If the reuseIdentifier is nil then the class name will be used.
 */
@property (nonatomic, copy) NSString* reuseIdentifier;

/**
 * Called immediately after the view has been dequeued from the recycled view pool.
 */
- (void)prepareForReuse;

@end


/**
 * An object for efficiently reusing views by recycling and dequeuing them from a pool of views.
 *
 * This sort of object is likely what UITableView and LFPagingScrollView use to recycle their views.
 */
@interface LTMViewRecycler : NSObject


- (UIView<LFRecyclableView> *)dequeueReusableViewWithIdentifier:(NSString *)reuseIdentifier;

- (void)recycleView:(UIView<LFRecyclableView> *)view;

- (void)removeAllViews;

@end
