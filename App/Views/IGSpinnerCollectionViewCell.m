#import "IGSpinnerCollectionViewCell.h"

@interface IGSpinnerCollectionViewCell ()
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@end

@implementation IGSpinnerCollectionViewCell

- (instancetype)init {
    if (self = [super init]) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect bounds = self.contentView.bounds;
    self.activityIndicator.center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
}

- (void) setupSubviews {
    [self.contentView addSubview:self.activityIndicator];
}

- (UIActivityIndicatorView *) activityIndicator {
    if (!_activityIndicator) {
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_activityIndicator startAnimating];
    }
    return _activityIndicator;
}

@end
