//
//  CCGameDocumentaryView.h
//  SmallGames
//
//  Created by hello on 2018/9/29.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBaseView.h"
#import "CCChatMessageModel.h"

@interface CCGameDocumentaryView : CCBaseView
@property(nonatomic,strong)CCChatMessageModel *chatMessageModel;
@property(nonatomic,copy)void(^clickRuleBtn)(void);
@property(nonatomic,copy)void(^clickConfirmBtn)(NSString *magnification,NSString *userShowid);

@end
