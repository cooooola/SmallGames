//
//  CCPersonalAccountRecordSectionHeaderView.m
//  SmallGames
//
//  Created by hello on 2018/9/23.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalAccountRecordSectionHeaderView.h"

@interface CCPersonalAccountRecordSectionHeaderView()
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UIButton *accountHistoryButton;

@end

@implementation CCPersonalAccountRecordSectionHeaderView

-(void)setViewTitleString:(NSString *)viewTitleString{
    self.timeLabel.text = viewTitleString;
}


-(void)initView{
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.left.right.bottom.equalTo(self);
    }];
    
    
    [self addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/3));
    }];
    
    [self addSubview:self.accountHistoryButton];
    [self.accountHistoryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.timeLabel);
    }];
    
//    [self addSubview:self.periodLabel];
//    [self.periodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.equalTo(self);
//        make.width.equalTo(@(MCScreenWidth/6));
//        make.left.equalTo(self.timeLabel.mas_right);
//    }];
    
    [self addSubview:self.noteLabel];
    [self.noteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/6));
        make.left.equalTo(self.timeLabel.mas_right);
    }];
    
    [self addSubview:self.betAmountLabel];
    [self.betAmountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/6));
        make.left.equalTo(self.noteLabel.mas_right);
    }];
    
    [self addSubview:self.profitLossLabel];
    [self.profitLossLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.betAmountLabel.mas_right);
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/3));
    }];
    
    
}


-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView;
}

-(UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = MCUIColorFromRGB(0x999999);
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.text = @"日期";
    }
    return _timeLabel;
}

//-(UILabel *)periodLabel{
//    if (_periodLabel == nil) {
//        _periodLabel = [[UILabel alloc]init];
//        _periodLabel.font = [UIFont systemFontOfSize:12];
//        _periodLabel.textColor = MCUIColorFromRGB(0x999999);
//        _periodLabel.textAlignment = NSTextAlignmentCenter;
//        _periodLabel.text = @"期数";
//    }
//    return _periodLabel;
//}

-(UILabel *)noteLabel{
    if (_noteLabel == nil) {
        _noteLabel = [[UILabel alloc]init];
        _noteLabel.font = [UIFont systemFontOfSize:12];
        _noteLabel.textColor = MCUIColorFromRGB(0x999999);
        _noteLabel.textAlignment = NSTextAlignmentCenter;
        _noteLabel.text = @"注数";
    }
    return _noteLabel;
}

-(UILabel *)betAmountLabel{
    if (_betAmountLabel == nil) {
        _betAmountLabel = [[UILabel alloc]init];
        _betAmountLabel.font = [UIFont systemFontOfSize:12];
        _betAmountLabel.textColor = MCUIColorFromRGB(0x999999);
        _betAmountLabel.textAlignment = NSTextAlignmentCenter;
        _betAmountLabel.text = @"下注金额";
    }
    return _betAmountLabel;
}

-(UILabel *)profitLossLabel{
    if (_profitLossLabel == nil) {
        _profitLossLabel = [[UILabel alloc]init];
        _profitLossLabel.font = [UIFont systemFontOfSize:12];
        _profitLossLabel.textColor = MCUIColorFromRGB(0x999999);
        _profitLossLabel.textAlignment = NSTextAlignmentCenter;
        _profitLossLabel.text = @"盈亏";
    }
    return _profitLossLabel;
}

-(UIButton *)accountHistoryButton{
    if(!_accountHistoryButton){
        _accountHistoryButton = [[UIButton alloc]init];
        [_accountHistoryButton addTarget:self action:@selector(clickAccountHistoryButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _accountHistoryButton;
}

-(void)clickAccountHistoryButton{
    if(self.clickAccountHistoryBtn){
        self.clickAccountHistoryBtn();
    }
}

@end
