//
//  SlideNavigationViewController.m
//  slidenavigation
//
//  Created by cdann on 3/14/13.
//  Copyright (c) 2013 cdann. All rights reserved.
//

#import "SlideNavigationViewController.h"
#import "ViewHelpers.h"

@interface SlideNavigationViewController ()

@end

@implementation SlideNavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.cellCount = 2;

    self.cellNib = [UINib nibWithNibName:@"CellView" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:self.cellNib forCellWithReuseIdentifier:@"CellView"];
    
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.collectionView addGestureRecognizer:self.tapRecognizer];
}

- (void)awakeFromNib
{
    // Copy interface builder values for the flow layout
    UICollectionViewFlowLayout* flowLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    SlideNavigationFlowLayout* customLayout = [[SlideNavigationFlowLayout alloc] init];
    customLayout.itemSize                = flowLayout.itemSize;
    customLayout.minimumInteritemSpacing = flowLayout.minimumInteritemSpacing;
    customLayout.minimumLineSpacing      = flowLayout.minimumLineSpacing;
    customLayout.sectionInset            = flowLayout.sectionInset;
    customLayout.scrollDirection         = flowLayout.scrollDirection;
    self.collectionView.collectionViewLayout = customLayout;
}

- (CGSize) cellViewSize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UICollectionViewCell* view = [[self.cellNib instantiateWithOwner:nil options:nil] objectAtIndex:0];
        _cellViewSize = view.frame.size;
    });
 
    return _cellViewSize;
}

- (void) handleTapGesture:(UITapGestureRecognizer*)sender
{
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        CGPoint tapPoint = [sender locationInView:self.collectionView];
        NSIndexPath* cellIndexPath = [self.collectionView indexPathForItemAtPoint:tapPoint];
        if (cellIndexPath != nil)
        {
            // Add a cell
            self.cellCount = self.cellCount + 1;
            NSIndexPath* indexPath = [NSIndexPath indexPathForItem:self.cellCount - 1 inSection:0];
            [self.collectionView performBatchUpdates:^{
                [self.collectionView insertItemsAtIndexPaths:@[ indexPath ]];
            } completion:^(BOOL finished) {
                if (finished)
                {
                    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
                }
            }];
        }
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.cellCount;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellView" forIndexPath:indexPath];
    if (indexPath.item % 2 == 0)
        cell.backgroundColor = [UIColor redColor];
    else
        cell.backgroundColor = [UIColor purpleColor];
        
    return cell;
}

@end
