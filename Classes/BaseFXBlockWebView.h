//
//  BaseFXBlockWebView.h
//  Test
//
//  Created by 张大宗 on 2017/8/25.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseFXWebView.h"

typedef BOOL(^fx_shouldStartLoadBlock)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType);

typedef void(^fx_didStartLoadBlock)(UIWebView *webView);

typedef void(^fx_didFinishLoadBlock)(UIWebView *webView);

typedef void(^fx_didFailLoadBlock)(UIWebView *webView,NSError *error);

@interface BaseFXBlockWebView : BaseFXWebView

@property (nonatomic, copy) fx_shouldStartLoadBlock shouldStartLoadBlock;

@property (nonatomic, copy) fx_didStartLoadBlock didStartLoadBlock;

@property (nonatomic, copy) fx_didFinishLoadBlock didFinishLoadBlock;

@property (nonatomic, copy) fx_didFailLoadBlock didFailLoadBlock;

@end
