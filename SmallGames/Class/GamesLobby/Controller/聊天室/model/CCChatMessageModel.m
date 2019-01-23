//
//  CCChatMessageModel.m
//  SmallGames
//
//  Created by hello on 2018/10/4.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCChatMessageModel.h"

@implementation CCChatMessageModel

-(NSString *)content{
    return [_content stringByReplacingOccurrencesOfString:@"<br>" withString:@""];
}

-(float)returnContentHight{
    float contenMaxW = MCScreenWidth-55-50-30;
    CGFloat contenH = [self.content heightForFont:[UIFont systemFontOfSize:14] width:contenMaxW]+5;
    return contenH;
}

-(float)returnContentWidth{
    float contenMaxW = MCScreenWidth-55-50-30;
    CGFloat contenW = [self.content widthForFont:[UIFont systemFontOfSize:14]]+5;
    if (contenW >= contenMaxW) {
        contenW = contenMaxW;
    }
    return contenW;
}


-(float)returnCellHight{
    float cellH = 40;
    cellH += [self returnContentHight];
    
    return cellH;
}
@end
