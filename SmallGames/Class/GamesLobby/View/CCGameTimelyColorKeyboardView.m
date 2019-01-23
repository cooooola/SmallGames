//
//  CCGameTimelyColorKeyboardView.m
//  SmallGames
//
//  Created by hello on 2018/10/1.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameTimelyColorKeyboardView.h"

@implementation CCGameTimelyColorKeyboardView

-(void)initView{
    self.backgroundColor = MCUIColorFromRGB(0xEEEEEE);
    NSArray *keyboardArray = [NSArray arrayWithObjects:@"豹子",@"对子",@"顺子",@"杂六",@"半顺",@"前",@"中",@"后",@"包",@"和",@"大",@"1",@"2",@"3",@"x",@"小",@"4",@"5",@"6",@"龙",@"单",@"7",@"8",@"9",@"虎",@"双",@"总",@"0",@"/",@"关闭", nil];
    
    UIView *previousView;
    float intervalW = 7;
    float intervalH = 5;
    float buttonW = (MCScreenWidth - 6*intervalW)/5;
    float buttonH = (280-8*2-5*5)/6;
    for (int i = 0; i < keyboardArray.count; i ++) {
        UIButton *button = [[UIButton alloc]init];
        button.tag = i;
        [button.titleLabel setFont:[UIFont systemFontOfSize:16]];
        [button setTitle:[NSString stringWithFormat:@"%@",[keyboardArray objectAtIndex:i]] forState:UIControlStateNormal];
        [button setTitleColor:MCUIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor whiteColor]];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 3;
        [self addSubview:button];
        
        int bh = i%5;
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            if (bh == 0) {
                make.left.equalTo(self).offset(intervalW);
                if (previousView) {
                    if (i == 15||i == 20||i == 25) {
                        make.top.equalTo(previousView.mas_bottom);
                        button.layer.cornerRadius = 0;
                        make.height.equalTo(@(buttonH+intervalH));
                    }else{
                        make.top.equalTo(previousView.mas_bottom).offset(5);
                        make.height.equalTo(@(buttonH));
                    }
                }else{
                    make.top.equalTo(self).offset(8);
                    make.height.equalTo(@(buttonH));
                }
            }else{
                make.left.equalTo(previousView.mas_right).offset(intervalW);
                make.bottom.equalTo(previousView);
                make.height.equalTo(@(buttonH));
            }
             make.width.equalTo(@(buttonW));
        }];
        previousView = button;
        if ([button.titleLabel.text isEqualToString:@"龙"]) {
            [button setTitleColor:MCUIColorFromRGB(0xFF0000) forState:UIControlStateNormal];
        }
        if ([button.titleLabel.text isEqualToString:@"虎"]) {
            [button setTitleColor:MCUIColorFromRGB(0x067BE5) forState:UIControlStateNormal];
        }
        if ([button.titleLabel.text isEqualToString:@"关闭"]) {
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundColor:MCUIColorFromRGB(0xDC901C)];
        }
        if ([button.titleLabel.text isEqualToString:@"x"]) {
            [button setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
        }
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)clickButton:(UIButton *)sender{
    if (self.clickBtn) {
        self.clickBtn(sender.titleLabel.text);
    }
}

@end
