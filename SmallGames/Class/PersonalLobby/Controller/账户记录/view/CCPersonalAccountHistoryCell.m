//
//  CCPersonalAccountHistoryCell.m
//  SmallGames
//
//  Created by hello on 2018/9/24.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalAccountHistoryCell.h"

@interface CCPersonalAccountHistoryCell()
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *timeLabel;//日期
@property(nonatomic,strong)UILabel *weekLabel;//星期
@property(nonatomic,strong)UILabel *lotteryTypeLabel;//彩票类型
@property(nonatomic,strong)UILabel *noteLabel;//注数
@property(nonatomic,strong)UILabel *amountLabel;//金额
@property(nonatomic,strong)UILabel *profitLossLabel;//投注时间

@property(nonatomic,strong)UIView *buttonLineView;
@property(nonatomic,strong)UIButton *dayDetailsButton;
@property(nonatomic,strong)UIButton *periodButton;
@end

@implementation CCPersonalAccountHistoryCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    return self;
}

-(instancetype)init{
    if (self == [super init]) {
        [self initView];
    }
    return self;
}

-(void)setModel:(CCHistoryModel *)model{
    _model = model;
    NSArray *timearray = [model.time componentsSeparatedByString:@" "];
    if(timearray.count > 0){
       self.timeLabel.text = [NSString stringWithFormat:@"%@",[timearray objectAtIndex:0]];
    }
    if(timearray.count > 1){
        self.weekLabel.text = [NSString stringWithFormat:@"%@",[timearray objectAtIndex:1]];
    }
    self.lotteryTypeLabel.text = model.name;
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
        make.bottom.equalTo(self.mas_centerY);
        make.width.equalTo(@(MCScreenWidth/14*3));
        make.left.equalTo(self);
    }];
    
    [self addSubview:self.weekLabel];
    [self.weekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self.timeLabel.mas_bottom);
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
    
    [self addSubview:self.buttonLineView];
    [self.buttonLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(15);
        make.bottom.equalTo(self).offset(-15);
        make.width.equalTo(@0.5);
        make.right.equalTo(self).offset(-(MCScreenWidth/14*1.5));
    }];
    
    [self addSubview:self.dayDetailsButton];
    [self.dayDetailsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.profitLossLabel.mas_right);
        make.right.equalTo(self.buttonLineView.mas_left);
    }];
    
    [self addSubview:self.periodButton];
    [self.periodButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.buttonLineView.mas_right);
        make.right.equalTo(self);
    }];
   
}


-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView;
}

-(UIView *)buttonLineView{
    if(!_buttonLineView){
        _buttonLineView = [[UIView alloc]init];
        _buttonLineView.backgroundColor = MCUIColorFromRGB(0x6AB5D9);
    }
    return _buttonLineView;
}


-(UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = MCUIColorFromRGB(0x999999);
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.text = @"2018-9-20";
    }
    return _timeLabel;
}

-(UILabel *)weekLabel{
    if (_weekLabel == nil) {
        _weekLabel = [[UILabel alloc]init];
        _weekLabel.font = [UIFont systemFontOfSize:12];
        _weekLabel.textColor = MCUIColorFromRGB(0x999999);
        _weekLabel.textAlignment = NSTextAlignmentCenter;
        _weekLabel.text = @"星期一";
    }
    return _weekLabel;
}

-(UILabel *)lotteryTypeLabel{
    if (_lotteryTypeLabel == nil) {
        _lotteryTypeLabel = [[UILabel alloc]init];
        _lotteryTypeLabel.font = [UIFont systemFontOfSize:12];
        _lotteryTypeLabel.textColor = MCUIColorFromRGB(0x999999);
        _lotteryTypeLabel.textAlignment = NSTextAlignmentCenter;
        _lotteryTypeLabel.text = @"北京赛车";
    }
    return _lotteryTypeLabel;
}

-(UILabel *)noteLabel{
    if (_noteLabel == nil) {
        _noteLabel = [[UILabel alloc]init];
        _noteLabel.font = [UIFont systemFontOfSize:12];
        _noteLabel.textColor = MCUIColorFromRGB(0x999999);
        _noteLabel.textAlignment = NSTextAlignmentCenter;
        _noteLabel.text = @"10";
    }
    return _noteLabel;
}

-(UILabel *)amountLabel{
    if (_amountLabel == nil) {
        _amountLabel = [[UILabel alloc]init];
        _amountLabel.font = [UIFont systemFontOfSize:12];
        _amountLabel.textColor = MCUIColorFromRGB(0x999999);
        _amountLabel.textAlignment = NSTextAlignmentCenter;
        _amountLabel.text = @"100";
    }
    return _amountLabel;
}

-(UILabel *)profitLossLabel{
    if (_profitLossLabel == nil) {
        _profitLossLabel = [[UILabel alloc]init];
        _profitLossLabel.font = [UIFont systemFontOfSize:12];
        _profitLossLabel.textColor = MCUIColorFromRGB(0x999999);
        _profitLossLabel.textAlignment = NSTextAlignmentCenter;
        _profitLossLabel.text = @"-";
    }
    return _profitLossLabel;
}

- (UIButton *)dayDetailsButton {
    if (_dayDetailsButton == nil) {
        _dayDetailsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _dayDetailsButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_dayDetailsButton setTitle:@"当天明细" forState:UIControlStateNormal];
        [_dayDetailsButton.titleLabel setNumberOfLines:2];
        [_dayDetailsButton setTitleColor:MCUIColorFromRGB(0x6AB5D9) forState:UIControlStateNormal];
        [_dayDetailsButton addTarget:self action:@selector(clickDayDetailsButton) forControlEvents:UIControlEventTouchUpInside];
    } return _dayDetailsButton;
}
- (UIButton *)periodButton{
    if (_periodButton == nil) {
        _periodButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _periodButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_periodButton setTitle:@"按期数查看" forState:UIControlStateNormal];
        [_periodButton.titleLabel setNumberOfLines:2];
        [_periodButton setTitleColor:MCUIColorFromRGB(0x6AB5D9) forState:UIControlStateNormal];
        [_periodButton addTarget:self action:@selector(clickPeriodButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _periodButton;
}



-(void)clickDayDetailsButton{
    if(self.clickDayDetailsBtn){
        self.clickDayDetailsBtn(_model);
    }
}

-(void)clickPeriodButton{
    if(self.clickPeriodBtn){
        self.clickPeriodBtn(_model);
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
