//
//  CCGameDocumentaryModel.m
//  SmallGames
//
//  Created by hello on 2018/10/8.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameDocumentaryModel.h"

@implementation CCGameDocumentaryModel

-(NSString *)starttime{
    NSString *timestring = [CCJsonTool JsonToolDataTimeStrWithString:_starttime];
    return timestring;
}
@end
