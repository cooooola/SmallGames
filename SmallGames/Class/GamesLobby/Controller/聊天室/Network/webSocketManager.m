//
//  webSocketManager.m
//  liveapp
//
//  Created by guyue on 17/1/4.
//  Copyright © 2017年 guyue. All rights reserved.
//

#import "webSocketManager.h"
#import "CCUserMessageInfoModel.h"

static NSString *wsurl = @"ws://211.149.245.82:7373";

@interface webSocketManager()
@property(nonatomic,strong)CCUserMessageInfoModel *userMessageInfoModel;
@end


@implementation webSocketManager
{
    NSInteger ReconnectTimes;
}
+(instancetype)shared{
    static webSocketManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[webSocketManager alloc] init];
    });
    return manager;
}

- (void)WithIP:(NSString *)URLIP{

}

- (void)openSocket {
    [self.webSocket close];
    self.webSocket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:wsurl]]];//WSURL 这个域名是宏定义的WS主机域名
    self.webSocket.delegate = self;
    [self.webSocket open];
}
//查询是否是打开的状态
-(BOOL)needOpenWS{
    if (_webSocket.readyState == 0) {
        return NO;
    }else{
        return YES;
    }
}

- (void)closeSocket {
    self.webSocket.delegate = nil;
    [self.webSocket close];
    self.webSocket = nil;
}




//ping pong 心跳链接
- (void)SendPangMessage{
    
}
#pragma mark   /*******  socket必须实现的代理方法 *********/
//打开socket后根据后端要求传入字典字符串
-(void)webSocketDidOpen:(SRWebSocket *)webSocket{
//    NSError *error;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:@{@"type":@"login"
//                                                                 } options:NSJSONWritingPrettyPrinted error:&error];
//    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//
//    [webSocket send:jsonString];
 //   [SVProgressHUD dismiss];
    ReconnectTimes = 0; //重连次数
   
}


//socket接收到信息后通过代理传给外部使用
#pragma mark -- 全局所有的WS 都是先走这个deledate
-(void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message{
   
    NSData *jsonData = [message dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    
    NSLog(@"收到WS消息 %@ ",dic);
    
    //初始化   第一次WS 连接到服务器  服务器会发送一个init 过来 这个时候后 我们去走接口进行和WS 绑定
    if ([dic[@"type"] isEqualToString:@"init"]) {//登录
        NSString *gameTypeString;
        switch (_gameType) {
            case GameTypeBeijingRacing:gameTypeString = @"pk10"; break;
            case GameTypeChongqingTimeColor:gameTypeString = @"cqssc"; break;
            case GameTypeLuckyAirship:gameTypeString = @"xyft"; break;
            default:break;
        }
        [_webSocket send:[self loginRoomWithPalyType:gameTypeString]];
    }else if([dic[@"type"] isEqualToString:@"login"]){//登录成功
        _userMessageInfoModel = [CCUserMessageInfoModel modelWithDictionary:dic];
    }else if([dic[@"type"] isEqualToString:@"count"]) {//在线人数
        if (self.returningNum) {
            NSString *number = [NSString stringWithFormat:@"%@",[dic objectForKey:@"content"]];
            self.returningNum(number);
        }
    }else if ([dic[@"type"] isEqualToString:@"ping"]){//心跳包机制
        NSDictionary *dict = @{@"type":@"pong"};
        NSString *str = [self DataTOjsonString:dict];
        [_webSocket send:str];
    }else if([dic[@"type"] isEqualToString:@"logout"]){
        
    }else{
        if (self.delegate &&[self.delegate respondsToSelector:@selector(getMessageFromSocket:)]) {
             [self.delegate getMessageFromSocket:dic];
        }
      
    }
    
}


-(void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean{
    [self openSocket];
}


-(void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload{
    
}
    
//断网重联
- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error{
    [self closeSocket];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self openSocket];
    });
}

//send数据转化成json字符串
- (void)sendMessage:(NSDictionary *)messageDic {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:messageDic options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    [_webSocket send:jsonString];
}


//转json
-(NSString*)DataTOjsonString:(id)object{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}



#pragma 发送消息及下注

- (void)sendTalkMessageWithSendMessageModel:(CCSendMessageModel *)sendMessageModel{
    NSArray *bettingArray = [sendMessageModel.message componentsSeparatedByString:@"/"];
    if (bettingArray.count == 3) {
        [_webSocket send:[self betWithContent:sendMessageModel.message andBetGame:sendMessageModel.betGame]];
    }else{
        [_webSocket send:[self sendMessageWithContent:sendMessageModel.message]];
    }
}

//发送消息
-(NSString *)sendMessageWithContent:(NSString *)content{
    NSMutableDictionary *messagDictionary = [NSMutableDictionary dictionary];
    [messagDictionary setObject:@"say" forKey:@"type"];
    [messagDictionary setObject:_userMessageInfoModel.client_id forKey:@"from_client_id"];
    [messagDictionary setObject:_userMessageInfoModel.client_name forKey:@"from_client_name"];
    [messagDictionary setObject:@"all" forKey:@"to_client_id"];
    [messagDictionary setObject:content forKey:@"content"];
    [messagDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.headimg forKey:@"headimg"];
    
    NSString *messageString = [self DataTOjsonString:messagDictionary];
    return messageString;
}
//下注
-(NSString *)betWithContent:(NSString *)content andBetGame:(NSString *)betGame{
    NSMutableDictionary *messagDictionary = [NSMutableDictionary dictionary];
    [messagDictionary setObject:@"bets" forKey:@"type"];
    [messagDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.utoken forKey:@"utoken"];
    [messagDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.username forKey:@"username"];
    [messagDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.headimg forKey:@"headimg"];
    [messagDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.uroomid forKey:@"room_id"];
    [messagDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.showid forKey:@"show_id"];
    [messagDictionary setObject:betGame forKey:@"BetGame"];
    [messagDictionary setObject:content forKey:@"content"];
    
    NSLog(@"messagDictionary:%@",messagDictionary);
    
    NSString *messageString = [self DataTOjsonString:messagDictionary];
    return messageString;
}

//登录房间
-(NSString *)loginRoomWithPalyType:(NSString *)palyType{
    NSMutableDictionary *messagDictionary = [NSMutableDictionary dictionary];
    [messagDictionary setObject:@"login" forKey:@"type"];
    [messagDictionary setObject:[AppDelegate sharedApplicationDelegate].userInfoModel.username forKey:@"client_name"];
    [messagDictionary setObject:[NSString stringWithFormat:@"%@%@",[AppDelegate sharedApplicationDelegate].userInfoModel.uroomid,palyType] forKey:@"room_id"];
    
    NSString *messageString = [self DataTOjsonString:messagDictionary];
    return messageString;
}

//发送
- (void)sendTalkMessage:(NSString *)message{
    [_webSocket send:message];
}

-(void)setGameType:(GameType )gameType{
    if (_gameType == gameType) {
        return;
    }
    _gameType = gameType;
    [self closeSocket];
    [self openSocket];
}
@end
