//
//  CCPersonalFootSectionView.m
//  SmallGames
//
//  Created by hello on 2018/9/23.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalFootSectionView.h"

@interface CCPersonalFootSectionView()
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *totalLabel;
//@property(nonatomic,strong)UILabel *periodLabel;
@property(nonatomic,strong)UILabel *noteLabel;
@property(nonatomic,strong)UILabel *betAmountLabel;
@property(nonatomic,strong)UILabel *profitLossLabel;
@end

@implementation CCPersonalFootSectionView

-(void)initView{
    [super initView];
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.left.right.bottom.equalTo(self);
    }];
    
    
    [self addSubview:self.totalLabel];
    [self.totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/4));
    }];
    
    [self addSubview:self.noteLabel];
    [self.noteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/6));
        make.left.equalTo(self).offset(MCScreenWidth/4+MCScreenWidth/6);
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
        make.width.equalTo(@(MCScreenWidth/4));
    }];
    
    
}


-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView;
}

-(UILabel *)totalLabel{
    if (_totalLabel == nil) {
        _totalLabel = [[UILabel alloc]init];
        _totalLabel.font = [UIFont systemFontOfSize:12];
        _totalLabel.textColor = MCUIColorFromRGB(0x999999);
        _totalLabel.textAlignment = NSTextAlignmentCenter;
        _totalLabel.text = @"本周合计";
    }
    return _totalLabel;
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


@end
