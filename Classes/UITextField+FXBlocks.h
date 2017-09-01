//
//  UITextField+FXBlocks.h
//  TTTT
//
//  Created by 张大宗 on 2017/8/30.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <UIKit/UIKit.h>

//UITextFieldDelegate
typedef BOOL(^fx_textFieldShouldBeginEditingBlock)(id delegate,UITextField *textField);

typedef void(^fx_textFieldDidBeginEditingBlock)(id delegate,UITextField *textField);

typedef BOOL(^fx_textFieldShouldEndEditingBlock)(id delegate,UITextField *textField);

typedef void(^fx_textFieldDidEndEditingBlock)(id delegate,UITextField *textField);

typedef void(^fx_textFieldDidEndEditingReasonBlock)(id delegate,UITextField *textField,UITextFieldDidEndEditingReason reason);

typedef BOOL(^fx_shouldChangeCharactersBlock)(id delegate,UITextField *textField,NSRange range,NSString*string);

typedef BOOL(^fx_textFieldShouldClearBlock)(id delegate,UITextField *textField);

typedef BOOL(^fx_textFieldShouldReturnBlock)(id delegate,UITextField *textField);




@interface UITextField (FXBlocks)
//UITextFieldDelegate
@property (nonatomic, copy) fx_textFieldShouldBeginEditingBlock textFieldShouldBeginEditingBlock;

@property (nonatomic, copy) fx_textFieldDidBeginEditingBlock textFieldDidBeginEditingBlock;

@property (nonatomic, copy) fx_textFieldShouldEndEditingBlock textFieldShouldEndEditingBlock;

@property (nonatomic, copy) fx_textFieldDidEndEditingBlock textFieldDidEndEditingBlock;

@property (nonatomic, copy) fx_textFieldDidEndEditingReasonBlock textFieldDidEndEditingReasonBlock NS_AVAILABLE_IOS(10_0);

@property (nonatomic, copy) fx_shouldChangeCharactersBlock shouldChangeCharactersBlock;

@property (nonatomic, copy) fx_textFieldShouldClearBlock textFieldShouldClearBlock;

@property (nonatomic, copy) fx_textFieldShouldReturnBlock textFieldShouldReturnBlock;

@end
