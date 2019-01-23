//
//  CCUserInfoModel.h
//  KitchenAlwaysOnline
//
//  Created by hello on 2018/9/14.
//  Copyright © 2018年 hello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYKit.h"

@interface CCUserInfoModel : NSObject
@property(nonatomic,strong)NSString *headimg;
@property(nonatomic,strong)NSString *umoney;
@property(nonatomic,strong)NSString *uroomid;
@property(nonatomic,strong)NSString *userid;
@property(nonatomic,strong)NSString *username;
@property(nonatomic,strong)NSString *utoken;
@property(nonatomic,strong)NSString *showid;
@property(nonatomic,strong)NSString *liu;
@property(nonatomic,strong)NSString *xianum;
@property(nonatomic,strong)NSString *yk;

/**
 存储用户信息

 @param array 用户信息
 */
+(void)UserInfoStorageWithObject:(NSDictionary *)array;


/**
 获取用户信息

 @return 数据返回
 */
+(CCUserInfoModel *)UserInfoObtain;

/**
 删除用户信息
 */
+(void)UserInfoRemove;

/**
 存储房间号
 
 @param object 用户信息
 */
+(void)UserRoomIDWithObject:(NSString *)object;


/**
 获取房间号
 
 @return 数据返回
 */
+(NSString *)UserRoomID;

/**
 删除房间号
 */
+(void)UserRoomIDRemove;

@end
