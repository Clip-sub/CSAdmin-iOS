#import "HomeTabViewController.h"
#import "PostListViewController/PostListViewController.h"
#import "LatestCommentsViewController/LatestCommentsViewController.h"

@interface HomeTabViewController ()

@end

@implementation HomeTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Post list VC:
    PostListViewController *postListController = [[PostListViewController alloc] initWithNibName:NSStringFromClass(postListController.class) bundle:nil];
    
    // Blank, placeholder VC:
    UIViewController *blankController = [UIViewController new];
    
    // Latest comments VC:
    LatestCommentsViewController *latestCommentsController = [[LatestCommentsViewController alloc] initWithNibName:NSStringFromClass(LatestCommentsViewController.class) bundle:nil];
    
    [self setViewControllers:[NSArray arrayWithObjects:postListController, blankController, latestCommentsController, nil]];
    
    // Initializing ViewController labels:
    [self initViewControllersLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) initViewControllersLabel {
    NSArray *tabBarItems = self.tabBar.items;
    
    UITabBarItem *leftItem = [tabBarItems objectAtIndex:0];
    leftItem.title = @"Test";
}

- (void)initializeTabBar {
    //UITabBarItem *tabItem1 =
}

@end
