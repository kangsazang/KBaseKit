//
//  KBaseView.m
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import "KBaseView.h"

@implementation KBaseView

+ (instancetype)loadNib
{
    return [[self class] loadNibWithIndex:0];
}

+ (instancetype)loadNibWithIndex:(NSInteger)index
{
    [UIView animateWithDuration:0.25
                     animations:^{
                         
                     }completion:^(BOOL finished) {
                         
                     }];
    
    NSString *className = NSStringFromClass([self class]);
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:className
                                                  owner:self
                                                options:nil];
    return (nibs.count-1 >= index) ? [nibs objectAtIndex:index] : nil;
}

@end
