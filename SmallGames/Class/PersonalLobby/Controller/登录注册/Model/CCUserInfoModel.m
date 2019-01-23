//
//  CCUserInfoModel.m
//  KitchenAlwaysOnline
//
//  Created by hello on 2018/9/14.
//  Copyright © 2018年 hello. All rights reserved.
//
#define MCUserDefaults [NSUserDefaults standardUserDefaults]
#define BSUSERINFO                 @"userinfo"                       // 用户信息

#import "CCUserInfoModel.h"
#import "YYCache.h"

@implementation CCUserInfoModel

-(void)setHeadimg:(NSString *)headimg{
    
    _headimg = headimg;
    if ([AppDelegate sharedApplicationDelegate].userInfoModel) {
        YYCache *cacheUser = [[YYCache alloc]initWithName:BSUSERINFO];
        id userInfo = [cacheUser objectForKey:@"user"];
        NSMutableDictionary *userDic = [NSMutableDictionary dictionaryWithDictionary:userInfo];
        [userDic setObject:headimg forKey:@"headimg"];
        [CCUserInfoModel UserInfoStorageWithObject:userDic];
    }
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"Id" : @"id"};

}

+(void)UserInfoStorageWithObject:(NSDictionary *)array{
    YYCache *cacheUser = [[YYCache alloc]initWithName:BSUSERINFO];
    [cacheUser setObject:array forKey:@"user"];
    [cacheUser diskCache];
}

+(CCUserInfoModel *)UserInfoObtain{
    YYCache *cacheUser = [[YYCache alloc]initWithName:BSUSERINFO];
    id userInfo = [cacheUser objectForKey:@"user"];
    CCUserInfoModel *model = [CCUserInfoModel modelWithDictionary:userInfo];
    return model;
}

+(void)UserInfoRemove{
    YYCache *cacheUser = [[YYCache alloc]initWithName:BSUSERINFO];
    [cacheUser removeAllObjects];
}


/**
 存储房间号
 */
+(void)UserRoomIDWithObject:(NSString *)object{
    YYCache *cacheUser = [[YYCache alloc]initWithName:BSUSERINFO];
    [cacheUser setObject:object forKey:@"RoomID"];
    [cacheUser diskCache];
}


/**
 获取房间号
 */
+(NSString *)UserRoomID{
    YYCache *cacheUser = [[YYCache alloc]initWithName:BSUSERINFO];
    id roomID = [cacheUser objectForKey:@"RoomID"];
    NSString *roomid = [NSString stringWithFormat:@"%@",roomID];
    return roomid;
}

@end
