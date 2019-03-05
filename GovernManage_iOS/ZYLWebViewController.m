//
//  ZYLWebViewController.m
//  GovernManage_iOS
//
//  Created by 丁磊 on 2019/2/20.
//  Copyright © 2019 丁磊. All rights reserved.
//

#import "ZYLWebViewController.h"
#import <WebKit/WebKit.h>

@interface ZYLWebViewController ()
@end

@implementation ZYLWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.titleStr;
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: self.urlStr]]];
    [self.view addSubview: webView];
}



@end
