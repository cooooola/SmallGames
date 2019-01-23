//
//  CCGameFootView.h
//  SmallGames
//
//  Created by hello on 2018/9/18.
//  Copyright © 2018年 hello. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCGameFootView : UIView
@property(nonatomic,copy)void(^clickGameHomeBtn)(void);
@property(nonatomic,copy)void(^clickCustomerServiceBtn)(void);
@property(nonatomic,copy)void(^clickPersonalHomeBtn)(void);
@end
