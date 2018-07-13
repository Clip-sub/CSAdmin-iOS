#import <UIKit/UIKit.h>

@interface PostListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    UIActivityIndicatorView *_activityIndicatorView;
    NSArray *_posts;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, retain) NSArray *posts;

@end
