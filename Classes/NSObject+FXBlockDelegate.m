//
//  NSObject+FXBlockDelegate.m
//  Test
//
//  Created by 张大宗 on 2017/8/25.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import "NSObject+FXBlockDelegate.h"
#import <objc/runtime.h>

@interface NSObject()

@property (nonatomic, strong) NSMutableDictionary *blocks;

@end

static const void *Blocks = &Blocks;

@implementation NSObject (FXBlockDelegate)

- (NSMutableDictionary *)blocks {
    return objc_getAssociatedObject(self, Blocks);
}

- (void)setBlocks:(NSMutableDictionary *)blocks{
    objc_setAssociatedObject(self, Blocks, blocks, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)linkBlock:(NSString *)block ToDelegate:(SEL)delegate{
    if (!self.blocks) {
        self.blocks = [[NSMutableDictionary alloc] init];
    }
    NSMutableDictionary *fxBlocks = [self.blocks mutableCopy];
    [fxBlocks setObject:NSStringFromSelector(delegate) forKey:block];
    self.blocks = fxBlocks;
    //重写set方法
    NSString *str = [[[block substringToIndex:1] uppercaseString] stringByAppendingString:[block substringFromIndex:1]];
    NSString *setName = [NSString stringWithFormat:@"set%@:",str];
    class_replaceMethod([self class], NSSelectorFromString(setName),(IMP)Setter, "v@:@");
}

void Setter(id obj,SEL _cmdMe,id newName){
    NSString *propertyName = [NSStringFromSelector(_cmdMe) stringByReplacingCharactersInRange:NSMakeRange(0, 3) withString:@""];
    propertyName = [[[propertyName substringToIndex:1] lowercaseString] stringByAppendingString:[propertyName substringFromIndex:1]];
    propertyName = [propertyName substringToIndex:(propertyName.length-1)];
    objc_setAssociatedObject(obj, [propertyName UTF8String], newName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (newName) {
        NSMutableDictionary *blocks = [obj valueForKey:@"blocks"];
        //代理转Block
        Method delegateMethod = class_getInstanceMethod([obj class], NSSelectorFromString(blocks[propertyName]));
        IMP blockImp = imp_implementationWithBlock(newName);
        class_addMethod([obj class], NSSelectorFromString(blocks[propertyName]), blockImp, method_getTypeEncoding(delegateMethod));
    }
}

@end
