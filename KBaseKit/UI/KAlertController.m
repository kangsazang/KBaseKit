//
//  KAlertController.m
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import "KAlertController.h"

@interface KAlertController ()

@end

@implementation KAlertController

+ (void)showTitle:(NSString *)title
          message:(NSString *)message
     leftBtnTitle:(NSString *)leftButtonTitle
    rightBtnTitle:(NSString *)rightButtonTitle
   leftBtnHandler:(void (^)(void))leftHandler
  rightBtnHandler:(void (^)(void))rightHandler
{
    KAlertController *alert = [KAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    if (leftButtonTitle) {
        UIAlertAction* leftButton = [UIAlertAction actionWithTitle:leftButtonTitle
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * action) {
                                                               [alert dismissViewControllerAnimated:YES completion:nil];
                                                               leftHandler();
                                                           }];
        [alert addAction:leftButton];
    }
    
    if (rightButtonTitle) {
        UIAlertAction* rightButton = [UIAlertAction actionWithTitle:rightButtonTitle
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction * action) {
                                                                [alert dismissViewControllerAnimated:YES completion:nil];
                                                                rightHandler();
                                                            }];
        [alert addAction:rightButton];
    }


    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (window == nil) { // window가 nil인경우도 있을 수 있다.
        window = [[UIApplication sharedApplication].delegate window];
    }
    UIViewController *rootViewController = window.rootViewController;

    [rootViewController presentViewController:alert
                                     animated:YES
                                   completion:nil];
}

+ (void)showConfrimTitle:(NSString *)title
                 message:(NSString *)message
       completionHandler:(void (^)(void))completionHandler
           cancelHandler:(void (^)(void))cancelHandler
{
    [KAlertController showTitle:title
                         message:message
                    leftBtnTitle:@"OK"
                   rightBtnTitle:@"Cancel"
                  leftBtnHandler:^{
                      completionHandler();
                  }
                 rightBtnHandler:^{
                     cancelHandler();
                 }];
}

+ (void)showRetryTitle:(NSString *)title
               message:(NSString *)message
          retryHandler:(void (^)(void))retryHandler
         cancelHandler:(void (^)(void))cancelHandler
{
    [KAlertController showTitle:title
                         message:message
                    leftBtnTitle:@"Retry"
                   rightBtnTitle:@"Cancel"
                  leftBtnHandler:^{
                      retryHandler();
                  }
                 rightBtnHandler:^{
                     cancelHandler();
                 }];
}

+ (void)showOneButtonTitle:(NSString *)title
                   message:(NSString *)message
               buttonTitle:(NSString *)buttonTitle
         completionHandler:(void (^)(void))completionHandler
{
    [KAlertController showTitle:title
                         message:message
                    leftBtnTitle:buttonTitle
                   rightBtnTitle:nil
                  leftBtnHandler:^{
                      completionHandler();
                  }
                 rightBtnHandler:^{
                 }];
}


@end
