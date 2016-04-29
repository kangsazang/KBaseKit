//
//  KBaseViewController.m
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import "KBaseViewController.h"

@interface KBaseViewController ()

@end

@implementation KBaseViewController

#pragma mark -
#pragma mark LifeCycle

- (void)viewDidLoad
{
    _isFirstLuanch = YES;
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{[super viewWillAppear:animated];}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (_isFirstLuanch == YES) {
        _isFirstLuanch = NO;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{[super viewWillDisappear:animated];}

- (void)viewDidDisappear:(BOOL)animated
{[super viewDidDisappear:animated];}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"[%@] didReceiveMemoryWarning",self.class);
}

@end
