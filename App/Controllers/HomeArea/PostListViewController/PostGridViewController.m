#import "PostGridViewController.h"
#import <IGListKit/IGListKit.h>
#import "Post.h"

@interface PostGridViewController () <IGListAdapterDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) IGListCollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, copy) NSString *spinObject;
@property (nonatomic, weak) NSMutableArray<Post *> *posts;
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

- (IGListCollectionView *) collectionView {
    if (!_collectionView) {
        
    }
    return NULL;
}

@end
