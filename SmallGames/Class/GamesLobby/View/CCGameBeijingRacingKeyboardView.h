//
//  CCGameBeijingRacingKeyboardView.h
//  SmallGames
//
//  Created by hello on 2018/10/1.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBaseView.h"

@interface CCGameBeijingRacingKeyboardView : CCBaseView
@property(nonatomic,copy)void(^clickBtn)(NSString *inputString);
@end
