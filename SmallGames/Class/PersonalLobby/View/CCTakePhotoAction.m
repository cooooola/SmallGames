//
//  CCTakePhotoAction.m
//  testApp
//
//  Created by mac on 16/5/24.
//  Copyright © 2016年 Runsdata. All rights reserved.
//

#import "CCTakePhotoAction.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <Photos/PHPhotoLibrary.h>
@interface CCTakePhotoAction()<UINavigationControllerDelegate, UIImagePickerControllerDelegate,UIActionSheetDelegate>

@property (nonatomic, strong) void(^completion)(UIImage *image);
@property (nonatomic, strong) void(^cancel)(void);
@property (nonatomic, strong)UIImagePickerController *ImagePick;
@end

@implementation CCTakePhotoAction

- (void)selectImageCompletion:(void(^)(UIImage *image))mCompletion cancel:(void(^)(void))mCancel{
    self.completion = mCompletion;
    self.cancel = mCancel;
}


- (instancetype)initWithViewController:(UIViewController *)viewController parentView:(UIView *)view{
    self = [super init];
    if (self) {
        _outerViewController = viewController;
        _parentView = view;
    }
    return self;
}


- (void)selectPhotoFromPhtotLibrary{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        _ImagePick = [[UIImagePickerController alloc]init];
        if (kiOS8Later) {
            _ImagePick.modalPresentationStyle = UIModalPresentationCurrentContext;
        }
        _ImagePick.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        _ImagePick.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeImage];
        _ImagePick.delegate = self;
        _ImagePick.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        if (self.outerViewController) {
            [self.outerViewController presentViewController:_ImagePick animated:true completion:nil];
        }
        
    }
}

- (void)selectPhtotFromPhtotoCamera{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
            _ImagePick = [[UIImagePickerController alloc]init];
            if (kiOS8Later) {
                _ImagePick.modalPresentationStyle = UIModalPresentationCurrentContext;
            }
            _ImagePick.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            _ImagePick.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeImage];
            _ImagePick.sourceType = UIImagePickerControllerSourceTypeCamera;
            _ImagePick.delegate = self;
            if (self.outerViewController) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
                    [self.outerViewController presentViewController:self->_ImagePick animated:true completion:nil];});
            }
        }
    }
}

#pragma -mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:true completion:nil];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    if(image.imageOrientation==UIImageOrientationLeft||image.imageOrientation==UIImageOrientationRight){
        // 原始图片可以根据照相时的角度来显示，但UIImage无法判定，于是出现获取的图片会向左转９０度的现象。
        UIGraphicsBeginImageContext(image.size);
        [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    NSData *fData = UIImageJPEGRepresentation(image, 0.3);
    UIImage *newImage = [UIImage imageWithData:fData];
    if (self.completion) {
        self.completion(newImage);
    }
    [_ImagePick.view removeFromSuperview];
    [_ImagePick removeFromParentViewController];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:true completion:nil];
    if (self.cancel) {
        self.cancel();
    }
}


+ (BOOL)checkCameraAuthorizationStatus{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [CCView BSMBProgressHUD_onlyTextWithView:[AppDelegate sharedApplicationDelegate].window  andText:@"该设备不支持拍照"];
        return NO;
    }
    if ([AVCaptureDevice respondsToSelector:@selector(authorizationStatusForMediaType:)]) {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (AVAuthorizationStatusDenied == authStatus ||
            AVAuthorizationStatusRestricted == authStatus) {
            [CCView BSMBProgressHUD_onlyTextWithView:[AppDelegate sharedApplicationDelegate].window  andText:@"请在iPhone的“设置->小游戏->相机”中打开本应用的访问权限"];
            return NO;
        }
    }
    return YES;
}


+ (BOOL)checkPhotoLibraryAuthorizationStatus{
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied){
        [CCView BSMBProgressHUD_onlyTextWithView:[AppDelegate sharedApplicationDelegate].window  andText:@"请在iPhone的“设置->小游戏->照片”中打开本应用的访问权限"];
        return NO;
    }
    return YES;
}
@end
