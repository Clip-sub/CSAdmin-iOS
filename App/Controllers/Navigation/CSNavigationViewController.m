#import "CSNavigationViewController.h"

@interface CSNavigationViewController ()

@end

@implementation CSNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    // Set translucent navigation bar:
    self.navigationBar.translucent = YES;
}

- (void)changeStyle:(UIImage *)background {
    [self.navigationBar setBarStyle:UIBarStyleDefault];
    
    // iOS 5 new UINavigationBar custom background:
    [self.navigationBar setBackgroundImage:background forBarMetrics:UIBarMetricsDefault];
}

@end
