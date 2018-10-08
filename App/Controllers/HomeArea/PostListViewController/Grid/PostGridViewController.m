#import "PostGridViewController.h"
#import <IGListKit/IGListKit.h>
#import "Post.h"
#import "IGSpinnerCell.h"
#import "PostListSectionController.h"

#import "CustomItemFlowLayout.h"

#import "ApiClient+Post.h"

@interface PostGridViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) IGListCollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, copy) NSString *spinObject;
@property (nonatomic, strong) NSMutableArray<Post *> *posts;
@property (nonatomic, assign, getter=isLoading) BOOL loading;

@end

@implementation PostGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.posts = [NSMutableArray array];
    [[ApiClient sharedClient] getLatestPosts:@1 perPage:@10 success:^(NSArray *postArray) {
        // = [Post arrayOfModelsFromDictionaries:postArray error:nil];
        [self->_posts addObjectsFromArray:[Post arrayOfModelsFromDictionaries:postArray error:nil]];

        [self setupUI];
        
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (void) setupUI {
    [self.view addSubview:self.collectionView];
    
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    NSMutableArray *items = [_posts mutableCopy];
    
    NSLog(@"Number of items: %lu", (unsigned long)[items count]);
    
    return items;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {

    return [[PostListSectionController alloc] initWithItems:self.posts];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self workingRangeSize:0];
    }
    
    return _adapter;
}

#pragma mark - Custom Collection View.

- (IGListCollectionView *) collectionView {
    if (!_collectionView) {
        CustomItemFlowLayout *layout = [[CustomItemFlowLayout alloc] initWithStickyHeaders:NO topContentInset:0 stretchToEdge:YES];

        _collectionView = [[IGListCollectionView alloc] initWithFrame:CGRectZero listCollectionViewLayout:layout];
    }
    return _collectionView;
}

- (NSString *) spinObject {
    if (!_spinObject) {
        _spinObject = @"";
    }
    return _spinObject;
}

@end
