//
//  CCGameUserActionView.h
//  SmallGames
//
//  Created by hello on 2018/9/26.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBaseView.h"

@interface CCGameUserActionView : CCBaseView

/**
 切换游戏
 */
@property(nonatomic,copy)void(^clickGameTypeBtn)(void);

/**
 长龙
 */
@property(nonatomic,copy)void(^clickLongDragonBtn)(void);


/**
 刷新
 */
@property(nonatomic,copy)void(^clickRefreshBtn)(void);



/**
 跟单
 */
@property(nonatomic,copy)void(^clickDocumentaryBtn)(void);

@property(nonatomic,copy)void(^clickAnimationORTrend)(BOOL animationORTrend);

@property(nonatomic,assign)GameType gameType;
@end
