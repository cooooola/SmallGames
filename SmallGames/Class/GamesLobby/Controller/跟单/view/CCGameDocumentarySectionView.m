//
//  CCGameDocumentarySectionView.m
//  SmallGames
//
//  Created by hello on 2018/9/27.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameDocumentarySectionView.h"

@interface CCGameDocumentarySectionView()
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UIView *lineView_0;
@property(nonatomic,strong)UIView *lineView_1;
@property(nonatomic,strong)UIView *lineView_2;
@property(nonatomic,strong)UIView *lineView_3;
@property(nonatomic,strong)UIView *lineView_4;
@end

@implementation CCGameDocumentarySectionView
-(void)initView{
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.left.right.bottom.equalTo(self);
    }];
    
    
    [self addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/7*2-0.5));
    }];
    
    [self addSubview:self.lineView_0];
    [self.lineView_0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.timeLabel.mas_right);
        make.width.equalTo(@0.5);
    }];
    
    
    [self addSubview:self.periodLabel];
    [self.periodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/7-0.5));
        make.left.equalTo(self.lineView_0.mas_right);
        
    }];
    
    [self addSubview:self.lineView_1];
    [self.lineView_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.periodLabel.mas_right);
        make.width.equalTo(@0.5);
    }];
    
    [self addSubview:self.playLabel];
    [self.playLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/7-0.5));
        make.left.equalTo(self.lineView_1.mas_right);
    }];
    
    [self addSubview:self.lineView_2];
    [self.lineView_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.playLabel.mas_right);
        make.width.equalTo(@0.5);
    }];
    
    [self addSubview:self.amountLabel];
    [self.amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/7-0.5));
        make.left.equalTo(self.lineView_2.mas_right);
    }];
    
    [self addSubview:self.lineView_3];
    [self.lineView_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.amountLabel.mas_right);
        make.width.equalTo(@0.5);
    }];
    
    
    [self addSubview:self.profitLossLabel];
    [self.profitLossLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineView_3.mas_right);
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/7-0.5));
    }];
    
    [self addSubview:self.lineView_4];
    [self.lineView_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.profitLossLabel.mas_right);
        make.width.equalTo(@0.5);
    }];
    
    [self addSubview:self.statusLabel];
    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineView_4.mas_right);
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/7));
    }];
}


-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView;
}

-(UIView *)lineView_0{
    if (!_lineView_0) {
        _lineView_0 = [[UIView alloc]init];
        _lineView_0.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView_0;
}

-(UIView *)lineView_1{
    if (!_lineView_1) {
        _lineView_1 = [[UIView alloc]init];
        _lineView_1.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView_1;
}

-(UIView *)lineView_2{
    if (!_lineView_2) {
        _lineView_2 = [[UIView alloc]init];
        _lineView_2.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView_2;
}

-(UIView *)lineView_3{
    if (!_lineView_3) {
        _lineView_3 = [[UIView alloc]init];
        _lineView_3.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView_3;
}


-(UIView *)lineView_4{
    if (!_lineView_4) {
        _lineView_4 = [[UIView alloc]init];
        _lineView_4.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView_4;
}





-(UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = MCUIColorFromRGB(0x999999);
        _timeLabel.numberOfLines = 2;
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.text = @"跟投时间";
    }
    return _timeLabel;
}

-(UILabel *)periodLabel{
    if (_periodLabel == nil) {
        _periodLabel = [[UILabel alloc]init];
        _periodLabel.font = [UIFont systemFontOfSize:12];
        _periodLabel.textColor = MCUIColorFromRGB(0x999999);
        _periodLabel.textAlignment = NSTextAlignmentCenter;
        _periodLabel.text = @"用户ID";
    }
    return _periodLabel;
}

-(UILabel *)playLabel{
    if (_playLabel == nil) {
        _playLabel = [[UILabel alloc]init];
        _playLabel.font = [UIFont systemFontOfSize:12];
        _playLabel.textColor = MCUIColorFromRGB(0x999999);
        _playLabel.textAlignment = NSTextAlignmentCenter;
        _playLabel.text = @"用户名称";
    }
    return _playLabel;
}

-(UILabel *)amountLabel{
    if (_amountLabel == nil) {
        _amountLabel = [[UILabel alloc]init];
        _amountLabel.font = [UIFont systemFontOfSize:12];
        _amountLabel.textColor = MCUIColorFromRGB(0x999999);
        _amountLabel.textAlignment = NSTextAlignmentCenter;
        _amountLabel.text = @"倍率";
    }
    return _amountLabel;
}

-(UILabel *)profitLossLabel{
    if (_profitLossLabel == nil) {
        _profitLossLabel = [[UILabel alloc]init];
        _profitLossLabel.font = [UIFont systemFontOfSize:12];
        _profitLossLabel.textColor = MCUIColorFromRGB(0x999999);
        _profitLossLabel.textAlignment = NSTextAlignmentCenter;
        _profitLossLabel.text = @"流水";
    }
    return _profitLossLabel;
}

-(UILabel *)statusLabel{
    if (_statusLabel == nil) {
        _statusLabel = [[UILabel alloc]init];
        _statusLabel.font = [UIFont systemFontOfSize:12];
        _statusLabel.textColor = MCUIColorFromRGB(0x999999);
        _statusLabel.textAlignment = NSTextAlignmentCenter;
        _statusLabel.text = @"盈亏";
    }
    return _statusLabel;
}

@end
