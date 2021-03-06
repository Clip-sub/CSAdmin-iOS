#import "HomeTabViewController.h"
#import "PostListViewController.h"
#import "LatestCommentsViewController/LatestCommentsViewController.h"
#import "TutorialViewController.h"

#import "PostGridViewController.h"

@interface HomeTabViewController ()

@end

@implementation HomeTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Post list VC:
    /* PostListViewController *postList = [[PostListViewController alloc] initWithNibName:NSStringFromClass(PostListViewController.class) bundle:nil]; */
    
    // Post grid:
    PostGridViewController *postGrid = [PostGridViewController new];

    // Blank, placeholder VC:
    UIViewController *blankController = [UIViewController new];
    
    // Latest comments VC:
    LatestCommentsViewController *latestCommentsController = [[LatestCommentsViewController alloc] initWithNibName:NSStringFromClass(LatestCommentsViewController.class) bundle:nil];
    
    [self setViewControllers:[NSArray arrayWithObjects:postGrid, blankController, latestCommentsController, nil]];
    
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
    leftItem.image = [UIImage imageNamed:@"Home"];
    leftItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    centerItem.image = [UIImage imageNamed:@"Plus"];
    centerItem.imageInsets = UIEdgeInsetsMake(-25, 0, 0, 0);
    
    rightItem.title = @"Comments";
    rightItem.image = [UIImage imageNamed:@"Comment"];
    rightItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)initializeTabBar {
    //UITabBarItem *tabItem1 =
}

@end
