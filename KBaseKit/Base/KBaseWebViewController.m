//
//  KBaseWebViewController.m
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import "KBaseWebViewController.h"

@implementation KBaseWebViewController

#pragma mark - 
#pragma mark - ViewLifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _allowPopupNewWebview = YES;
    _showIndicator = YES;
    
    if (_webViewMain == nil) {
        _webViewMain = [[UIWebView alloc] initWithFrame:self.view.bounds];
        [_webViewMain setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
        [_webViewMain setDelegate:self];
        [_webViewMain setScalesPageToFit:YES];
        [self.view insertSubview:self.webViewMain atIndex:0];
    }

    if (_homePageUrl) {
        [self webviewMove:_homePageUrl];
    }
}

- (void)viewWillAppear:(BOOL)animated
{[super viewWillAppear:animated];}

- (void)viewDidAppear:(BOOL)animated
{[super viewDidAppear:animated];}

- (void)viewWillDisappear:(BOOL)animated
{[super viewWillDisappear:animated];}

- (void)viewDidDisappear:(BOOL)animated
{[super viewDidDisappear:animated];}

#pragma mark -
#pragma mark - UIWebViewDelegate

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
  
    if ([_prevPageUrl isEqualToString:_nowPageUrl] == NO) {
        _prevPageUrl = _nowPageUrl;
        _nowPageUrl = [NSMutableString stringWithFormat:@"%@",[[request URL] absoluteString]];
#if PRINT_WEBVIEW_LOG
        NSLog(@"Request URL : [%@]",_nowPageUrl);
#endif
    }

    return YES;
}
- (void) webViewDidStartLoad:(UIWebView *)webView
{
    if (_showIndicator == YES) {
        [self indicatorShow];
    }
    
}

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    if (_showIndicator == YES) {
        [self indicatorHide];
    }

    if ([webView canGoBack]) {

    }
    else
    {

    }
    
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    // Add any fail errors needed here. For this demo, we'll let it silently fail.
    NSLog(@"didFailLoadWithError : [%@]",error);
    [self indicatorHide];
}

#pragma mark -
#pragma mark - WEB Public Action

- (void)webviewMove:(NSString *)urlString
{
    NSLog(@"move : [%@]",urlString);
    if (urlString == nil || urlString.length == 0) {
        NSLog(@"urlString is Null or Emtpy length");
        return;
    }
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webViewMain loadRequest:request];
}

- (void)goBack
{
    NSLog(@"goBack");
    [self.webViewMain goBack];
}

- (void)goForward
{
    NSLog(@"goForward");
    [self.webViewMain goForward];
}

- (void)home
{
    NSLog(@"home");
    [self webviewMove:_homePageUrl];
}

- (void)reload
{
    NSLog(@"reload");
    [self.webViewMain reload];
}

- (void)indicatorShow
{
    // Show the network activity indicator
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)indicatorHide
{
    // Refresh toolbar and hide network activity indicator
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
