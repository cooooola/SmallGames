//
//  CCPersonalHomeHeaderView.h
//  SmallGames
//
//  Created by hello on 2018/9/20.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBaseView.h"

@interface CCPersonalHomeHeaderView : CCBaseView
@property(nonatomic,copy)void(^clickUserHeaderImageBtn)(void);//改头像
@property(nonatomic,copy)void(^clickDetermineBtn)(NSString *userName);//改名字
@property(nonatomic,copy)void(^clickPurseBtn)(void);//查看钱包
@property(nonatomic,copy)void(^clickProfitBtn)(void);//查看今日盈亏
@property(nonatomic,copy)void(^clickStreamBtn)(void);//查看今日流水
@property(nonatomic,strong)UIImage *userHeaderImage;

@property(nonatomic,strong)NSString *yingkueiString;
@property(nonatomic,strong)NSString *lushuiStrin;
@property(nonatomic,strong)NSString *umoneyString;

@property(nonatomic,strong)NSString *userNameString;

@end
