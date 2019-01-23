//
//  CCJsonTool.h
//  SmallGames
//
//  Created by hello on 2018/11/1.
//  Copyright © 2018年 hello. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCJsonTool : NSObject


/**
 数据流转json

 @param data 数据流
 @return 数据返回
 */
+(id)JsonToolWithDataConvertedJsonWhitData:(id)data;


/**
 时间转时间戳

 @param str 时间
 @return 时间戳
 */
+(NSString *)JsonToolGetTimeStrWithString:(NSString *)str;



/**
 时间戳转时间
 
 @param str 时间戳
 @return 时间
 */
+(NSString *)JsonToolDataTimeStrWithString:(NSString *)str;

@end
