//
//  SlideNavigationViewController.h
//  slidenavigation
//
//  Created by cdann on 3/14/13.
//  Copyright (c) 2013 cdann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationFlowLayout.h"

@interface SlideNavigationViewController : UICollectionViewController
<
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
>

@property NSInteger cellCount;
@property (nonatomic) CGSize cellViewSize;
@property (strong) UINib* cellNib;
@property (strong) UITapGestureRecognizer* tapRecognizer;

@end
