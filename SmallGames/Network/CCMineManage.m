//
//  CCMineManage.m
//  KitchenAlwaysOnline
//
//  Created by hello on 2018/9/14.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCMineManage.h"
#import "HttpService.h"
#import "AppDelegate.h"
#import "CCJsonTool.h"

@implementation CCMineManage

//注册
+(void)MineRegisterWithUserName:(NSString *)userName andPassWord:(NSString *)passWord andReferrerId:(NSString *)referrerId andRoomId:(NSString *)roomID completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:userName forKey:@"uname"];
    [parameterDictionary setObject:passWord forKey:@"upass"];
    [parameterDictionary setObject:passWord forKey:@"rupass"];
    [parameterDictionary setObject:roomID forKey:@"roomid"];
    [parameterDictionary setObject:@"reg" forKey:@"way"];
    if (referrerId.length != 0) {
     [parameterDictionary setObject:referrerId forKey:@"invitecode"];
    }
    
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}

//进入房间
+(void)MineIntoRoomWithRoomId:(NSString *)roomId completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:roomId forKey:@"roomid"];
    [parameterDictionary setObject:@"inroom" forKey:@"way"];
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}


//登录
+(void)MineLoginWithUserName:(NSString *)userName andPassWord:(NSString *)passWord andRoomNumber:(NSString *)roomNumber completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:userName forKey:@"uname"];
    [parameterDictionary setObject:passWord forKey:@"upass"];
    [parameterDictionary setObject:@"login" forKey:@"way"];
    [parameterDictionary setObject:roomNumber forKey:@"roomid"];
    
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}


//修改密码
+(void)MineChangePassWordWithOldPassWord:(NSString *)opassword andNewPassWord:(NSString *)password completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"updatepwd" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:opassword forKey:@"oldpwd"];
    [parameterDictionary setObject:password forKey:@"newpass"];
    [parameterDictionary setObject:password forKey:@"rnewpass"];
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}



//退出登录
+(void)MineLoginOutCompletion:(void(^) (id resultDictionary, NSError *error)) completion{
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.userid forKey:@"uid"];
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:@"logout" forKey:@"way"];
    
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}


//个人中心
+(void)MinePersonalCenterCompletion:(void(^) (id resultDictionary, NSError *error)) completion{
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"roomid"];
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:@"ucenter" forKey:@"way"];
    
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}


//获取下线
+(void)MineGetOfflineCenterCompletion:(void(^) (id resultDictionary, NSError *error)) completion{
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"roomid"];
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:@"getxia" forKey:@"way"];
    
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}


//修改昵称
+(void)MineChangeUserNameWithNewUserName:(NSString *)username completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:username forKey:@"username"];
    [parameterDictionary setObject:@"updateuname" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"roomid"];
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}

//图片上传
+(void)MineUploadImageWithImage:(UIImage *)image completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
    NSString *dataStr = [imageData base64EncodedStringWithOptions:0];
    
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"imgupload" forKey:@"way"];
    [parameterDictionary setObject:[NSString stringWithFormat:@"data:image/jpg;base64,%@",dataStr] forKey:@"imgbases"];
   
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}

//更换头像
+(void)MineChangeUserHeaderImageWithImagePath:(NSString *)imagePath completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"updateheadimg" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:imagePath forKey:@"headimg"];

    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}


+(void)MineBettingInformationCompletion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"getorder" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"roomid"];
    [parameterDictionary setObject:@"365" forKey:@"365"];
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}


//常见问题
+(void)MineCommonProblemCompletion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"cjwt" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}

//app下载二维码
+(void)MineAppDownloadCompletion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"xzewm" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}


//获取客服信息
+(void)MineCustomerServiceInformationCompletion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"getkf" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"roomid"];
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}

//获取支付宝银行卡信息
+(void)MineCardInformationCompletion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"bangding" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}


//添加支付宝银行卡信息
+(void)MineAddCardInformationWithCardNumber:(NSString *)cardNumber andBaseViewType:(BaseViewType)viewType andCardStatus:(NSUInteger)cardStatus completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"addbangding" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:cardNumber forKey:@"infonum"];
    NSString *xuanString;
    if (viewType == BaseViewTypeAlipay) {
        if (cardStatus == 0) {
            xuanString = @"1";
        }else if(cardStatus == 1){
            xuanString = @"2";
        }else{
            xuanString = @"3";
        }
    }else{
        if (cardStatus == 0) {
            xuanString = @"4";
        }else if(cardStatus == 1){
            xuanString = @"5";
        }else{
            xuanString = @"6";
        }
    }
    [parameterDictionary setObject:xuanString forKey:@"xuan"];
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}

//投注信息
+(void)MineBettingInformationWithOrderType:(NSString *)ordertype completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"getorder" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"roomid"];
    [parameterDictionary setObject:ordertype forKey:@"ordertype"];
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}

//获取规则
+(void)MineAcquisitionRuleWithGameType:(GameType)gameType completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"getrules" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"roomid"];
    NSString *BetGame;
    if (gameType == GameTypeBeijingRacing) {
        BetGame = @"pk10";
    }else if (gameType == GameTypeChongqingTimeColor) {
        BetGame = @"cqssc";
    }else if (gameType == GameTypeLuckyAirship) {
        BetGame = @"xyft";
    }
    [parameterDictionary setObject:BetGame forKey:@"BetGame"];
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}

//获取跟单列表
+(void)MineDocumentsListWithGameType:(GameType)gameType completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"getgendan" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"roomid"];
    NSString *BetGame;
    if (gameType == GameTypeBeijingRacing) {
        BetGame = @"pk10";
    }else if (gameType == GameTypeChongqingTimeColor) {
        BetGame = @"cqssc";
    }else if (gameType == GameTypeLuckyAirship) {
        BetGame = @"xyft";
    }
    [parameterDictionary setObject:BetGame forKey:@"BetGame"];
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}

//获取上下分记录
+(void)MineUpperLowerPointsWithPurseScoreType:(PurseScoreType)purseScoreType completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"getsxfen" forKey:@"way"];
    if (purseScoreType == PurseScoreTypeUpper) {
        [parameterDictionary setObject:@"shang" forKey:@"type"];
    }else if(purseScoreType == PurseScoreTypeSubordinate){
        [parameterDictionary setObject:@"xia" forKey:@"type"];
    }
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"roomid"];
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}


//上下分
+(void)MineUpperLowerPointsWithPurseScoreType:(PurseScoreType)purseScoreType andMoney:(NSString *)money completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"sxfen" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"room_id"];
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.headimg forKey:@"headimg"];
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.username forKey:@"username"];
    if (purseScoreType == PurseScoreTypeUpper) {
        [parameterDictionary setObject:@"shang" forKey:@"type"];
    }else if(purseScoreType == PurseScoreTypeSubordinate){
        [parameterDictionary setObject:@"xia" forKey:@"type"];
    }
    [parameterDictionary setObject:money forKey:@"money"];
    [parameterDictionary setObject:@"pk10" forKey:@"BetGame"];
    
    NSLog(@"parameterDictionary:%@",parameterDictionary);
    
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}

//获取走势
+(void)MineTrendWithGameType:(GameType)gameType completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"getzoushi" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    NSString *BetGame;
    if (gameType == GameTypeBeijingRacing) {
        BetGame = @"pk10";
    }else if (gameType == GameTypeChongqingTimeColor) {
        BetGame = @"cqssc";
    }else if (gameType == GameTypeLuckyAirship) {
        BetGame = @"xyft";
    }
    [parameterDictionary setObject:BetGame forKey:@"BetGame"];
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}

//领取福利
+(void)MineReceivingBenefitsWithMoney:(NSString *)money completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"lqfl" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:money forKey:@"fs_money"];
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}

//获取财务记录
+(void)MineObtainFinancialRecordsWithTime:(NSString *)time completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"getcaiwu" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"roomid"];
    if (time.length != 0) {
        [parameterDictionary setObject:time forKey:@"time"];
    }
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}


//查询账户记录
+(void)MineQueryAccountRecordCompletion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"getjilu" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"roomid"];
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}



//跟单
+(void)MineDocumentaryInterfaceWithGameType:(GameType)gameType andDocumentaryUserShowID:(NSString *)userShowID andMagnification:(NSString *)magnification completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"gendan" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"roomid"];
    NSString *BetGame;
    if (gameType == GameTypeBeijingRacing) {
        BetGame = @"pk10";
    }else if (gameType == GameTypeChongqingTimeColor) {
        BetGame = @"cqssc";
    }else if (gameType == GameTypeLuckyAirship) {
        BetGame = @"xyft";
    }
    [parameterDictionary setObject:BetGame forKey:@"BetGame"];
    [parameterDictionary setObject:userShowID forKey:@"b_show_id"];
    [parameterDictionary setObject:magnification forKey:@"bl"];
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}



//撤销订单
+(void)MineCancelOrderWithGameType:(GameType)gameType andOrderId:(NSString *)orderId completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"delbet" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"roomid"];
    NSString *BetGame;
    if (gameType == GameTypeBeijingRacing) {
        BetGame = @"pk10";
    }else if (gameType == GameTypeChongqingTimeColor) {
        BetGame = @"cqssc";
    }else if (gameType == GameTypeLuckyAirship) {
        BetGame = @"xyft";
    }
    [parameterDictionary setObject:BetGame forKey:@"BetGame"];
    [parameterDictionary setObject:orderId forKey:@"Id"];
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}


//暂停跟单／修改赔率
+(void)MineModifyOrderWithGendanId:(NSString *)gendanId andCaozuo:(NSInteger)caozuo andOdds:(NSString *)odds completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"updategd" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:gendanId forKey:@"gendan_id"];
    [parameterDictionary setObject:[NSString stringWithFormat:@"%ld",(long)caozuo] forKey:@"caozuo"];
    if (caozuo == 1) {
        [parameterDictionary setObject:odds forKey:@"pl"];
    }
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}

//获取时时彩的开奖
+(void)MineRequestDrawCompletion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"getsscopen" forKey:@"way"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"roomid"];
    
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}

//下注已结算
+(void)MineBetRecordDetailsSettledWithGettime:(NSString *)gettime completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"getjiluxqjs" forKey:@"way"];
    NSArray *timearray = [gettime componentsSeparatedByString:@" "];
    NSString *timeString = [timearray objectAtIndex:0];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[CCJsonTool JsonToolGetTimeStrWithString:timeString] forKey:@"gettime"];
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"roomid"];
    
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}

//下注未结算
+(void)MineBetRecordDetailsUnsettlementWithGettime:(NSString *)gettime completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"getjiluxqwjs" forKey:@"way"];
    NSArray *timearray = [gettime componentsSeparatedByString:@" "];
    NSString *timeString = [timearray objectAtIndex:0];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[CCJsonTool JsonToolGetTimeStrWithString:timeString] forKey:@"gettime"];
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"roomid"];
    
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}

//下注详情
+(void)MineBetRecordDetailsWithGettime:(NSString *)gettime andType:(NSString *)type completion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"getjiluxqmore" forKey:@"way"];
    NSArray *timearray = [gettime componentsSeparatedByString:@" "];
    NSString *timeString = [timearray objectAtIndex:0];
    [parameterDictionary setObject:[CCJsonTool JsonToolGetTimeStrWithString:timeString] forKey:@"gettime"];
    [parameterDictionary setObject:type forKey:@"type"];
    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
        return;
    }
    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"roomid"];
    
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}


/**
 获取长龙记录
 
 @param completion 数据返回
 */
+(void)MineLongDragonCompletion:(void(^) (id resultDictionary, NSError *error)) completion{
    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    [parameterDictionary setObject:@"cldata" forKey:@"way"];
//    NSArray *timearray = [gettime componentsSeparatedByString:@" "];
//    NSString *timeString = [timearray objectAtIndex:0];
//    [parameterDictionary setObject:[CCJsonTool JsonToolGetTimeStrWithString:timeString] forKey:@"gettime"];
//    [parameterDictionary setObject:type forKey:@"type"];
//    if ([AppDelegate sharedApplicationDelegate].userInfoModel.utoken.length == 0) {
//        return;
//    }
//    [parameterDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
//    [parameterDictionary setObject:[CCUserInfoModel UserRoomID] forKey:@"roomid"];
    
    HttpService *service = [HttpService sharedService];
    [service postRequest:parameterDictionary withPath:nil completion:^(id resultDictionary, NSError *error) {
        completion(resultDictionary,error);
    }];
}

@end
