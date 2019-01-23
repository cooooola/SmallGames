//
//  CCCommonProblemModel.h
//  SmallGames
//
//  Created by hello on 2018/10/7.
//  Copyright © 2018年 hello. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCCommonProblemModel : NSObject
@property(nonatomic,strong)NSString *content;//内容
@property(nonatomic,strong)NSString *title;//标题
@property(nonatomic,assign)BOOL isOpen;//开关状态

-(float)returnContentHight;
-(float)returnCellHight;
@end
