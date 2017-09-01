//
//  UIImagePickerController+FXBlocks.h
//  TTTT
//
//  Created by 张大宗 on 2017/9/1.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <UIKit/UIKit.h>

//UIImagePickerControllerDelegate
typedef void(^fx_didFinishPickingImageBlock)(id delegate,UIImagePickerController *picker,UIImage *image,NSDictionary<NSString *,id> *editingInfo);

typedef void(^fx_didFinishPickingMediaBlock)(id delegate,UIImagePickerController *picker,NSDictionary<NSString *,id> *info);

typedef void(^fx_imagePickerControllerDidCancelBlock)(id delegate,UIImagePickerController *picker);

//UINavigationControllerDelegate
typedef void(^fx_willShowViewControllerBlock)(id delegate,UINavigationController *navigationController,UIViewController *viewController,BOOL animated);

typedef void(^fx_didShowViewControllerBlock)(id delegate,UINavigationController *navigationController,UIViewController *viewController,BOOL animated);

typedef UIInterfaceOrientationMask(^fx_supportedInterfaceOrientationsBlock)(id delegate,UINavigationController *navigationController);

typedef UIInterfaceOrientation(^fx_preferredInterfaceOrientationBlock)(id delegate,UINavigationController *navigationController);

typedef id<UIViewControllerInteractiveTransitioning>(^fx_interactionControllerForAnimationBlock)(id delegate,UINavigationController *navigationController,id<UIViewControllerAnimatedTransitioning> animationController);


typedef id <UIViewControllerAnimatedTransitioning>(^fx_animationControllerForOperationBlock)(id delegate,UINavigationController *navigationController,UINavigationControllerOperation operation,UIViewController *fromVC,UIViewController *toVC);





@interface UIImagePickerController (FXBlocks)
//UIImagePickerControllerDelegate
@property (nonatomic, copy) fx_didFinishPickingImageBlock didFinishPickingImageBlock NS_DEPRECATED_IOS(2_0, 3_0);

@property (nonatomic, copy) fx_didFinishPickingMediaBlock didFinishPickingMediaBlock;

@property (nonatomic, copy) fx_imagePickerControllerDidCancelBlock imagePickerControllerDidCancelBlock;
//UINavigationControllerDelegate
@property (nonatomic, copy) fx_willShowViewControllerBlock willShowViewControllerBlock;

@property (nonatomic, copy) fx_didShowViewControllerBlock didShowViewControllerBlock;

@property (nonatomic, copy) fx_supportedInterfaceOrientationsBlock supportedInterfaceOrientationsBlock NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;

@property (nonatomic, copy) fx_preferredInterfaceOrientationBlock preferredInterfaceOrientationBlock NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;

@property (nonatomic, copy) fx_interactionControllerForAnimationBlock interactionControllerForAnimationBlock NS_AVAILABLE_IOS(7_0);

@property (nonatomic, copy) fx_animationControllerForOperationBlock animationControllerForOperationBlock NS_AVAILABLE_IOS(7_0);

@end
