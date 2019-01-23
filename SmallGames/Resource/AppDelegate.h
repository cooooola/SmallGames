//
//  AppDelegate.h
//  SmallGames
//
//  Created by hello on 2018/9/18.
//  Copyright © 2018年 hello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCUserInfoModel.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property(strong,nonatomic) UIWindow *window;
@property(nonatomic,strong) CCUserInfoModel *userInfoModel;


+(AppDelegate *)sharedApplicationDelegate;

@end

