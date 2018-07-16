#import "PostListViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "PostItemTableCell.h"

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
    NSURL *url = [[NSURL alloc] initWithString:@"http://itunes.apple.com/search?term=doraemon&country=sg&entity=movie"];
    AFHTTPSessionManager *operation = [AFHTTPSessionManager manager];
    [operation GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // NSLog(@"JSON %@", responseObject);
        
        if ([responseObject isKindOfClass:[NSArray class]]) {
            NSLog(@"This is a array!!");
        }
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSLog(@"This is an object!! %@", [responseObject valueForKeyPath:@"resultCount"]);
            
            self.posts = [responseObject objectForKey:@"results"];
            [self.activityIndicatorView stopAnimating];
            [self.tableView setHidden:NO];
            [self.tableView reloadData];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error %@", error);
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PostItemTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostItemTableCell"];
    
    NSDictionary *post = [self.posts objectAtIndex:indexPath.row];
    cell.postTitle.text = [post objectForKey:@"trackName"];
    cell.postExcerpt.text = [post objectForKey:@"artistName"];
    
    NSURL *url = [[NSURL alloc] initWithString:[post objectForKey:@"artworkUrl100"]];
    [cell.thumbnailImageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"Placeholder"]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
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
