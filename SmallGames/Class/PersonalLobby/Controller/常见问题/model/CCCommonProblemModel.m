//
//  CCCommonProblemModel.m
//  SmallGames
//
//  Created by hello on 2018/10/7.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCCommonProblemModel.h"

@implementation CCCommonProblemModel
-(float)returnContentHight{
    float ContentMaxW = MCScreenWidth - 30;
    float ContentHight = [self.content heightForFont:[UIFont systemFontOfSize:12] width:ContentMaxW]+2;
    return ContentHight;
}
-(float)returnCellHight{
    float CellHight = 0;
    CellHight = [self returnContentHight]+30;
    CellHight += 50;
    return CellHight;
}
@end
