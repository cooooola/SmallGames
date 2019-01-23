//
//  CCGameDocumentaryRuleView.m
//  SmallGames
//
//  Created by hello on 2018/9/29.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameDocumentaryRuleView.h"


@interface CCGameDocumentaryRuleView()
@property(nonatomic,strong)UIView *showView;
@property(nonatomic,strong)UIButton *confirmButton;
@property(nonatomic,strong)UILabel *titleLabel;
@end

@implementation CCGameDocumentaryRuleView

-(void)initView{
    [super initView];
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    [self addSubview:self.showView];
    [self.showView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@(MCScreenWidth-100));
        make.height.equalTo(@250);
    }];
    
    [self.showView addSubview:self.confirmButton];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.showView);
        make.width.height.equalTo(@50);
    }];
    
    [self.showView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.showView).offset(20);
        make.centerX.equalTo(self.showView);
    }];
    
    UIView *previousView = nil;
    NSArray *ruleArray = [NSArray arrayWithObjects:@"点击跟投结束才会停止跟投",@"退出游戏退出大厅跟投游戏",@"分数不足时可能系统会先投一些分数够的跟投。请妥善注意您的分数是否足够游戏",@"如何跟投，在游戏界面点击您想跟投玩家的头像，输入您想要跟投的倍数点击跟投即可", nil];
    for (int i = 0; i < ruleArray.count; i++) {
        UILabel *label = [[UILabel alloc]init];
        label.text = [NSString stringWithFormat:@"%@",[ruleArray objectAtIndex:i]];
        label.textColor = MCUIColorFromRGB(0x9A9A9A);
        label.font = [UIFont systemFontOfSize:12];
        label.numberOfLines = 0;
        [self.showView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.showView).offset(35);
            if (previousView) {
                make.top.equalTo(previousView.mas_bottom).offset(5);
            }else{
                make.top.equalTo(self.titleLabel.mas_bottom).offset(25);
            }
            make.right.equalTo(self.showView).offset(-25);
        }];
        previousView = label;
        
        UILabel *line = [[UILabel alloc]init];
        line.backgroundColor = MCUIColorFromRGB(0x00A0E9);
        [self.showView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label);
            make.right.equalTo(label.mas_left).offset(-5);
            make.width.equalTo(@2);
            make.height.equalTo(@10);
        }];
        
    }
    
}

-(UIView *)showView{
    if (!_showView) {
        _showView = [[UIView alloc]init];
        _showView.backgroundColor = [UIColor whiteColor];
        _showView.layer.masksToBounds = YES;
        _showView.layer.cornerRadius = 10;
    }
    return _showView;
}

- (UIButton *)confirmButton {
    if (_confirmButton == nil) {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmButton setImage:[UIImage imageNamed:@"×"] forState:UIControlStateNormal];
        [_confirmButton addTarget:self action:@selector(clickConfirmButton) forControlEvents:UIControlEventTouchUpInside];
    } return _confirmButton;
}

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textColor = MCUIColorFromRGB(0x333333);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = [NSString stringWithFormat:@"跟单规则"];
    }
    return _titleLabel;
}

-(void)clickConfirmButton{
    [self removeFromSuperview];
}
@end
