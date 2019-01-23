//
//  CCMineManage.h
//  KitchenAlwaysOnline
//
//  Created by hello on 2018/9/14.
//  Copyright © 2018年 hello. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCMineManage : NSObject

/**
 注册
 
 @param userName 用户名
 @param passWord 密码
 @param referrerId 推荐人ID
 @param completion 数据返回
 */
+(void)MineRegisterWithUserName:(NSString *)userName andPassWord:(NSString *)passWord andReferrerId:(NSString *)referrerId andRoomId:(NSString *)roomId  completion:(void(^) (id resultDictionary, NSError *error)) completion;


/**
 进入房间接口

 @param roomId 房间号
 @param completion 数据返回
 */
+(void)MineIntoRoomWithRoomId:(NSString *)roomId completion:(void(^) (id resultDictionary, NSError *error)) completion;

/**
 登录

 @param userName 用户名
 @param passWord 密码
 @param completion 数据返回
 */
+(void)MineLoginWithUserName:(NSString *)userName andPassWord:(NSString *)passWord andRoomNumber:(NSString *)roomNumber completion:(void(^) (id resultDictionary, NSError *error)) completion;


/**
 修改密码
 
 @param opassword 旧密码
 @param password 新密码
 @param completion 数据返回
 */
+(void)MineChangePassWordWithOldPassWord:(NSString *)opassword andNewPassWord:(NSString *)password completion:(void(^) (id resultDictionary, NSError *error)) completion;


/**
 退出登录

 @param completion 数据返回
 */
+(void)MineLoginOutCompletion:(void(^) (id resultDictionary, NSError *error)) completion;



/**
 个人中心

 @param completion 数据返回
 */
+(void)MinePersonalCenterCompletion:(void(^) (id resultDictionary, NSError *error)) completion;



/**
 获取下线

 @param completion 数据返回
 */
+(void)MineGetOfflineCenterCompletion:(void(^) (id resultDictionary, NSError *error)) completion;


/**
 修改昵称
 
 @param username 新昵称
 @param completion 数据返回
 */
+(void)MineChangeUserNameWithNewUserName:(NSString *)username completion:(void(^) (id resultDictionary, NSError *error)) completion;



/**
 图片上传

 @param image 图片
 @param completion 数据返回
 */
+(void)MineUploadImageWithImage:(UIImage *)image completion:(void(^) (id resultDictionary, NSError *error)) completion;



/**
 修改头像

 @param imagePath 图片路径
 @param completion 数据返回
 */
+(void)MineChangeUserHeaderImageWithImagePath:(NSString *)imagePath completion:(void(^) (id resultDictionary, NSError *error)) completion;



/**
 获取投注信息

 @param completion 数据返回
 */
+(void)MineBettingInformationCompletion:(void(^) (id resultDictionary, NSError *error)) completion;



/**
 常见问题

 @param completion 数据返回
 */
+(void)MineCommonProblemCompletion:(void(^) (id resultDictionary, NSError *error)) completion;


/**
 app下载二维码

 @param completion 数据返回
 */
+(void)MineAppDownloadCompletion:(void(^) (id resultDictionary, NSError *error)) completion;


/**
 获取客服信息

 @param completion 数据返回
 */
+(void)MineCustomerServiceInformationCompletion:(void(^) (id resultDictionary, NSError *error)) completion;


/**
 获取支付宝银行卡信息

 @param completion 数据返回
 */
+(void)MineCardInformationCompletion:(void(^) (id resultDictionary, NSError *error)) completion;


/**
 添加支付宝银行卡信息

 @param cardNumber 卡号
 @param viewType 支付宝或银行卡
 @param cardStatus 第几张卡
 @param completion 数据返回
 */
+(void)MineAddCardInformationWithCardNumber:(NSString *)cardNumber andBaseViewType:(BaseViewType)viewType andCardStatus:(NSUInteger)cardStatus completion:(void(^) (id resultDictionary, NSError *error)) completion;



/**
 投注信息

 @param ordertype 订单状态
 @param completion 数据返回
 */
+(void)MineBettingInformationWithOrderType:(NSString *)ordertype completion:(void(^) (id resultDictionary, NSError *error)) completion;


/**
 获取规则

 @param gameType 游戏类型
 @param completion 数据返回
 */
+(void)MineAcquisitionRuleWithGameType:(GameType)gameType completion:(void(^) (id resultDictionary, NSError *error)) completion;



/**
 获取跟单列表

 @param gameType 游戏类型
 @param completion 数据返回
 */
+(void)MineDocumentsListWithGameType:(GameType)gameType completion:(void(^) (id resultDictionary, NSError *error)) completion;


/**
 获取上下分记录
 @param purseScoreType shang 上分 xia 下分 也可不传
 @param completion 数据返回
 */
+(void)MineUpperLowerPointsWithPurseScoreType:(PurseScoreType)purseScoreType completion:(void(^) (id resultDictionary, NSError *error)) completion;


/**
 上下分

 @param purseScoreType shang  上分  xia  上分
 @param money 分数
 @param completion 数据返回
 */
+(void)MineUpperLowerPointsWithPurseScoreType:(PurseScoreType)purseScoreType andMoney:(NSString *)money completion:(void(^) (id resultDictionary, NSError *error)) completion;


/**
 获取走势

 @param gameType 游戏类型
 @param completion 数据返回
 */
+(void)MineTrendWithGameType:(GameType)gameType completion:(void(^) (id resultDictionary, NSError *error)) completion;



/**
 领取福利

 @param money 福利
 @param completion 数据
 */
+(void)MineReceivingBenefitsWithMoney:(NSString *)money completion:(void(^) (id resultDictionary, NSError *error)) completion;


/**
 获取财务记录

 @param time 时间
 @param completion 数据返回
 */
+(void)MineObtainFinancialRecordsWithTime:(NSString *)time completion:(void(^) (id resultDictionary, NSError *error)) completion;


/**
 查询账户记录

 @param completion 数据返回
 */
+(void)MineQueryAccountRecordCompletion:(void(^) (id resultDictionary, NSError *error)) completion;




/**
 跟单

 @param gameType 游戏类弄
 @param userShowID 被跟单人的show_id
 @param magnification 倍率
 @param completion 数据返回
 */
+(void)MineDocumentaryInterfaceWithGameType:(GameType)gameType andDocumentaryUserShowID:(NSString *)userShowID andMagnification:(NSString *)magnification completion:(void(^) (id resultDictionary, NSError *error)) completion;



/**
 撤销订单

 @param gameType 游戏类型
 @param orderId 订单ID
 @param completion 数据返回
 */
+(void)MineCancelOrderWithGameType:(GameType)gameType andOrderId:(NSString *)orderId completion:(void(^) (id resultDictionary, NSError *error)) completion;


/**
 暂停跟单／修改赔率

 @param gendanId 跟单ID
 @param caozuo 1修改赔率  2暂定跟单
 @param odds 赔率（caozuo==1时传）
 @param completion 数据返回
 */
+(void)MineModifyOrderWithGendanId:(NSString *)gendanId andCaozuo:(NSInteger)caozuo andOdds:(NSString *)odds completion:(void(^) (id resultDictionary, NSError *error)) completion;

/**
 时时彩的开奖

 @param completion 数据返回
 */
+(void)MineRequestDrawCompletion:(void(^) (id resultDictionary, NSError *error)) completion;


/**
 下注记录详情：已经结算

 @param gettime 时间戳
 @param completion 数据返回
 */
+(void)MineBetRecordDetailsSettledWithGettime:(NSString *)gettime completion:(void(^) (id resultDictionary, NSError *error)) completion;

/**
 下注记录详情：未结算
 
 @param gettime 时间戳
 @param completion 数据返回
 */
+(void)MineBetRecordDetailsUnsettlementWithGettime:(NSString *)gettime completion:(void(^) (id resultDictionary, NSError *error)) completion;



/**
 下注记录详情

 @param gettime  时间戳
 @param type 1 结算pk10  2结算 幸运飞艇 3结算 时时彩 4未结算pk10 5未结算 幸运飞艇  6未结算 时时彩
 @param completion 数据返回
 */
+(void)MineBetRecordDetailsWithGettime:(NSString *)gettime andType:(NSString *)type completion:(void(^) (id resultDictionary, NSError *error)) completion;



@end
