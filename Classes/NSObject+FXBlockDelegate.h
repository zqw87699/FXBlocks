//
//  NSObject+FXBlockDelegate.h
//  Test
//
//  Created by 张大宗 on 2017/8/25.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <Foundation/Foundation.h>

#define blockpath(OBJ, PATH) \
(((void)(NO && ((void)OBJ.PATH, NO)), # PATH))

#define _FXLinkBlockToDelegate(TARGET,BLOCK,DELEGATE) \
({ \
    __weak id target_ = (TARGET); \
    [target_ linkBlock:@blockpath(TARGET, BLOCK) ToDelegate:DELEGATE]; \
})

#if __clang__ && (__clang_major__ >= 8)
    #define FXLinkBlockToDelegate(TARGET,BLOCK, DELEGATE) _FXLinkBlockToDelegate(TARGET,BLOCK,DELEGATE)
#else
    #define FXLinkBlockToDelegate(TARGET,BLOCK, DELEGATE) \
    ({ \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wreceiver-is-weak\"") \
        _FXLinkBlockToDelegate(TARGET,BLOCK,DELEGATE) \
        _Pragma("clang diagnostic pop") \
    })
#endif

@interface NSObject (FXBlockDelegate)

- (void)linkBlock:(NSString*)block ToDelegate:(SEL)delegate;

@end
