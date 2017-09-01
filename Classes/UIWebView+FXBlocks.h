//
//  UIWebView+FXBlocks.h
//  TTTT
//
//  Created by 张大宗 on 2017/8/31.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <UIKit/UIKit.h>

//UIWebViewDelegate
typedef BOOL(^fx_shouldStartLoadBlock)(id delegate,UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType);

typedef void(^fx_didStartLoadBlock)(id delegate,UIWebView *webView);

typedef void(^fx_didFinishLoadBlock)(id delegate,UIWebView *webView);

typedef void(^fx_didFailLoadBlock)(id delegate,UIWebView *webView,NSError *error);



@interface UIWebView (FXBlocks)
//UIWebViewDelegate
@property (nonatomic, copy) fx_shouldStartLoadBlock shouldStartLoadBlock;

@property (nonatomic, copy) fx_didStartLoadBlock didStartLoadBlock;

@property (nonatomic, copy) fx_didFinishLoadBlock didFinishLoadBlock;

@property (nonatomic, copy) fx_didFailLoadBlock didFailLoadBlock;

@end
