//
//  CCPersonalAccountRecordCell.h
//  SmallGames
//
//  Created by hello on 2018/9/23.
//  Copyright © 2018年 hello. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCPersonalAccountRecordCell : UITableViewCell
@property(nonatomic,copy)void(^clickAccountHistory)(NSString *timestring);
@property(nonatomic,strong)NSString *timeString;//时间
@property(nonatomic,strong)NSString *noteString;//注数
@property(nonatomic,strong)NSString *amountString;//金额
@property(nonatomic,strong)NSString *profitLossString;//盈亏

@end
