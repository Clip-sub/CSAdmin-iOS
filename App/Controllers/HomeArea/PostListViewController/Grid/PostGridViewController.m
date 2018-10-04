#import "PostGridViewController.h"
#import <IGListKit/IGListKit.h>
#import "Post.h"
#import "IGSpinnerCell.h"
#import "PostListSectionController.h"

#import "ApiClient+Post.h"

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
    
    _posts = [NSMutableArray array];
    
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
    self.adapter.scrollViewDelegate = self;
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    NSMutableArray *items = [_posts mutableCopy];
    if (self.isLoading) {
        [items addObject:self.spinObject];
    }
    return items;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
//    if ([object isEqualToString:self.spinObject]) {
//        // If the loading indicator is visible:
//        IGListSingleSectionCellConfigureBlock configureBlock = ^(id item, UICollectionViewCell *cell) {};
//        IGListSingleSectionCellSizeBlock sizeBlock = ^CGSize(id item, id<IGListCollectionContext> context) {
//            return CGSizeMake(context.containerSize.width, 150);
//        };
//
//        return [[IGListSingleSectionController alloc] initWithCellClass:[IGSpinnerCell class] configureBlock:configureBlock sizeBlock:sizeBlock];
//    } else {
//        return [PostListSectionController new];
//    }
    
    return [PostListSectionController new];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

#pragma mark - Track scrolled-to-end event:
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    CGFloat distance = scrollView.contentSize.height - (targetContentOffset ->y + scrollView.bounds.size.height);
    
    if (!self.isLoading && distance < 200) {
        self.loading = YES;
        [self.adapter performUpdatesAnimated:YES completion:nil];
        
        /*dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            sleep(2); // Sleep for 2 seconds.
            dispatch_async(dispatch_get_main_queue(), ^{
                self.loading = NO;
                NSMutableArray *array = [NSMutableArray new];
                for (int i = 1; i < 20; i++) {
                    Post *p = [Post new];
                    p.status = @"Status";
                    p.author = @12;
                    // p.title.rendered = @"ho";
                    p.link = @"Test";
                    p.date = [NSDate date];
                    // p.title.rendered = [@(i) stringValue];
                    [array addObject:p];
                }
                [self.posts addObjectsFromArray:array];
            });
        });*/
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
        UICollectionViewLayout *layout = [[UICollectionViewFlowLayout alloc] init];
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
