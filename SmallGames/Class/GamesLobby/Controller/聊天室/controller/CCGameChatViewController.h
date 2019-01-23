//
//  CCGameChatViewController.h
//  SmallGames
//
//  Created by hello on 2018/9/29.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCViewController.h"
#import "CCSendMessageModel.h"
#import "webSocketManager.h"

@interface CCGameChatViewController : CCViewController
@property(nonatomic,strong)webSocketManager *chatWebSocketManager;
@property(nonatomic,copy)void(^returningNumber)(NSString *peopleNumber);//返回人数据
@property(nonatomic,assign)GameType gameType;
@property(nonatomic,strong)CCSendMessageModel *sendMessageModel;
@end
