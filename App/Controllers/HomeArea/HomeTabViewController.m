#import "HomeTabViewController.h"
#import "PostListViewController/PostListViewController.h"
#import "LatestCommentsViewController/LatestCommentsViewController.h"

@interface HomeTabViewController ()

@end

@implementation HomeTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    PostListViewController *postListController = [[PostListViewController alloc] init];

    LatestCommentsViewController *latestCommentsController = [[LatestCommentsViewController alloc] initWithNibName:NSStringFromClass(LatestCommentsViewController.class) bundle:nil];
    
    [self setViewControllers:[NSArray arrayWithObjects:postListController, latestCommentsController, nil]];
    
    // Initializing ViewController labels:
    [self initViewControllersLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) initViewControllersLabel {
    NSArray *controllers = self.viewControllers;
    
    [[controllers objectAtIndex:0] setTitle:@"Home"];
    [[controllers objectAtIndex:1] setTitle:@"Comments"];
    
    // NSArray *tabBarItems = self.tabBar.items;
    // [[tabBarItems objectAtIndex:0] setImage:[UIImage imageNamed:@"Firis.png"]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
