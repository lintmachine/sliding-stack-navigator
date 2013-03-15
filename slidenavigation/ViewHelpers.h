//
//  ViewHelpers.h
//  slidenavigation
//
//  Created by cdann on 3/15/13.
//  Copyright (c) 2013 cdann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewHelpers : NSObject

+ (void) addRoundedCornersWithRadius:(CGFloat)radius toView:(UIView*)view;
+ (void) addShaddowToView:(UIView*)view;
+ (void) addShaddowWithOffset:(CGSize)offset radius:(CGFloat)radius toView:(UIView*)view;

@end
