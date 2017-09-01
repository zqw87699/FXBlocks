//
//  NSObject+FXBlocks.h
//  TTTT
//
//  Created by 张大宗 on 2017/8/30.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXBlocks : NSObject

@end

@interface NSObject (FXBlocks)

@property (nonatomic, strong) FXBlocks *fxBlocks;

+ (void)linkDelegateToProtocol:(Protocol *)aProtocol;

+ (void)linkDelegate:(NSString*)delegate ToBlocks:(NSDictionary*)blocks;

@end
