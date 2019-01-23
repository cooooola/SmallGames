//
//  CCPersonalAccountHistorySectionView.h
//  SmallGames
//
//  Created by hello on 2018/9/24.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBaseView.h"
#import "CCHistoryModel.h"

@interface CCPersonalAccountHistorySectionView : CCBaseView
@property(nonatomic,strong)CCHistoryModel *model;
@property(nonatomic,strong)UILabel *timeLabel;//日期
@property(nonatomic,strong)UILabel *lotteryTypeLabel;//彩票类型
@property(nonatomic,strong)UILabel *viewLabel;//查看
@end
