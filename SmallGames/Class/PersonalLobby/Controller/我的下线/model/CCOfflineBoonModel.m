//
//  CCOfflineBoonModel.m
//  SmallGames
//
//  Created by hello on 2018/10/7.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCOfflineBoonModel.h"

@implementation CCOfflineBoonModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [CCOfflineModel class],
             @"last_week_data" : [CCOfflineModel class],
             @"this_week_data" : [CCOfflineModel class]
             };
}
@end
