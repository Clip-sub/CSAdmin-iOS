#import "PostGridViewController.h"
#import <IGListKit/IGListKit.h>
#import "Post.h"
#import "PostListSectionController.h"
#import "PostItemCollectionViewCell.h"
#import "CustomFlowLayout.h"

#import "ApiClient+Post.h"

@interface PostGridViewController () <UICollectionViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray<Post *> *posts;
@property (nonatomic, assign, getter=isLoading) BOOL loading;

@end

@implementation PostGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _posts = [NSMutableArray array];
    [self.view addSubview:self.collectionView];
    
    [[ApiClient sharedClient] getLatestPosts:@1 perPage:@10 success:^(NSArray *postArray) {
        [self->_posts addObjectsFromArray:[Post arrayOfModelsFromDictionaries:postArray error:nil]];
        
        // [self setupUI];
        
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    return 24.0;
}

- (UICollectionView *) collectionView {
    if (!_collectionView) {
        CustomFlowLayout *layout = [CustomFlowLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    }
    return _collectionView;
}

@end
