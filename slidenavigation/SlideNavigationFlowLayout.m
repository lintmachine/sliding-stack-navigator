//
//  SlideNavigationFlowLayout.m
//  slidenavigation
//
//  Created by cdann on 3/14/13.
//  Copyright (c) 2013 cdann. All rights reserved.
//

#import "SlideNavigationFlowLayout.h"

@implementation SlideNavigationFlowLayout

- (NSArray*) layoutAttributesForElementsInRect:(CGRect)rect
{
    NSInteger numCells = [self.collectionView numberOfItemsInSection:0];
    
    NSMutableArray* layoutAttributes = [NSMutableArray arrayWithCapacity:numCells];
    for (NSInteger i = 0; i < numCells; ++i)
    {
        [layoutAttributes addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]]];
    }
    return layoutAttributes;
}

- (UICollectionViewLayoutAttributes*) layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes* attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    
    [self applyCellStackingTransform:attributes];
    
    return attributes;
}

- (void) applyCellStackingTransform:(UICollectionViewLayoutAttributes*)attributes
{
    CGPoint contentOffset = self.collectionView.contentOffset;
    
    CGFloat leftCellEdge = attributes.center.x - (attributes.size.width / 2);
    
    CGFloat tx = contentOffset.x + (4 * attributes.indexPath.item) - leftCellEdge;
    if (tx > 0.0)
    {
        attributes.transform3D = CATransform3DMakeAffineTransform(CGAffineTransformMakeTranslation(tx, 0.0));
    }
    
    attributes.zIndex = attributes.indexPath.item;
}

- (BOOL) shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat rightEdge = proposedContentOffset.x + self.collectionView.frame.size.width;
    
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
    
    NSArray* layoutAttributes = [super layoutAttributesForElementsInRect:targetRect];
    
    for (UICollectionViewLayoutAttributes* attributes in layoutAttributes)
    {
        CGFloat itemRightEdge = attributes.center.x + (attributes.size.width / 2.0);
        if (ABS(itemRightEdge - rightEdge) < ABS (offsetAdjustment)) {
            offsetAdjustment = itemRightEdge - rightEdge;
        }
    }
    
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}

@end
