//
//  UIView+SimpleFrame.m
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import "UIView+SimpleFrame.h"

@implementation UIView (SimpleFrame)

- (void)setX:(CGFloat)x
{
    CGRect r = self.frame;
    r.origin.x = x;
    self.frame = r;
}

- (void)setY:(CGFloat)y
{
    CGRect r = self.frame;
    r.origin.y = y;
    self.frame = r;
}

- (void)setW:(CGFloat)w
{
    CGRect r = self.frame;
    r.size.width = w;
    self.frame = r;
}

- (void)setH:(CGFloat)h
{
    CGRect r = self.frame;
    r.size.height = h;
    self.frame = r;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (CGFloat)w
{
    return self.frame.size.width;
}

- (CGFloat)h
{
    return self.frame.size.height;
}


#define Animate

- (void)setX:(CGFloat)x animate:(BOOL)animate
{
    if (animate) {
        [UIView animateWithDuration:0.25
                         animations:^{
                             [self setX:x];
                         }];
    }
    else
    {
        [self setX:x];
    }
}

- (void)setY:(CGFloat)y animate:(BOOL)animate
{
    if (animate) {
        [UIView animateWithDuration:0.25
                         animations:^{
                             [self setY:y];
                         }];
    }
    else
    {
        [self setY:y];
    }
}

- (void)setW:(CGFloat)w animate:(BOOL)animate
{
    if (animate) {
        [UIView animateWithDuration:0.25
                         animations:^{
                             [self setW:w];
                         }];
    }
    else
    {
        [self setW:w];
    }
}

- (void)setH:(CGFloat)h animate:(BOOL)animate
{
    if (animate) {
        [UIView animateWithDuration:0.25
                         animations:^{
                             [self setH:h];
                         }];
    }
    else
    {
        [self setH:h];
    }
}




@end
