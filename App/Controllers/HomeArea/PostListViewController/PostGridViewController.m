#import "PostGridViewController.h"
#import <IGListKit/IGListKit.h>
#import "Post.h"

@interface PostGridViewController () <IGListAdapterDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) IGListCollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, copy) NSString *spinObject;
@property (nonatomic, strong) NSMutableArray<Post *> *posts;
@property (nonatomic, assign, getter=isLoading) BOOL loading;

@end

@implementation PostGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) setupUI {
    [self.view addSubview:self.collectionView];
    
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
    self.adapter.scrollViewDelegate = self;
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    NSMutableArray *items = [self.posts mutableCopy];
    if (self.isLoading) {
        [items addObject:self.spinObject];
    }
    return items;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return nil;
}

#pragma mark - Track scrolled-to-end event:
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    CGFloat distance = scrollView.contentSize.height - (targetContentOffset ->y + scrollView.bounds.size.height);
    
    if (!self.isLoading && distance < 200) {
        self.loading = YES;
        [self.adapter performUpdatesAnimated:YES completion:nil];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            sleep(2); // Sleep for 2 seconds.
            dispatch_async(dispatch_get_main_queue(), ^{
                self.loading = NO;
                NSMutableArray *array = [NSMutableArray new];
                for (int i = 1; i < 20; i++) {
                    Post *p = [Post new];
                    p.title.rendered = [@(i) stringValue];
                    [array addObject:p];
                }
                [self.posts addObjectsFromArray:array];
            });
        });
    }
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
        UICollectionViewLayout *layout = [UICollectionViewFlowLayout new];
        
        _collectionView = [[IGListCollectionView alloc] initWithFrame:CGRectZero listCollectionViewLayout:layout];
    }
    return _collectionView;
}

- (NSMutableArray*) posts {
    if (!_posts || _posts.count <= 0) {
        Post *p = [Post new];
        p.title.rendered = @"Test";
        
        _posts = [NSMutableArray new];
        [_posts addObject:p];
    }
    
    return _posts;
}

- (NSString *) spinObject {
    if (!_spinObject) {
        _spinObject = @"";
    }
    return _spinObject;
}

@end
