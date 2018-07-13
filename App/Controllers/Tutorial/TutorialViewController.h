#import <UIKit/UIKit.h>
#import "PageItemController.h"

@interface TutorialViewController : UIViewController <UIPageViewControllerDataSource>

@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) UIPageViewController *pageController;

- (PageItemController *) viewControllerAtIndex: (NSUInteger) index;
- (IBAction)btnEndTutorial:(id)sender;

@end
