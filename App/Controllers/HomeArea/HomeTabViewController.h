#import <UIKit/UIKit.h>

@interface HomeTabViewController : UITabBarController

@property (strong, nonatomic) IBOutlet UITabBar *tb;

- (void) initViewControllersLabel;

- (void) initializeTabBar;

- (void) customizeTabItems:(UITabBar *) tabBar;

@end
