//
//  CCUnsettledBetSceionView.h
//  SmallGames
//
//  Created by hello on 2018/9/23.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBaseView.h"
#import "CCPersonalBettingRecordModel.h"

@interface CCUnsettledBetSceionView : CCBaseView
@property(nonatomic,strong)CCPersonalBettingRecordModel *personalBettingRecordModel;
@property(nonatomic,strong)NSString *sceionTitle;
@end
