//
//  CCJsonTool.m
//  SmallGames
//
//  Created by hello on 2018/11/1.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCJsonTool.h"

@implementation CCJsonTool
+(id)JsonToolWithDataConvertedJsonWhitData:(id)data{

    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

    return jsonObject;
}

//+(id)JsonToolWithDataConvertedJsonWhitData:(id)data{
//    NSString *receiveStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//
//    NSData * datas = [receiveStr dataUsingEncoding:NSUTF8StringEncoding];
//
//    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:datas options:NSJSONReadingMutableLeaves error:nil];
//
//    return jsonDict;
//}

+(NSString *)JsonToolGetTimeStrWithString:(NSString *)str{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *tempDate = [dateFormatter dateFromString:str];
    NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)[tempDate timeIntervalSince1970]];
    return timeStr;
}

+(NSString *)JsonToolDataTimeStrWithString:(NSString *)str{
    NSTimeInterval interval    = [str doubleValue];
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString       = [formatter stringFromDate: date];
    return dateString;
}
@end
