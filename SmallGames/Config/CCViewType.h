//
//  CCViewType.h
//  SmallGames
//
//  Created by hello on 2018/9/21.
//  Copyright © 2018年 hello. All rights reserved.
//

#ifndef CCViewType_h
#define CCViewType_h


typedef enum{
    BaseViewTypeAlipay = 1,//支付宝
    BaseViewTypeBankCard = 2,//银行卡
    BaseViewTypeEnterRoomNumber = 3,//房间号
} BaseViewType;

typedef enum{
    PurseScoreTypeUpper = 1,//上分
    PurseScoreTypeSubordinate = 2,//下分
} PurseScoreType;

typedef enum{
    ShowViewCustomerService = 1,//客服
    ShowViewMessage = 2,//安全码错误
} ShowViewType;

typedef enum {
    GameTypeBeijingRacing = 1,//北京赛车
    GameTypeChongqingTimeColor = 2,//重庆时时彩
    GameTypeLuckyAirship = 3,//幸运飞艇
} GameType;

typedef enum {
    GameChatTypeCustomerService = 0,//上分
    GameChatTypeDetail = 1,//明细
    GameChatTypeRunningWater = 2,//流水
    GameChatTypeRegulation = 3,//规则
    GameChatTypeUpperScore = 4,//客服
    GameChatTypeCenter = 5,//中心
}GameChatType;


#endif /* CCViewType_h */
