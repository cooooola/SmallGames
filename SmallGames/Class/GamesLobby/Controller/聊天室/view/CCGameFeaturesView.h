//
//  CCGameFeaturesView.h
//  SmallGames
//
//  Created by hello on 2018/10/5.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBaseView.h"

@interface CCGameFeaturesView : CCBaseView
@property(nonatomic,copy)void(^clickBtn)(GameChatType gameChatType);
@end
