//
//  NSObject+FXBlocks.m
//  TTTT
//
//  Created by 张大宗 on 2017/8/30.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import "NSObject+FXBlocks.h"
#import <objc/runtime.h>

@interface FXBlocks()<NSCopying>

@end

@implementation FXBlocks

#pragma mark NSCopying
- (id)copyWithZone:(NSZone *)zone {
    FXBlocks* copyObject = [[[self class] allocWithZone:zone] init];
    return copyObject;
}

@end

static const void *FxBlocks = &FxBlocks;

@implementation NSObject (FXBlocks)

@dynamic fxBlocks;

- (NSString*)fxBlocks{
    return objc_getAssociatedObject(self, FxBlocks);
}

- (void)setFxBlocks:(FXBlocks *)fxBlocks{
    objc_setAssociatedObject(self, FxBlocks, fxBlocks, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)linkDelegateToProtocol:(Protocol *)aProtocol{
    BOOL success = class_addProtocol([FXBlocks class], aProtocol);
    if (!success) {
        if ([[FXBlocks class] conformsToProtocol:aProtocol]) {
            NSLog(@"协议%@已注册",NSStringFromProtocol(aProtocol));
        }else{
            NSLog(@"协议注册失败:%@",NSStringFromProtocol(aProtocol));
        }
    }
}

+ (void)linkDelegate:(NSString *)delegate ToBlocks:(NSDictionary *)blocks{
    for (NSString *block in blocks.allKeys) {
        //重写set方法
        NSString *str = [[[block substringToIndex:1] uppercaseString] stringByAppendingString:[block substringFromIndex:1]];
        NSString *setName = [NSString stringWithFormat:@"set%@:",str];
        
        IMP setter = imp_implementationWithBlock(^(id obj,id value){
            if (![obj valueForKey:@"fxBlocks"]) {
                FXBlocks *fxblocks = [[FXBlocks alloc] init];
                [obj setValue:fxblocks forKey:@"fxBlocks"];
                [obj setValue:fxblocks forKey:delegate];
            }
            if (value) {
                objc_setAssociatedObject(obj, [block UTF8String], value, OBJC_ASSOCIATION_COPY_NONATOMIC);
                
                IMP blockImp = imp_implementationWithBlock(value);
                unsigned int protocolCount;
                char *types;
                __unsafe_unretained Protocol **protocolList = class_copyProtocolList([FXBlocks class], &protocolCount);
                for (int i=0; i<protocolCount; i++) {
                    
                    struct objc_method_description methodDescription1 = protocol_getMethodDescription(protocolList[i],NSSelectorFromString(blocks[block]), NO, YES);
                    struct objc_method_description methodDescription2 = protocol_getMethodDescription(protocolList[i],NSSelectorFromString(blocks[block]), YES, YES);
                    struct objc_method_description methodDescription3 = protocol_getMethodDescription(protocolList[i],NSSelectorFromString(blocks[block]), NO, NO);
                    struct objc_method_description methodDescription4 = protocol_getMethodDescription(protocolList[i],NSSelectorFromString(blocks[block]), YES, NO);
                    if ([NSStringFromSelector(methodDescription1.name) isEqualToString:blocks[block]]) {
                        types = methodDescription1.types;
                    }else if ([NSStringFromSelector(methodDescription2.name) isEqualToString:blocks[block]]){
                        types = methodDescription2.types;
                    }else if ([NSStringFromSelector(methodDescription3.name) isEqualToString:blocks[block]]){
                        types = methodDescription3.types;
                    }else if ([NSStringFromSelector(methodDescription4.name) isEqualToString:blocks[block]]){
                        types = methodDescription4.types;
                    }
                }
                BOOL success = class_addMethod([FXBlocks class], NSSelectorFromString(blocks[block]), blockImp, types);
                if (!success) {
                    NSLog(@"代理方法已存在:%@",blocks[block]);
                    class_replaceMethod([FXBlocks class], NSSelectorFromString(blocks[block]), blockImp, types);
                }
            }
        });
        class_replaceMethod([self class], NSSelectorFromString(setName),setter, "v@:@");
        
        IMP getter = imp_implementationWithBlock(^id(id obj){
            return objc_getAssociatedObject(obj, [block UTF8String]);
        });
        class_replaceMethod([self class], NSSelectorFromString(block), getter, "@@:");
    }
}

@end
