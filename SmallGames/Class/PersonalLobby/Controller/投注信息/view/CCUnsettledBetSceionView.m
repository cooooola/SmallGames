//
//  CCUnsettledBetSceionView.m
//  SmallGames
//
//  Created by hello on 2018/9/23.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCUnsettledBetSceionView.h"

@interface CCUnsettledBetSceionView()
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *issueLabel;//期号
@property(nonatomic,strong)UILabel *colorLabel;//彩种
@property(nonatomic,strong)UILabel *contentLabel;//内容
@property(nonatomic,strong)UILabel *amountLabel;//金额
@property(nonatomic,strong)UILabel *timeLabel;//投注时间
@property(nonatomic,strong)UILabel *operatingLabel;//操作
@end

@implementation CCUnsettledBetSceionView
-(void)initView{
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.left.right.bottom.equalTo(self);
    }];
    
    
    [self addSubview:self.issueLabel];
    [self.issueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/6));
    }];
    
    [self addSubview:self.colorLabel];
    [self.colorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/6));
        make.left.equalTo(self.issueLabel.mas_right);
        
    }];
    
    [self addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/6));
        make.left.equalTo(self.colorLabel.mas_right);
    }];
    
    [self addSubview:self.amountLabel];
    [self.amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/6));
        make.left.equalTo(self.contentLabel.mas_right);
    }];
    
    [self addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.amountLabel.mas_right);
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/6));
    }];
    
    [self addSubview:self.operatingLabel];
    [self.operatingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeLabel.mas_right);
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/6));
    }];
}

-(void)setPersonalBettingRecordModel:(CCPersonalBettingRecordModel *)personalBettingRecordModel{
    _personalBettingRecordModel = personalBettingRecordModel;
    self.issueLabel.text = personalBettingRecordModel.term;
    self.colorLabel.text = personalBettingRecordModel.game;
    self.contentLabel.text = personalBettingRecordModel.jincai;
    self.amountLabel.text = personalBettingRecordModel.money;
    self.timeLabel.text = personalBettingRecordModel.addtime;
    self.operatingLabel.text = personalBettingRecordModel.status;
}


-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView;
}

-(UILabel *)issueLabel{
    if (_issueLabel == nil) {
        _issueLabel = [[UILabel alloc]init];
        _issueLabel.font = [UIFont systemFontOfSize:12];
        _issueLabel.textColor = MCUIColorFromRGB(0x999999);
        _issueLabel.textAlignment = NSTextAlignmentCenter;
        _issueLabel.text = @"期号";
    }
    return _issueLabel;
}

-(UILabel *)colorLabel{
    if (_colorLabel == nil) {
        _colorLabel = [[UILabel alloc]init];
        _colorLabel.font = [UIFont systemFontOfSize:12];
        _colorLabel.textColor = MCUIColorFromRGB(0x999999);
        _colorLabel.textAlignment = NSTextAlignmentCenter;
        _colorLabel.text = @"彩种";
    }
    return _colorLabel;
}

-(UILabel *)contentLabel{
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:12];
        _contentLabel.textColor = MCUIColorFromRGB(0x999999);
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.text = @"内容";
    }
    return _contentLabel;
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

-(UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:9];
        _timeLabel.textColor = MCUIColorFromRGB(0x999999);
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.numberOfLines = 2;
        _timeLabel.text = @"投注时间";
    }
    return _timeLabel;
}
-(UILabel *)operatingLabel{
    if (_operatingLabel == nil) {
        _operatingLabel = [[UILabel alloc]init];
        _operatingLabel.font = [UIFont systemFontOfSize:12];
        _operatingLabel.textColor = MCUIColorFromRGB(0x999999);
        _operatingLabel.textAlignment = NSTextAlignmentCenter;
        _operatingLabel.text = @"操作";
    }
    return _operatingLabel;
}

-(void)setSceionTitle:(NSString *)sceionTitle{
    _sceionTitle = sceionTitle;
    self.operatingLabel.text = sceionTitle;
}


@end
