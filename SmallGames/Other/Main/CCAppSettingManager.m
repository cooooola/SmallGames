//
//  CCAppSettingManager.m
//  
//
//  Created by hello on 2018/3/8.
//

#import "CCAppSettingManager.h"
#import <UIKit/UIKit.h>

#import "CCHomeViewController.h"
#import "CCLoginViewController.h"

@implementation CCAppSettingManager



+(void)appSetting{
    [self tabBarViewControllerSetting];
    
    [self pushHomeController];
}

+(void)pushHomeController{
    CCUserInfoModel *userInfoModel = [CCUserInfoModel UserInfoObtain];
    AppDelegate.sharedApplicationDelegate.userInfoModel = userInfoModel;
    if (userInfoModel.utoken.length == 0) {
        CCLoginViewController *loginVC = [[CCLoginViewController alloc]init];
        CCNavigationController *navigationController = [[CCNavigationController alloc]initWithRootViewController:loginVC];
        [AppDelegate sharedApplicationDelegate].window.rootViewController = navigationController;
    }else{
        CCHomeViewController *homeVC = [[CCHomeViewController alloc]init];
        CCNavigationController *navigationController = [[CCNavigationController alloc]initWithRootViewController:homeVC];
        [AppDelegate sharedApplicationDelegate].window.rootViewController = navigationController;
    }
}


+(void)tabBarViewControllerSetting{
    UIImageView *lunchImageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    lunchImageView.image = [self getLaunchImage];
    UIViewController *vc = [UIViewController new];
    [vc.view addSubview:lunchImageView];
    [AppDelegate sharedApplicationDelegate].window.rootViewController = vc;
}

+ (UIImage *)getLaunchImage{
    NSString *viewOrientation = @"Portrait";
    if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        viewOrientation = @"Landscape";
    }
    NSString *launchImageName = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    
    UIWindow *currentWindow = [[UIApplication sharedApplication].windows firstObject];
    CGSize viewSize = currentWindow.bounds.size;
    for (NSDictionary* dict in imagesDict)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            launchImageName = dict[@"UILaunchImageName"];
        }
    }
    return [UIImage imageNamed:launchImageName];
}


@end
