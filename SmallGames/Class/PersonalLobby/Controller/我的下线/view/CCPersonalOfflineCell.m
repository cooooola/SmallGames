//
//  CCPersonalOfflineCell.m
//  SmallGames
//
//  Created by hello on 2018/9/23.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalOfflineCell.h"

@interface CCPersonalOfflineCell()
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *userNameLabel;
@property(nonatomic,strong)UILabel *userIDLabel;
@property(nonatomic,strong)UILabel *userTurnoverLabel;
@property(nonatomic,strong)UILabel *userBoonLabel;

@end

@implementation CCPersonalOfflineCell

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

-(void)setModel:(CCOfflineModel *)model{
    _model = model;
    self.userNameLabel.text = model.username;
    self.userIDLabel.text = model.Id;
    self.userTurnoverLabel.text = model.liushui;
    if (model.fanshui) {
       self.userBoonLabel.text = model.fanshui;
    }else{
        self.userBoonLabel.text = @"0.0";
    }
}



-(void)initView{
    self.backgroundColor = MCUIColorFromRGB(0xEEF4F9);
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.left.right.bottom.equalTo(self);
    }];
    

    [self addSubview:self.userNameLabel];
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/4));
    }];
    
    [self addSubview:self.userIDLabel];
    [self.userIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/4));
        make.left.equalTo(self.userNameLabel.mas_right);
    }];
    
    [self addSubview:self.userTurnoverLabel];
    [self.userTurnoverLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/4));
        make.left.equalTo(self.userIDLabel.mas_right);
    }];
    
    [self addSubview:self.userBoonLabel];
    [self.userBoonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/4));
        make.left.equalTo(self.userTurnoverLabel.mas_right);
    }];
    
    
}


-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView;
}

-(UILabel *)userNameLabel{
    if (_userNameLabel == nil) {
        _userNameLabel = [[UILabel alloc]init];
        _userNameLabel.font = [UIFont systemFontOfSize:12];
        _userNameLabel.textColor = MCUIColorFromRGB(0x999999);
        _userNameLabel.textAlignment = NSTextAlignmentCenter;
        _userNameLabel.text = @"下线名姓";
    }
    return _userNameLabel;
}

-(UILabel *)userIDLabel{
    if (_userIDLabel == nil) {
        _userIDLabel = [[UILabel alloc]init];
        _userIDLabel.font = [UIFont systemFontOfSize:12];
        _userIDLabel.textColor = MCUIColorFromRGB(0x999999);
        _userIDLabel.textAlignment = NSTextAlignmentCenter;
        _userIDLabel.text = @"下线id";
    }
    return _userIDLabel;
}

-(UILabel *)userTurnoverLabel{
    if (_userTurnoverLabel == nil) {
        _userTurnoverLabel = [[UILabel alloc]init];
        _userTurnoverLabel.font = [UIFont systemFontOfSize:12];
        _userTurnoverLabel.textColor = MCUIColorFromRGB(0x999999);
        _userTurnoverLabel.textAlignment = NSTextAlignmentCenter;
        _userTurnoverLabel.text = @"下线流水";
    }
    return _userTurnoverLabel;
}

-(UILabel *)userBoonLabel{
    if (_userBoonLabel == nil) {
        _userBoonLabel = [[UILabel alloc]init];
        _userBoonLabel.font = [UIFont systemFontOfSize:12];
        _userBoonLabel.textColor = MCUIColorFromRGB(0x999999);
        _userBoonLabel.textAlignment = NSTextAlignmentCenter;
        _userBoonLabel.text = @"下线福利";
    }
    return _userBoonLabel;
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
