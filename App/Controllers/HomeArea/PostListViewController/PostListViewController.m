#import "PostListViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

#import "PostItemTableCell.h"
#import "ApiClient+Post.h"
#import "Post.h"

@interface PostListViewController ()

@end

@implementation PostListViewController {
    
}

@synthesize activityIndicatorView = _activityIndicatorView, posts = _posts;

- (void)viewDidLoad {
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
    [[ApiClient sharedClient] getLatestPosts:@1 perPage:@10 success:^(NSArray *postArray) {
        // Code
        NSLog(@"%@", postArray);
        
        self.posts = [Post arrayOfModelsFromDictionaries:postArray error:nil];
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    /*AFHTTPSessionManager *operation = [AFHTTPSessionManager manager];
    [operation GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.posts = [responseObject objectForKey:@"results"];
        [self.activityIndicatorView stopAnimating];
        [self.tableView setHidden:NO];
        [self.tableView reloadData];
        if ([responseObject isKindOfClass:[NSArray class]]) {
            NSLog(@"This is a array!!");
        }

        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSLog(@"This is an object!! %@", [responseObject valueForKeyPath:@"resultCount"]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error %@", error);
    }];*/
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PostItemTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostItemTableCell"];
    
    Post *post = [self.posts objectAtIndex:indexPath.row];
    cell.postTitle.text = post.title.rendered;
    cell.postExcerpt.text = post.excerpt.rendered;
    
    // NSURL *url = [[NSURL alloc] initWithString:[post objectForKey:@"artworkUrl100"]];
    // [cell.thumbnailImageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"Placeholder"]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

@end
