//
//  KMainViewController.m
//  KBaseKit
//
//  Created by Chans  on 2016. 5. 3..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import "KMainViewController.h"
#import "UIAlertController+KAdditional.h"
#import "NSString+KAdditional.h"

@interface KMainViewController ()
@property (nonatomic, weak) IBOutlet UITextField    *textFieldInputBox;
@property (nonatomic, weak) IBOutlet UILabel        *labelResult;
@end

@implementation KMainViewController

#pragma mark - ViewControlelr LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

#pragma mark - IBActions

- (IBAction)backButtonPressed:(id)sender
{
    [UIAlertController showConfrimTitle:@"궁금하다 지금 내가"
                                message:@"너 뒤로 갈꺼양??"
                      completionHandler:^{
                          [self dismissViewControllerAnimated:YES completion:nil];
                      }
                          cancelHandler:^{
                              
                          }];
}

- (IBAction)urlEncodingBtnPressed:(id)sender
{
    NSString *text = _textFieldInputBox.text;
    if([text isEmpty] == NO)
    {
        _labelResult.text = [text urlEncoding];
    }
}

- (IBAction)urlDecodingBtnPressed:(id)sender
{
    NSString *text = _labelResult.text;
    if([text isEmpty] == NO)
    {
        _labelResult.text = [text urlDecoding];
    }
}

- (IBAction)base64EncodingBtnPressed:(id)sender
{
    NSString *text = _textFieldInputBox.text;
    if([text isEmpty] == NO)
    {
        _labelResult.text = [text base64Encoding];
    }
}

- (IBAction)base64DecodingBtnPressed:(id)sender
{
    NSString *text = _labelResult.text;
    if([text isEmpty] == NO)
    {
        _labelResult.text = [text base64Decoding];
    }
}

@end
