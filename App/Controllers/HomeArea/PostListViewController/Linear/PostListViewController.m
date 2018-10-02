#import "PostListViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

#import "PostItemTableCell.h"
#import "ApiClient+Post.h"
#import "Post.h"

#import "NSString+HTML.h"

// #import "CSAdmin-Swift.h"

@interface PostListViewController ()

@end

@implementation PostListViewController
{
}

@synthesize activityIndicatorView = _activityIndicatorView, posts = _posts;

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Initializing Data Source
    self.posts = [[NSArray alloc] init];
    // Setting up Table View
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"PostItemTableCell" bundle:nil] forCellReuseIdentifier:@"PostItemTableCell"];

    // Setting up Activity Indicator View
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.activityIndicatorView.hidesWhenStopped = YES;
    self.activityIndicatorView.center = self.view.center;

    [self.view addSubview:self.activityIndicatorView];
    [self.activityIndicatorView startAnimating];

    // Fetch data
    [[ApiClient sharedClient] getLatestPosts:@1 perPage:@3 success:^(NSArray *postArray) {
        self.posts = [Post arrayOfModelsFromDictionaries:postArray error:nil];

        [self.activityIndicatorView stopAnimating];
        [self.tableView setHidden:NO];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
        [self.activityIndicatorView stopAnimating];
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PostItemTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostItemTableCell"];

    Post *post = [self.posts objectAtIndex:indexPath.row];
    cell.postTitle.text = post.title;
    cell.postExcerpt.text = [[post.excerpt stringByConvertingHTMLToPlainText] substringToIndex:24];

    NSURL *url = [[NSURL alloc] initWithString:@"https://media.discordapp.net/attachments/452300203144511491/481174613682815005/unknown.png?width=800&height=450"];
    [cell.thumbnailImageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"Placeholder"]];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

@end
