//
//  UIView+KAdditional.h
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KAdditional)


#pragma mark - Animate

- (void)fadeIn;
- (void)fadeOut;

- (void)moveX:(CGFloat)x animate:(BOOL)animate;
- (void)moveY:(CGFloat)y animate:(BOOL)animate;
- (void)moveW:(CGFloat)w animate:(BOOL)animate;
- (void)moveH:(CGFloat)h animate:(BOOL)animate;


#pragma mark - Shot Cuts

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat w;
@property (nonatomic) CGFloat h;

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;



@end
