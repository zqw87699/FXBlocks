//
//  BaseFXBlockWebView.m
//  Test
//
//  Created by 张大宗 on 2017/8/25.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import "BaseFXBlockWebView.h"
#import "NSObject+FXBlockDelegate.h"

@interface BaseFXBlockWebView()<UIWebViewDelegate>

@end

@implementation BaseFXBlockWebView

- (void)fx_loadView{
    self.delegate = self;
    FXLinkBlockToDelegate(self, didStartLoadBlock, @selector(webViewDidStartLoad:));
    FXLinkBlockToDelegate(self, shouldStartLoadBlock, @selector(webView:shouldStartLoadWithRequest:navigationType:));
    FXLinkBlockToDelegate(self, didFinishLoadBlock, @selector(webViewDidFinishLoad:));
    FXLinkBlockToDelegate(self, didFailLoadBlock, @selector(webView:didFailLoadWithError:));
}

@end
