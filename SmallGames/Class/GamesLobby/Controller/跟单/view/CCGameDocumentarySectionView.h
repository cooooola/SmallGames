//
//  CCGameDocumentarySectionView.h
//  SmallGames
//
//  Created by hello on 2018/9/27.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBaseView.h"

@interface CCGameDocumentarySectionView : CCBaseView
@property(nonatomic,strong)UILabel *timeLabel;//时间
@property(nonatomic,strong)UILabel *periodLabel;//期数
@property(nonatomic,strong)UILabel *playLabel;//玩法
@property(nonatomic,strong)UILabel *amountLabel;//金额
@property(nonatomic,strong)UILabel *profitLossLabel;//盈亏
@property(nonatomic,strong)UILabel *statusLabel;//状态
@end
