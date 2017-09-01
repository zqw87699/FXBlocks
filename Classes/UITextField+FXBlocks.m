//
//  UITextField+FXBlocks.m
//  TTTT
//
//  Created by 张大宗 on 2017/8/30.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import "UITextField+FXBlocks.h"
#import "NSObject+FXBlocks.h"

@implementation UITextField (FXBlocks)
@dynamic textFieldShouldBeginEditingBlock,textFieldDidBeginEditingBlock,textFieldShouldEndEditingBlock,textFieldDidEndEditingBlock,textFieldDidEndEditingReasonBlock,shouldChangeCharactersBlock,textFieldShouldClearBlock,textFieldShouldReturnBlock;

+ (void)load{
    [self linkDelegateToProtocol:@protocol(UITextFieldDelegate)];
    [self linkDelegate:@"delegate" ToBlocks:@{
    @"textFieldShouldBeginEditingBlock":NSStringFromSelector(@selector(textFieldShouldBeginEditing:)),
    @"textFieldDidBeginEditingBlock":NSStringFromSelector(@selector(textFieldDidBeginEditing:)),
    @"textFieldShouldEndEditingBlock":NSStringFromSelector(@selector(textFieldShouldEndEditing:)),
    @"textFieldDidEndEditingBlock":NSStringFromSelector(@selector(textFieldDidEndEditing:)),
    @"textFieldDidEndEditingReasonBlock":NSStringFromSelector(@selector(textFieldDidEndEditing:reason:)),
    @"shouldChangeCharactersBlock":NSStringFromSelector(@selector(textField:shouldChangeCharactersInRange:replacementString:)),
    @"textFieldShouldClearBlock":NSStringFromSelector(@selector(textFieldShouldClear:)),
    @"textFieldShouldReturnBlock":NSStringFromSelector(@selector(textFieldShouldReturn:))
    }];
}

@end
