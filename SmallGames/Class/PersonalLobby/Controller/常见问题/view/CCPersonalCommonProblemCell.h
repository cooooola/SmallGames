//
//  CCPersonalCommonProblemCell.h
//  SmallGames
//
//  Created by hello on 2018/9/22.
//  Copyright © 2018年 hello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCommonProblemModel.h"

@interface CCPersonalCommonProblemCell : UITableViewCell
@property(nonatomic,strong)CCCommonProblemModel *commonProblemModel;
@property(nonatomic,copy)void(^returnButtonOpenStatus)(BOOL buttonOpenStatus);
@end
