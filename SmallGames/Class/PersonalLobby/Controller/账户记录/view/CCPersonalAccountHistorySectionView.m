//
//  CCPersonalAccountHistorySectionView.m
//  SmallGames
//
//  Created by hello on 2018/9/24.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalAccountHistorySectionView.h"

@interface CCPersonalAccountHistorySectionView()
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *noteLabel;//注数
@property(nonatomic,strong)UILabel *amountLabel;//金额
@property(nonatomic,strong)UILabel *profitLossLabel;//盈亏

@end

@implementation CCPersonalAccountHistorySectionView

-(void)setModel:(CCHistoryModel *)model{
    _model = model;
    self.noteLabel.text = model.zhushu;
    self.amountLabel.text = model.jinge;
    self.profitLossLabel.text = model.yingkui;
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
        make.width.equalTo(@(MCScreenWidth/14*3));
    }];
    
    [self addSubview:self.lotteryTypeLabel];
    [self.lotteryTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/7));
        make.left.equalTo(self.timeLabel.mas_right);
        
    }];
    
    [self addSubview:self.noteLabel];
    [self.noteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/7));
        make.left.equalTo(self.lotteryTypeLabel.mas_right);
    }];
    
    [self addSubview:self.amountLabel];
    [self.amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/7));
        make.left.equalTo(self.noteLabel.mas_right);
    }];
    
    [self addSubview:self.profitLossLabel];
    [self.profitLossLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.amountLabel.mas_right);
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/7));
    }];
    
    [self addSubview:self.viewLabel];
    [self.viewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.profitLossLabel.mas_right);
        make.top.bottom.right.equalTo(self);
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
        _timeLabel.text = @"时期";
    }
    return _timeLabel;
}

-(UILabel *)lotteryTypeLabel{
    if (_lotteryTypeLabel == nil) {
        _lotteryTypeLabel = [[UILabel alloc]init];
        _lotteryTypeLabel.font = [UIFont systemFontOfSize:12];
        _lotteryTypeLabel.textColor = MCUIColorFromRGB(0x999999);
        _lotteryTypeLabel.textAlignment = NSTextAlignmentCenter;
        _lotteryTypeLabel.text = @"彩票类型";
    }
    return _lotteryTypeLabel;
}

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

-(UILabel *)amountLabel{
    if (_amountLabel == nil) {
        _amountLabel = [[UILabel alloc]init];
        _amountLabel.font = [UIFont systemFontOfSize:12];
        _amountLabel.textColor = MCUIColorFromRGB(0x999999);
        _amountLabel.textAlignment = NSTextAlignmentCenter;
        _amountLabel.text = @"金额";
    }
    return _amountLabel;
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
-(UILabel *)viewLabel{
    if (_viewLabel == nil) {
        _viewLabel = [[UILabel alloc]init];
        _viewLabel.font = [UIFont systemFontOfSize:12];
        _viewLabel.textColor = MCUIColorFromRGB(0x999999);
        _viewLabel.textAlignment = NSTextAlignmentCenter;
        _viewLabel.text = @"查看";
    }
    return _viewLabel;
}

@end
