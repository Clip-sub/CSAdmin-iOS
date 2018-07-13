#import "PageItemController.h"

@interface PageItemController ()

@end

@implementation PageItemController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.screenLabel.text = [self getScreenTitle:self.index];
}

- (NSString *) getScreenTitle: (long) index {
    switch (index) {
        case 0:
            return [NSString stringWithFormat:@"%@ \n %@", @"New and", @"Revamped Interface"];
        case 1:
            return @"Built-in Wordpress Editor";
        case 2:
            return @"Secured and outsmarted";
        case 3:
            return @"Manage posts, on the go";
        default:
            return @"Manage posts, on the go";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
