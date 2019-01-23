//
//  CCGameModifyOddsView.h
//  SmallGames
//
//  Created by hello on 2018/9/29.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBaseView.h"
#import "CCGameDocumentaryModel.h"

@interface CCGameModifyOddsView : CCBaseView

@property(nonatomic,strong)CCGameDocumentaryModel *gameDocumentaryModel;

@property(nonatomic,copy)void(^clickConfirmButtonBtn)(NSString *magnification);

@end
