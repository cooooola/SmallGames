//
//  CCChatMessageModel.h
//  SmallGames
//
//  Created by hello on 2018/10/4.
//  Copyright © 2018年 hello. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCChatMessageModel : NSObject
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSString *from_client_name;
@property(nonatomic,strong)NSString *from_client_id;
@property(nonatomic,strong)NSString *from_show_id;
@property(nonatomic,strong)NSString *head_img_url;
@property(nonatomic,strong)NSString *from_client_headimg;
@property(nonatomic,strong)NSString *time;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *uid;


-(float)returnCellHight;
-(float)returnContentWidth;
-(float)returnContentHight;

@end
