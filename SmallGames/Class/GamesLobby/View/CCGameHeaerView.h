//
//  CCGameHeaerView.h
//  SmallGames
//
//  Created by hello on 2018/9/26.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBaseView.h"

@interface CCGameHeaerView : CCBaseView
@property(nonatomic,copy)void(^clickCustomLeftBtn)(void);
@property(nonatomic,copy)void(^clickClickSoundBtn)(BOOL soundStatus);
@property(nonatomic,assign)GameType gameType;
@property(nonatomic,strong)NSString *peopleNumber;
@end
