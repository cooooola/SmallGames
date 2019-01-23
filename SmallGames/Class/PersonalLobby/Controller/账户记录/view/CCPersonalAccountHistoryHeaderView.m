//
//  CCPersonalAccountHistoryHeaderView.m
//  SmallGames
//
//  Created by hello on 2018/9/24.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalAccountHistoryHeaderView.h"
@interface CCPersonalAccountHistoryHeaderView()
@property(nonatomic,strong)UIButton *settledButton;
@property(nonatomic,strong)UIButton *unsettlementButton;
@end
@implementation CCPersonalAccountHistoryHeaderView

-(void)initView{
    [super initView];
    
    self.backgroundColor = MCUIColorFromRGB(0xEEF4F9);
    
    [self addSubview:self.settledButton];
    [self.settledButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/2));
        make.bottom.equalTo(self).offset(-9.5);
    }];
    
    [self addSubview:self.unsettlementButton];
    [self.unsettlementButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/2));
        make.bottom.equalTo(self).offset(-9.5);
    }];
}



- (UIButton *)settledButton {
    if (_settledButton == nil) {
        _settledButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _settledButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_settledButton setBackgroundColor:[UIColor whiteColor]];
        [_settledButton setTitle:@"已结算" forState:UIControlStateNormal];
        _settledButton.selected = YES;
        [_settledButton setTitleColor:MCUIColorFromRGB(0x64A0D7) forState:UIControlStateSelected];
        [_settledButton setTitleColor:MCUIColorFromRGB(0x777777) forState:UIControlStateNormal];
        [_settledButton addTarget:self action:@selector(clickSettledButton:) forControlEvents:UIControlEventTouchUpInside];
    } return _settledButton;
}

- (UIButton *)unsettlementButton {
    if (_unsettlementButton == nil) {
        _unsettlementButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _unsettlementButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_unsettlementButton setTitle:@"未结算" forState:UIControlStateNormal];
        _unsettlementButton.selected = NO;
        [_unsettlementButton setBackgroundColor:[UIColor whiteColor]];
        [_unsettlementButton setTitleColor:MCUIColorFromRGB(0x64A0D7) forState:UIControlStateSelected];
        [_unsettlementButton setTitleColor:MCUIColorFromRGB(0x777777) forState:UIControlStateNormal];
        [_unsettlementButton addTarget:self action:@selector(clickUnsettlementButton:) forControlEvents:UIControlEventTouchUpInside];
    } return _unsettlementButton;
}


-(void)clickSettledButton:(UIButton *)sender{
    if (sender.selected) {
        return;
    }
    sender.selected = !sender.selected;
    self.unsettlementButton.selected = !sender.selected;
    
    if (self.clickSettledBtn) {
        self.clickSettledBtn();
    }
    
}

-(void)clickUnsettlementButton:(UIButton *)sender{
    if (sender.selected) {
        return;
    }
    sender.selected = !sender.selected;
    self.settledButton.selected = !sender.selected;
    
    if (self.clickUnsettlementButton) {
        self.clickUnsettlementButton();
    }
}

@end
