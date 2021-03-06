//
//  KCommon.h
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBaseManager.h"

@interface KCommon : KBaseManager

#pragma mark - INFOMATION

+ (instancetype)shared;

/*! DebugMode .... Default YES */
+ (BOOL)isDebugMode;
+ (void)setDebugMode:(BOOL)debugMode;

+ (void)appicationInfomation;

/*! 앱 버전 정보 */
+ (NSString *)platform;
+ (NSString *)displayName;
+ (NSString *)identifier;
+ (NSString *)versionNumber;
+ (NSString *)buildNumber;
+ (NSString *)systemVersion;

#pragma mark - UTIL

/*! Path */
+ (NSString *)documentAppendPath:(NSString *)path;
+ (NSString *)cachesAppendPath:(NSString *)path;

/*! Web / HTTP */
+ (void)httpShareCookie:(BOOL)isShare; // Default YES;
+ (void)httpPrintCookie;
+ (void)httpDeleteCookie;
+ (void)httpDeleteCache;

+ (NSDictionary*)urlParamParsing:(NSString*)url;
+ (NSString *)urlParamMerge:(NSString *)url param:(NSDictionary *)param;

/*! Json Parse..  */
+ (id)jsonParse:(NSData *)jsonData;
+ (NSString *)stringByRemovingControlCharacters: (NSString *)inputString;
+ (NSData *)dataByRemovingControlCharacters: (NSData *)inputData;

/*! Image */
+ (UIImage *)stretchImageWithName:(NSString *)aName leftCapWidth:(CGFloat)leftCapWidth topCapHeight:(CGFloat)topCapHeight;
+ (UIImage *)stretchImageWithName:(NSString *)aName;

/*! 기타 */
+ (BOOL)findString:(NSString *)str find:(NSString *)_findStr;

+ (UIViewController *)topViewController;
+ (UIViewController *)topViewControllerWithRootViewController:(UIViewController *)rootViewController;



@end
