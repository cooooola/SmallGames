//
//  CCGameFeaturesView.m
//  SmallGames
//
//  Created by hello on 2018/10/5.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameFeaturesView.h"

@implementation CCGameFeaturesView

-(void)initView{
    UIView *previousView;
    NSArray *buttonArray = [NSArray arrayWithObjects:@"shangfen",@"mingxi",@"liushui",@"guize",@"kefu",@"zhongxin", nil];
    for (int i = 0; i < buttonArray.count; i ++) {
        UIButton *button = [[UIButton alloc]init];
        button.tag = i;
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 17.5;
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[buttonArray objectAtIndex:i]]] forState:UIControlStateNormal];
        [self addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.width.height.equalTo(@35);
            if (previousView) {
                make.top.equalTo(previousView.mas_bottom).offset(10);
            }else{
                make.top.equalTo(self).offset(10);
            }
        }];
        
        previousView = button;
    }
}

-(void)clickButton:(UIButton *)sender{
    GameChatType gameChatType = (GameChatType)sender.tag;
    if (self.clickBtn) {
        self.clickBtn(gameChatType);
    }
}

@end
