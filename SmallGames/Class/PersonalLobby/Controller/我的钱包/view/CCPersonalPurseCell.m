//
//  CCPersonalPurseCell.m
//  SmallGames
//
//  Created by hello on 2018/9/22.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalPurseCell.h"

@interface CCPersonalPurseCell()

@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *unitLabel;
@property(nonatomic,strong)UILabel *numberLabel;

@end

@implementation CCPersonalPurseCell

-(void)setPersonalPurseModel:(CCPersonalPurseModel *)personalPurseModel{
    _personalPurseModel = personalPurseModel;
    self.titleLabel.text = personalPurseModel.type;
    self.timeLabel.text = personalPurseModel.time;
    self.numberLabel.text = personalPurseModel.money;
}

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


-(void)initView{
    self.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@50);
        make.left.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-15);
        make.bottom.equalTo(self).offset(-5);
    }];
    
    [self.bgView addSubview:self.unitLabel];
    [self.unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgView);
        make.centerY.equalTo(self.bgView);
    }];
    
    [self.bgView addSubview:self.numberLabel];
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.unitLabel.mas_left).offset(-3);
        make.centerY.equalTo(self.bgView);
    }];

    [self.bgView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(15);
        make.bottom.equalTo(self.bgView).offset(-5);
    }];
    
    [self.bgView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(15);
        make.bottom.equalTo(self.bgView).offset(-20);
        make.top.equalTo(self.bgView);
    }];
}



-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = MCUIColorFromRGB(0x333333);
        _titleLabel.text = @"上分内容";
    }
    return _titleLabel;
}

-(UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:11];
        _timeLabel.textColor = MCUIColorFromRGB(0x777777);
        _timeLabel.text = @"2017-10-06 17:51:41";
    }
    return _timeLabel;
}

-(UILabel *)unitLabel{
    if (_unitLabel == nil) {
        _unitLabel = [[UILabel alloc]init];
        _unitLabel.font = [UIFont systemFontOfSize:11];
        _unitLabel.textColor = MCUIColorFromRGB(0x777777);
        _unitLabel.text = @"分";
    }
    return _unitLabel;
}

-(UILabel *)numberLabel{
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc]init];
        _numberLabel.font = [UIFont systemFontOfSize:18];
        _numberLabel.textColor = MCUIColorFromRGB(0x777777);
        _numberLabel.text = @"+5";
    }
    return _numberLabel;
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
