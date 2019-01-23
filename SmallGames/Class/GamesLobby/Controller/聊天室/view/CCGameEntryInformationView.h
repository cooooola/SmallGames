//
//  CCGameEntryInformationView.h
//  SmallGames
//
//  Created by hello on 2018/9/27.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBaseView.h"

@interface CCGameEntryInformationView : CCBaseView
@property(nonatomic,copy)void(^clickSendMessageBtn)(NSString *message,BOOL isBetting,NSString *BetGame);
@property(nonatomic,assign)GameType gameType;
@end
