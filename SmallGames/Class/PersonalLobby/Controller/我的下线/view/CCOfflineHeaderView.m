//
//  CCOfflineHeaderView.m
//  SmallGames
//
//  Created by hello on 2018/9/23.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCOfflineHeaderView.h"

@interface CCOfflineHeaderView()
@property(nonatomic,strong)UIView *lineView_one;
@property(nonatomic,strong)UIView *lineView_two;
@property(nonatomic,strong)UIView *lineView_three;
@property(nonatomic,strong)UIView *lineView_four;

@property(nonatomic,strong)UIView *titleView;
@property(nonatomic,strong)UIView *numberView;
@property(nonatomic,strong)UIView *weekView;

@property(nonatomic,strong)UILabel *userBoonLabel;
@property(nonatomic,strong)UILabel *receivedLabel;
@property(nonatomic,strong)UILabel *unaccalimedLabel;

@property(nonatomic,strong)UILabel *userBoonNumberLabel;
@property(nonatomic,strong)UILabel *receivedNumberLabel;
@property(nonatomic,strong)UILabel *unaccalimedNumberLabel;

@property(nonatomic,strong)UIButton *receiveButton;
@property(nonatomic,strong)UIButton *showLastWeekButton;

@property(nonatomic,strong)UILabel *showTimeLabel;

@end

@implementation CCOfflineHeaderView

-(void)setOfflineBoonModel:(CCOfflineBoonModel *)offlineBoonModel{
    _offlineBoonModel = offlineBoonModel;
    self.userBoonNumberLabel.text = offlineBoonModel.fanshui;
    self.receivedNumberLabel.text = offlineBoonModel.dl_fanshui;
    if (offlineBoonModel.yl_fanshui) {
        self.unaccalimedNumberLabel.text = offlineBoonModel.yl_fanshui;
    }else{
        self.unaccalimedNumberLabel.text = @"0";
    }
    self.showLastWeekButton.selected = offlineBoonModel.isLastWeek;
    if (offlineBoonModel.isLastWeek) {
        self.showTimeLabel.text = [NSString stringWithFormat:@"上周时间：%@",offlineBoonModel.last_week_sj];
    }else{
        self.showTimeLabel.text = [NSString stringWithFormat:@"本周时间：%@",offlineBoonModel.this_week_sj];
    }
}

-(void)initView{
    [super initView];
    
    [self addSubview:self.lineView_one];
    [self.lineView_one mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.left.right.top.equalTo(self);
    }];
    
    [self addSubview:self.lineView_two];
    [self.lineView_two mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.left.right.equalTo(self);
        make.top.equalTo(self).offset(35);
    }];
    
    [self addSubview:self.lineView_three];
    [self.lineView_three mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.left.right.equalTo(self);
        make.bottom.equalTo(self).offset(-40);
    }];
    
    [self addSubview:self.lineView_four];
    [self.lineView_four mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.left.right.bottom.equalTo(self);
    }];
    
    
    [self addSubview:self.titleView];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView_one.mas_bottom);
        make.bottom.equalTo(self.lineView_two.mas_top);
        make.left.right.equalTo(self);
    }];
    
    [self addSubview:self.numberView];
    [self.numberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView_two.mas_bottom);
        make.bottom.equalTo(self.lineView_three.mas_top);
        make.left.right.equalTo(self);
    }];
    
    [self addSubview:self.weekView];
    [self.weekView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView_three.mas_bottom);
        make.bottom.equalTo(self.lineView_four.mas_top);
        make.left.right.equalTo(self);
    }];
    
    
    [self.titleView addSubview:self.userBoonLabel];
    [self.userBoonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.top.equalTo(self.titleView);
        make.width.equalTo(@(MCScreenWidth/4));
    }];
    
    [self.titleView addSubview:self.receivedLabel];
    [self.receivedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self.titleView);
        make.width.equalTo(@(MCScreenWidth/4));
        make.left.equalTo(self.userBoonLabel.mas_right);
    }];
    
    [self.titleView addSubview:self.unaccalimedLabel];
    [self.unaccalimedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self.titleView);
        make.width.equalTo(@(MCScreenWidth/4));
        make.left.equalTo(self.receivedLabel.mas_right);
    }];
    
    [self.numberView addSubview:self.userBoonNumberLabel];
    [self.userBoonNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.top.equalTo(self.numberView);
        make.width.equalTo(@(MCScreenWidth/4));
    }];
    
    [self.numberView addSubview:self.receivedNumberLabel];
    [self.receivedNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self.numberView);
        make.width.equalTo(@(MCScreenWidth/4));
        make.left.equalTo(self.userBoonNumberLabel.mas_right);
    }];
    
    [self.numberView addSubview:self.unaccalimedNumberLabel];
    [self.unaccalimedNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self.numberView);
        make.width.equalTo(@(MCScreenWidth/4));
        make.left.equalTo(self.receivedNumberLabel.mas_right);
    }];
    
    [self.numberView addSubview:self.receiveButton];
    [self.receiveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.numberView).offset(-10);
        make.width.equalTo(@60);
        make.height.equalTo(@25);
        make.centerY.equalTo(self.numberView);
    }];
    
    [self.weekView addSubview:self.showLastWeekButton];
    [self.showLastWeekButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.weekView).offset(10);
        make.width.equalTo(@75);
        make.height.equalTo(@25);
        make.centerY.equalTo(self.weekView);
    }];
    
    [self.weekView addSubview:self.showTimeLabel];
    [self.showTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.weekView).offset(-10);
        make.centerY.equalTo(self.weekView);
    }];
    
}

-(UIView *)lineView_one{
    if (!_lineView_one) {
        _lineView_one = [[UIView alloc]init];
        _lineView_one.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView_one;
}

-(UIView *)lineView_two{
    if (!_lineView_two) {
        _lineView_two = [[UIView alloc]init];
        _lineView_two.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView_two;
}

-(UIView *)lineView_three{
    if (!_lineView_three) {
        _lineView_three = [[UIView alloc]init];
        _lineView_three.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView_three;
}

-(UIView *)lineView_four{
    if (!_lineView_four) {
        _lineView_four = [[UIView alloc]init];
        _lineView_four.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView_four;
}

-(UIView *)titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc]init];
        _titleView.backgroundColor = [UIColor whiteColor];
    }
    return _titleView;
}

-(UIView *)numberView{
    if (!_numberView) {
        _numberView = [[UIView alloc]init];
        _numberView.backgroundColor = MCUIColorFromRGB(0xFDFBF3);
    }
    return _numberView;
}

-(UIView *)weekView{
    if (!_weekView) {
        _weekView = [[UIView alloc]init];
        _weekView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    }
    return _weekView;
}


-(UILabel *)userBoonLabel{
    if (_userBoonLabel == nil) {
        _userBoonLabel = [[UILabel alloc]init];
        _userBoonLabel.font = [UIFont systemFontOfSize:12];
        _userBoonLabel.textColor = MCUIColorFromRGB(0x999999);
        _userBoonLabel.textAlignment = NSTextAlignmentCenter;
        _userBoonLabel.text = @"福利";
    }
    return _userBoonLabel;
}

-(UILabel *)receivedLabel{
    if (_receivedLabel == nil) {
        _receivedLabel = [[UILabel alloc]init];
        _receivedLabel.font = [UIFont systemFontOfSize:12];
        _receivedLabel.textColor = MCUIColorFromRGB(0x999999);
        _receivedLabel.textAlignment = NSTextAlignmentCenter;
        _receivedLabel.text = @"本周已领取福利";
    }
    return _receivedLabel;
}

-(UILabel *)unaccalimedLabel{
    if (_unaccalimedLabel == nil) {
        _unaccalimedLabel = [[UILabel alloc]init];
        _unaccalimedLabel.font = [UIFont systemFontOfSize:12];
        _unaccalimedLabel.textColor = MCUIColorFromRGB(0x999999);
        _unaccalimedLabel.textAlignment = NSTextAlignmentCenter;
        _unaccalimedLabel.text = @"未领取福利";
    }
    return _unaccalimedLabel;
}

-(UILabel *)userBoonNumberLabel{
    if (_userBoonNumberLabel == nil) {
        _userBoonNumberLabel = [[UILabel alloc]init];
        _userBoonNumberLabel.font = [UIFont systemFontOfSize:12];
        _userBoonNumberLabel.textColor = MCUIColorFromRGB(0x999999);
        _userBoonNumberLabel.textAlignment = NSTextAlignmentCenter;
        _userBoonNumberLabel.text = @"10000";
    }
    return _userBoonNumberLabel;
}

-(UILabel *)receivedNumberLabel{
    if (_receivedNumberLabel == nil) {
        _receivedNumberLabel = [[UILabel alloc]init];
        _receivedNumberLabel.font = [UIFont systemFontOfSize:12];
        _receivedNumberLabel.textColor = MCUIColorFromRGB(0x999999);
        _receivedNumberLabel.textAlignment = NSTextAlignmentCenter;
        _receivedNumberLabel.text = @"100";
    }
    return _receivedNumberLabel;
}

-(UILabel *)unaccalimedNumberLabel{
    if (_unaccalimedNumberLabel == nil) {
        _unaccalimedNumberLabel = [[UILabel alloc]init];
        _unaccalimedNumberLabel.font = [UIFont systemFontOfSize:12];
        _unaccalimedNumberLabel.textColor = MCUIColorFromRGB(0x999999);
        _unaccalimedNumberLabel.textAlignment = NSTextAlignmentCenter;
        _unaccalimedNumberLabel.text = @"3000";
    }
    return _unaccalimedNumberLabel;
}

-(UIButton *)receiveButton{
    if (!_receiveButton) {
        _receiveButton = [[UIButton alloc]init];
        [_receiveButton.titleLabel setFont:[UIFont systemFontOfSize:13]];
        [_receiveButton setBackgroundColor:MCUIColorFromRGB(0x6AB5D9)];
        [_receiveButton setTitle:@"领取" forState:UIControlStateNormal];
        _receiveButton.layer.cornerRadius = 3;
        [_receiveButton addTarget:self action:@selector(clickReceiveButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _receiveButton;
}

-(UIButton *)showLastWeekButton{
    if (!_showLastWeekButton) {
        _showLastWeekButton = [[UIButton alloc]init];
        [_showLastWeekButton.titleLabel setFont:[UIFont systemFontOfSize:13]];
        [_showLastWeekButton setBackgroundColor:MCUIColorFromRGB(0x6AB5D9)];
        [_showLastWeekButton setTitle:@"查看上周" forState:UIControlStateNormal];
        [_showLastWeekButton setTitle:@"查看本周" forState:UIControlStateSelected];
        _showLastWeekButton.selected = NO;
        _showLastWeekButton.layer.cornerRadius = 3;
        [_showLastWeekButton addTarget:self action:@selector(clickShowLastWeekButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showLastWeekButton;
}

-(UILabel *)showTimeLabel{
    if (_showTimeLabel == nil) {
        _showTimeLabel = [[UILabel alloc]init];
        _showTimeLabel.font = [UIFont systemFontOfSize:12];
        _showTimeLabel.textColor = MCUIColorFromRGB(0x666666);
        _showTimeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _showTimeLabel;
}

-(void)clickReceiveButton{
    if (self.clickReceiveBtn) {
        self.clickReceiveBtn();
    }
    
}

-(void)clickShowLastWeekButton:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (self.clickShowLastWeekBtn) {
        self.clickShowLastWeekBtn(sender.selected);
    }
}

@end
