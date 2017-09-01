//
//  UIImagePickerController+FXBlocks.m
//  TTTT
//
//  Created by 张大宗 on 2017/9/1.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import "UIImagePickerController+FXBlocks.h"
#import "NSObject+FXBlocks.h"

@implementation UIImagePickerController (FXBlocks)
@dynamic didFinishPickingMediaBlock,didFinishPickingImageBlock,imagePickerControllerDidCancelBlock;
@dynamic willShowViewControllerBlock,didShowViewControllerBlock,supportedInterfaceOrientationsBlock,preferredInterfaceOrientationBlock,interactionControllerForAnimationBlock,animationControllerForOperationBlock;

+ (void)load{
    [self linkDelegateToProtocol:@protocol(UIImagePickerControllerDelegate)];
    [self linkDelegate:@"delegate" ToBlocks:@{
    @"didFinishPickingMediaBlock":NSStringFromSelector(@selector(imagePickerController:didFinishPickingMediaWithInfo:)),
    @"didFinishPickingImageBlock":NSStringFromSelector(@selector(imagePickerController:didFinishPickingImage:editingInfo:)),
    @"imagePickerControllerDidCancelBlock":NSStringFromSelector(@selector(imagePickerControllerDidCancel:))}];
    
    
    [self linkDelegateToProtocol:@protocol(UINavigationControllerDelegate)];
    [self linkDelegate:@"delegate" ToBlocks:@{
    @"willShowViewControllerBlock":NSStringFromSelector(@selector(navigationController:willShowViewController:animated:)),
    @"didShowViewControllerBlock":NSStringFromSelector(@selector(navigationController:didShowViewController:animated:)),
    @"supportedInterfaceOrientationsBlock":NSStringFromSelector(@selector(navigationControllerSupportedInterfaceOrientations:)),
    @"preferredInterfaceOrientationBlock":NSStringFromSelector(@selector(navigationControllerPreferredInterfaceOrientationForPresentation:)),
    @"interactionControllerForAnimationBlock":NSStringFromSelector(@selector(navigationController:interactionControllerForAnimationController:)),
    @"animationControllerForOperationBlock":NSStringFromSelector(@selector(navigationController:animationControllerForOperation:fromViewController:toViewController:))}];
}

@end
