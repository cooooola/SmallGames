//
//  CCPersonalAccountRecordSectionHeaderView.h
//  SmallGames
//
//  Created by hello on 2018/9/23.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBaseView.h"

@interface CCPersonalAccountRecordSectionHeaderView : CCBaseView
@property(nonatomic,copy)void(^clickAccountHistoryBtn)(void);
@property(nonatomic,strong)NSString *viewTitleString;

@property(nonatomic,strong)UILabel *timeLabel;
//@property(nonatomic,strong)UILabel *periodLabel;
@property(nonatomic,strong)UILabel *noteLabel;
@property(nonatomic,strong)UILabel *betAmountLabel;
@property(nonatomic,strong)UILabel *profitLossLabel;
@end
