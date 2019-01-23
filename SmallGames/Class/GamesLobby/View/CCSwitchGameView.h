//
//  CCSwitchGameView.h
//  SmallGames
//
//  Created by hello on 2018/9/26.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBaseView.h"

@interface CCSwitchGameView : CCBaseView
@property(nonatomic,copy)void(^clickSwitchGameBtn)(GameType gameType);
@end
