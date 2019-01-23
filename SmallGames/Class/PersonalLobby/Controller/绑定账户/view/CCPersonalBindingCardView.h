//
//  CCPersonalBindingCardView.h
//  SmallGames
//
//  Created by hello on 2018/9/21.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBaseView.h"
@interface CCPersonalBindingCardView : CCBaseView
@property(nonatomic,assign)BaseViewType viewType;
@property(nonatomic,copy)void(^clickConfirmBtn)(NSString *baseViewString);
@end
