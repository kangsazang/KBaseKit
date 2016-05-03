//
//  KMainViewController.m
//  KBaseKit
//
//  Created by Chans  on 2016. 5. 3..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import "KMainViewController.h"
#import "KAlertController.h"

@implementation KMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}


- (IBAction)backButtonPressed:(id)sender
{
    [KAlertController showConfrimTitle:@"궁금하다 지금 내가"
                               message:@"너 뒤로 갈꺼양??"
                     completionHandler:^{
                         [self dismissViewControllerAnimated:YES completion:nil];
                     }
                         cancelHandler:^{
                             
                         }];
}

@end
