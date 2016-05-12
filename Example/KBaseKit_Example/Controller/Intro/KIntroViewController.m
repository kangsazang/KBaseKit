//
//  KIntroViewController.m
//  KBaseKit
//
//  Created by Chans  on 2016. 5. 3..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import "KIntroViewController.h"

@interface KIntroViewController ()

@property (nonatomic, strong) IBOutlet UIButton *btn;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *constraintBtnLeft;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *constraintBtnBottom;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *constraintBtnW;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *constraintBtnH;

@end

@implementation KIntroViewController

#pragma mark - ViewControlelr LifeCycle

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self performSelector:@selector(startIntroAnimation) withObject:nil afterDelay:0.5];
}

- (void)startIntroAnimation
{

    [UIView animateWithDuration:1
                     animations:^{
                         
                         
                         self.constraintBtnLeft.constant = self.view.w - _btn.w - 20;
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         

                         [UIView animateWithDuration:0.75
                                          animations:^{
                                              
                                              self.constraintBtnLeft.constant = 0;
                                              self.constraintBtnBottom.constant = 0;
                                              self.constraintBtnW.constant = self.view.w;
                                              self.constraintBtnH.constant = self.view.h;
                                              [self.view layoutIfNeeded];

                                          }
                                          completion:^(BOOL finished) {
                                              
                                              
                                              [UIView animateWithDuration:0.75
                                                               animations:^{

                                                                   self.constraintBtnLeft.constant = self.view.w - (self.view.w / 2) - 20;
                                                                   self.constraintBtnBottom.constant = self.view.h - (self.view.h / 4);;
                                                                   self.constraintBtnW.constant = self.view.w / 2;
                                                                   self.constraintBtnH.constant = self.view.h / 5;
                                                                   [self.view layoutIfNeeded];
                                                                   self.btn.alpha = 0;
                                                               }
                                                               completion:^(BOOL finished) {
                                                                   

                                                                   [UIView animateWithDuration:0.75
                                                                                    animations:^{
                                                                                        
                                                                                        self.view.alpha = 0.3;
                                                                                    }
                                                                                    completion:^(BOOL finished) {
                                                                                        
                                                                                        [self performSegueWithIdentifier:@"MoveRootViewController" sender:nil];
                                                                                    }];

                                                               }];
                                              
                                              
                                          }];
                         
                     }];
}

@end
