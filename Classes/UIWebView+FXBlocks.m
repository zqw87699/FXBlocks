//
//  UIWebView+FXBlocks.m
//  TTTT
//
//  Created by 张大宗 on 2017/8/31.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import "UIWebView+FXBlocks.h"
#import "NSObject+FXBlocks.h"

@implementation UIWebView (FXBlocks)
@dynamic shouldStartLoadBlock,didStartLoadBlock,didFinishLoadBlock,didFailLoadBlock;

+ (void)load{
    [self linkDelegateToProtocol:@protocol(UIWebViewDelegate)];
    [self linkDelegate:@"delegate" ToBlocks:@{
    @"shouldStartLoadBlock":NSStringFromSelector(@selector(webView:shouldStartLoadWithRequest:navigationType:)),
    @"didStartLoadBlock":NSStringFromSelector(@selector(webViewDidStartLoad:)),
    @"didFinishLoadBlock":NSStringFromSelector(@selector(webViewDidFinishLoad:)),
    @"didFailLoadBlock":NSStringFromSelector(@selector(webView:didFailLoadWithError:))}];
}

@end
