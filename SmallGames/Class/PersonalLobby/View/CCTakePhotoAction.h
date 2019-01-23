//
//  CCTakePhotoAction.h
//  testApp
//
//  Created by mac on 16/5/24.
//  Copyright © 2016年 Runsdata. All rights reserved.


//相机的调用

#import <Foundation/Foundation.h>

@interface CCTakePhotoAction : NSObject


@property (nonatomic, strong) UIViewController *outerViewController;
@property (nonatomic, weak)   UIView *parentView;


- (instancetype)initWithViewController:(UIViewController *)viewController parentView:(UIView *)view;

- (void)selectImageCompletion:(void(^)(UIImage *image))mCompletion cancel:(void(^)(void))mCancel;

//从相机选择
- (void)selectPhtotFromPhtotoCamera;

//从相册选择
- (void)selectPhotoFromPhtotLibrary;

/**
 相机权限
 */
+ (BOOL)checkCameraAuthorizationStatus;

/**
 相册权限
 */
+ (BOOL)checkPhotoLibraryAuthorizationStatus;

/*
 调用
 _photoAction = [[CCTakePhotoAction alloc]initWithViewController:self parentView:self.view andType:@"0"];
 [_photoAction selectImageCompletion:^(UIImage *image){
 loginBtn.userInteractionEnabled=NO;
 loginBtn.backgroundColor = [UIColor grayColor];
 [idCardImage setImage:image];
 [self uploadIdCardImage:image];
 } cancel:^{ }];
 [_photoAction selectPhtotFromPhtotoCamera];
 */
@end
