//
//  KBaseWebViewController.h
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBaseViewController.h"

@interface KBaseWebViewController : KBaseViewController <UIWebViewDelegate, UIGestureRecognizerDelegate, NSURLConnectionDelegate>

@property (nonatomic, strong)   IBOutlet UIWebView *    webViewMain;
@property (nonatomic, strong)   NSMutableArray *        windows;
@property (nonatomic, strong)   UIWebView *             activeWindow;

@property (nonatomic, strong)   NSMutableString *       homePageUrl;
@property (nonatomic, strong)   NSMutableString *       prevPageUrl;
@property (nonatomic, strong)   NSMutableString *       nowPageUrl;
@property (nonatomic)           BOOL                    allowPopupNewWebview;   /*! default YES */
@property (nonatomic)           BOOL                    showIndicator;          /*! default YES */


- (void)webviewMove:(NSString *)urlString;
- (void)goBack;
- (void)goForward;
- (void)home;
- (void)reload;

@end
