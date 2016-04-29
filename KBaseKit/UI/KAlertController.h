//
//  KAlertController.h
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KAlertController : UIAlertController

/*!
 @Desc                      기본 알럿, 자동으로 노출됨, Window RootViewController에서 노출됨
 @Param title               알럿 제목
 @Param message             알럿 내용
 @Param leftButtonTitle     왼쪽 버튼 제목
 @Param rightButtonTitle    오른쪽 버튼 제목
 @Param leftHandler         왼쪽 버튼 클릭 블록
 @Param rightHandler        오른쪽 버튼 클릭 블록
 */
+ (void)showTitle:(NSString *)title
          message:(NSString *)message
     leftBtnTitle:(NSString *)leftButtonTitle
    rightBtnTitle:(NSString *)rightButtonTitle
   leftBtnHandler:(void (^)(void))leftHandler
  rightBtnHandler:(void (^)(void))rightHandler;

/*!
 @Desc                      확인/취소 알럿. 기본 알럿을 호출
 @Param title               알럿 제목
 @Param message             알럿 내용
 @Param completionHandler   확인 버튼 클릭 블록
 @Param cancelHandler       취소 버튼 클릭 블록
 */
+ (void)showConfrimTitle:(NSString *)title
                 message:(NSString *)message
       completionHandler:(void (^)(void))completionHandler
           cancelHandler:(void (^)(void))cancelHandler;

/*!
 @Desc                      재시도/취소 알럿. 기본 알럿을 호출
 @Param title               알럿 제목
 @Param message             알럿 내용
 @Param retryHandler        재시도 버튼 클릭 블록
 @Param cancelHandler       취소 버튼 클릭 블록
 */
+ (void)showRetryTitle:(NSString *)title
               message:(NSString *)message
          retryHandler:(void (^)(void))retryHandler
         cancelHandler:(void (^)(void))cancelHandler;

/*!
 @Desc                      원버튼 알럿. 기본 알럿을 호출
 @Param title               알럿 제목
 @Param message             알럿 내용
 @Param buttonTitle         버튼 제목
 @Param completionHandler   버튼 클릭 블록
 */
+ (void)showOneButtonTitle:(NSString *)title
                   message:(NSString *)message
               buttonTitle:(NSString *)buttonTitle
         completionHandler:(void (^)(void))completionHandler;

@end
