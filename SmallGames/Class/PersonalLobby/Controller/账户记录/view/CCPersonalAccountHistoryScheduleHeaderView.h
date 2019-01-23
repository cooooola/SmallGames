//
//  CCPersonalAccountHistoryScheduleHeaderView.h
//  SmallGames
//
//  Created by hello on 2018/9/25.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBaseView.h"

@interface CCPersonalAccountHistoryScheduleHeaderView : CCBaseView
@property(nonatomic,strong)UILabel *timeLabel;//期号
@property(nonatomic,strong)UILabel *periodLabel;//期数
@property(nonatomic,strong)UILabel *amountLabel;//金额
@property(nonatomic,strong)UILabel *profitLossLabel;//盈亏
@end
