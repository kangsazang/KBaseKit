//
//  UIAlertController+KAdditional.m
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import "UIAlertController+KAdditional.h"

@implementation UIAlertController (KAdditional)

+ (void)showMessage:(NSString *)message
{
    [UIAlertController showTitle:@""
                         message:message
                    leftBtnTitle:@"확인"
                   rightBtnTitle:nil
                  leftBtnHandler:^{
                  }
                 rightBtnHandler:^{
                 }];
}

+ (void)showTitle:(NSString *)title
          message:(NSString *)message
{
    [UIAlertController showTitle:title
                         message:message
                    leftBtnTitle:@"확인"
                   rightBtnTitle:nil
                  leftBtnHandler:^{
                  }
                 rightBtnHandler:^{
                 }];
}

+ (void)showTitle:(NSString *)title
          message:(NSString *)message
     leftBtnTitle:(NSString *)leftButtonTitle
    rightBtnTitle:(NSString *)rightButtonTitle
   leftBtnHandler:(void (^)(void))leftHandler
  rightBtnHandler:(void (^)(void))rightHandler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
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
    UIViewController *target = [UIAlertController topPresentedViewController:rootViewController];
    
    [target presentViewController:alert
                         animated:YES
                       completion:nil];
}

+ (id)topPresentedViewController:(UIViewController *)vc
{
    UIViewController *target = vc;
    if (vc.presentedViewController && vc != vc.presentedViewController) {
        target = [UIAlertController topPresentedViewController:vc.presentedViewController];
    }
    
    return target;
}

+ (void)showConfrimTitle:(NSString *)title
                 message:(NSString *)message
       completionHandler:(void (^)(void))completionHandler
           cancelHandler:(void (^)(void))cancelHandler
{
    [UIAlertController showTitle:title
                         message:message
                    leftBtnTitle:@"확인"
                   rightBtnTitle:@"취소"
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
    [UIAlertController showTitle:title
                         message:message
                    leftBtnTitle:@"재시도"
                   rightBtnTitle:@"취소"
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
    [UIAlertController showTitle:title
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
