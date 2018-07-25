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
    UITabBarItem *centerItem = [tabBarItems objectAtIndex:1];
    UITabBarItem *rightItem = [tabBarItems objectAtIndex:2];

    leftItem.title = @"Test";
    leftItem.image = [UIImage imageNamed:@"Heart"];
    leftItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    

    centerItem.image = [UIImage imageNamed:@"Plus"];
    centerItem.imageInsets = UIEdgeInsetsMake(-25, 0, 0, 0);
    
    rightItem.title = @"Comments";
}

- (void)initializeTabBar {
    //UITabBarItem *tabItem1 =
}

@end
