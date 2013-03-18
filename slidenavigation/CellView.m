//
//  CellView.m
//  slidenavigation
//
//  Created by cdann on 3/15/13.
//  Copyright (c) 2013 cdann. All rights reserved.
//

#import "CellView.h"
#import "ViewHelpers.h"

@implementation CellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    [ViewHelpers addShaddowWithOffset:CGSizeMake(-1, 0) radius:5.0 toView:self];
    [ViewHelpers addRoundedCornersWithRadius:10 toView:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
