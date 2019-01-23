//
//  CCPersonalAccountHistoryHeaderView.h
//  SmallGames
//
//  Created by hello on 2018/9/24.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBaseView.h"

@interface CCPersonalAccountHistoryHeaderView : CCBaseView
@property(nonatomic,strong)void(^clickSettledBtn)(void);
@property(nonatomic,strong)void(^clickUnsettlementButton)(void);
@end
