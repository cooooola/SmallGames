//
//  webSocketManager.h
//  wesocketDemo
//
//  Created by guyue on 17/1/29.
//  Copyright © 2017年 guyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SocketRocket/SRWebSocket.h>
#import "CCSendMessageModel.h"

//设置代理,用于接受websocket传来的消息时,在外部进行处理

#pragma mark -- 这个协议  在你要使用的控制器里面遵守这个协议<SRWebSocketDelegate>  然后设置代理[webSocketManager shared].delegate = self   去下面实现代理方法-(void)getMessageFromSocke  就可以接收到WS消息了
@protocol getMessageDelegate <NSObject>
- (void)getMessageFromSocket:(NSDictionary *)message;
@end

@interface webSocketManager : NSObject<SRWebSocketDelegate>//签Socket协议
@property(nonatomic,copy)void(^returningNum)(NSString *peopleNum);//返回人数
@property (weak,nonatomic) id<getMessageDelegate>delegate;
@property (nonatomic,strong) SRWebSocket *webSocket;
@property(nonatomic,assign)GameType gameType;

+(instancetype)shared;
//外部调用传入链接URL
- (void)WithIP:(NSString *)URLIP;
//外部控制打开webSocket(拿到接口传给的URL之后)
- (void)openSocket;
//外部调用控制关闭webSocket
- (void)closeSocket;
//ping pong 心跳链接
- (void)SendPangMessage;
//外部聊天发送消息
- (void)sendTalkMessage:(NSString *)message;
//是否需要开启WS
- (BOOL)needOpenWS;

//外部聊天发送消息及下注
- (void)sendTalkMessageWithSendMessageModel:(CCSendMessageModel *)sendMessageModel;

@end
