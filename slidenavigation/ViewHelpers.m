//
//  ViewHelpers.m
//  slidenavigation
//
//  Created by cdann on 3/15/13.
//  Copyright (c) 2013 cdann. All rights reserved.
//

#import "ViewHelpers.h"

@implementation ViewHelpers

#pragma mark - Shadows and decorations
+ (void) addRoundedCornersWithRadius:(CGFloat)radius toView:(UIView*)view
{
    [view.layer setCornerRadius:radius];
    [view.layer setMasksToBounds:NO];
}

+ (void) addShaddowToView:(UIView*)view
{
    [self addShaddowWithOffset:CGSizeMake( 0 , -3 ) radius:5.0 toView:view];
}

+ (void) addShaddowWithOffset:(CGSize)offset radius:(CGFloat)radius toView:(UIView*)view
{
    UIBezierPath *shadowPath = [UIBezierPath
                                bezierPathWithRoundedRect:view.layer.frame
                                cornerRadius:view.layer.cornerRadius];

    [view.layer setShadowColor:[[UIColor blackColor ] CGColor ]];
    [view.layer setShadowOpacity:0.65 ];
    [view.layer setShadowRadius:radius];
    [view.layer setShadowOffset:offset];
    [view.layer setShadowPath:[shadowPath CGPath]];
    [view.layer setMasksToBounds:NO];
}

@end
