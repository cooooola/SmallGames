//
//  CCPersonalAccountHistoryCell.h
//  SmallGames
//
//  Created by hello on 2018/9/24.
//  Copyright © 2018年 hello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCHistoryModel.h"

@interface CCPersonalAccountHistoryCell : UITableViewCell
@property(nonatomic,strong)CCHistoryModel *model;
@property(nonatomic,copy)void(^clickDayDetailsBtn)(CCHistoryModel *model);
@property(nonatomic,copy)void(^clickPeriodBtn)(CCHistoryModel *model);
@end
