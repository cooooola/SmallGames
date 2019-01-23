//
//  CCSendMessageModel.h
//  SmallGames
//
//  Created by hello on 2018/11/3.
//  Copyright © 2018年 hello. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCSendMessageModel : NSObject
@property(nonatomic,strong)NSString *message;
@property(nonatomic,strong)NSString *betGame;
@property(nonatomic,assign)BOOL isBetting;
@end
