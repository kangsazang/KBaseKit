//
//  UIView+KAdditional.m
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import "UIView+KAdditional.h"

@implementation UIView (KAdditional)


#pragma mark - Animate

- (void)fadeIn
{
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.alpha = 1.0f;
    } completion:nil];
}

- (void)fadeOut
{
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.alpha = 0.0f;
    } completion:nil];
}

- (void)moveX:(CGFloat)x animate:(BOOL)animate
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

- (void)moveY:(CGFloat)y animate:(BOOL)animate
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

- (void)moveW:(CGFloat)w animate:(BOOL)animate
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

- (void)moveH:(CGFloat)h animate:(BOOL)animate
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


#pragma mark - Shot Cuts

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
    CGRect r = self.frame;
    r.origin.x = x;
    self.frame = r;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y
{
    CGRect r = self.frame;
    r.origin.y = y;
    self.frame = r;
}

- (CGFloat)w
{
    return self.frame.size.width;
}

- (void)setW:(CGFloat)w
{
    CGRect r = self.frame;
    r.size.width = w;
    self.frame = r;
}

- (CGFloat)h
{
    return self.frame.size.height;
}

- (void)setH:(CGFloat)h
{
    CGRect r = self.frame;
    r.size.height = h;
    self.frame = r;
}


- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect r = self.frame;
    r.origin = origin;
    self.frame = r;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect r = self.frame;
    r.size = size;
    self.frame = r;
}


- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x
{
    CGRect r = self.frame;
    r.origin.x = x;
    self.frame = r;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y
{
    CGRect r = self.frame;
    r.origin.y = y;
    self.frame = r;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right
{
    CGRect r = self.frame;
    r.origin.x = right - r.size.width;
    self.frame = r;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect r = self.frame;
    r.origin.y = bottom - r.size.height;
    self.frame = r;
}


- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}





@end
