//
//  UIView+SimpleFrame.h
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SimpleFrame)

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat w;
@property (nonatomic) CGFloat h;

- (void)setX:(CGFloat)x animate:(BOOL)animate;
- (void)setY:(CGFloat)y animate:(BOOL)animate;
- (void)setW:(CGFloat)w animate:(BOOL)animate;
- (void)setH:(CGFloat)h animate:(BOOL)animate;

@end
