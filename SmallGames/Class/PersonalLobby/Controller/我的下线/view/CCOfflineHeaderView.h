//
//  CCOfflineHeaderView.h
//  SmallGames
//
//  Created by hello on 2018/9/23.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBaseView.h"
#import "CCOfflineBoonModel.h"

@interface CCOfflineHeaderView : CCBaseView
@property(nonatomic,strong)CCOfflineBoonModel *offlineBoonModel;
@property(nonatomic,copy)void(^clickReceiveBtn)(void);
@property(nonatomic,copy)void(^clickShowLastWeekBtn)(BOOL isLastWeek);
@end
