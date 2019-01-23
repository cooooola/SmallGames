//
//  CCOfflineBoonModel.h
//  SmallGames
//
//  Created by hello on 2018/10/7.
//  Copyright © 2018年 hello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCOfflineModel.h"

@interface CCOfflineBoonModel : NSObject
@property(nonatomic,strong)NSString *allliu;//所有下线流水
@property(nonatomic,strong)NSString *allmoney;//所有下线余额
@property(nonatomic,strong)NSString *alls;//所有下线上分
@property(nonatomic,strong)NSString *allyk;//所有下线盈亏
@property(nonatomic,strong)NSMutableArray *data;

@property(nonatomic,strong)NSString *dl_fanshui;//待领取福利
@property(nonatomic,strong)NSString *fanshui;//福利

@property(nonatomic,strong)NSString *last_week_allliu;//上周下线流水
@property(nonatomic,strong)NSString *last_week_alls;//上周下线上分
@property(nonatomic,strong)NSMutableArray *last_week_data;//上周
@property(nonatomic,strong)NSString *last_week_fanshui;//上周福利
@property(nonatomic,strong)NSString *last_week_yk;//上周下线盈亏

@property(nonatomic,strong)NSString *this_week_allliu;//本周下线流水
@property(nonatomic,strong)NSString *this_week_alls;//本周下线上分
@property(nonatomic,strong)NSMutableArray *this_week_data;//这周
@property(nonatomic,strong)NSString *this_week_fanshui;//这周福利
@property(nonatomic,strong)NSString *this_week_yk;//本周下线盈亏
@property(nonatomic,strong)NSString *yl_fanshui;//已经领取福利
@property(nonatomic,strong)NSString *this_week_sj;//本周时间
@property(nonatomic,strong)NSString *last_week_sj;//上周时间

@property(nonatomic,assign)BOOL isLastWeek;

@end
