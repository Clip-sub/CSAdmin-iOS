#import "PostGridViewController.h"
#import "Post.h"
#import "CustomItemFlowLayout.h"

#import "ApiClient+Post.h"
#import "PostItemCollectionViewCell.h"

@interface PostGridViewController () <UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray<Post *> *posts;
@property (nonatomic, assign, getter=isLoading) BOOL loading;

@end

@implementation PostGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _posts = [NSMutableArray array];
    [[ApiClient sharedClient] getLatestPosts:@1 perPage:@99 success:^(NSArray *postArray) {
        NSLog(@"Loaded");
        [self->_posts addObjectsFromArray:[Post arrayOfModelsFromDictionaries:postArray error:nil]];
        [self.view addSubview:self.collectionView];
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.dataSource = self;
    self.collectionView.frame = self.view.bounds;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"PostItemCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PostItem"];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PostItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PostItem" forIndexPath:indexPath];

    cell.postTitle.text = [NSString stringWithFormat:@"P %ld", (long)indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_posts count];
}

#pragma mark - Custom Collection View.

- (UICollectionView *) collectionView {
    if (!_collectionView) {
        CustomItemFlowLayout *layout = [CustomItemFlowLayout new];

        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    }
    return _collectionView;
}

@end
