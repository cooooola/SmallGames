//
//  CCGameDocumentaryHeaderView.h
//  SmallGames
//
//  Created by hello on 2018/9/27.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBaseView.h"
#import "CCGameDocumentaryModel.h"

@interface CCGameDocumentaryHeaderView : CCBaseView
@property(nonatomic,strong)CCGameDocumentaryModel *gameDocumentaryModel;
@property(nonatomic,copy)void(^clickStatusSwitchBtn)(BOOL status);
@property(nonatomic,copy)void(^clickModifyOddsBtn)(void);
@end
