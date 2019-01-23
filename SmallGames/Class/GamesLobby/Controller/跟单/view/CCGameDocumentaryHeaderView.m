//
//  CCGameDocumentaryHeaderView.m
//  SmallGames
//
//  Created by hello on 2018/9/27.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameDocumentaryHeaderView.h"

@interface CCGameDocumentaryHeaderView()
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *documentaryStatusLabel;//跟单状态
@property(nonatomic,strong)UILabel *openLabel;//开
@property(nonatomic,strong)UILabel *turnOffLabel;//关
@property(nonatomic,strong)UIButton *statusSwitchButton;
@property(nonatomic,strong)UIButton *modifyOddsButton;

@end

@implementation CCGameDocumentaryHeaderView

-(void)setGameDocumentaryModel:(CCGameDocumentaryModel *)gameDocumentaryModel{
    _gameDocumentaryModel = gameDocumentaryModel;
    self.statusSwitchButton.selected = gameDocumentaryModel.status;
}

-(void)initView{
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.left.right.bottom.equalTo(self);
    }];
    
    
    [self addSubview:self.documentaryStatusLabel];
    [self.documentaryStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self).offset(15);
    }];
    
    [self addSubview:self.turnOffLabel];
    [self.turnOffLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.documentaryStatusLabel.mas_right).offset(25);
    }];
    
    [self addSubview:self.statusSwitchButton];
    [self.statusSwitchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.turnOffLabel.mas_right).offset(5);
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.openLabel];
    [self.openLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.statusSwitchButton.mas_right).offset(5);
    }];
    
    [self addSubview:self.modifyOddsButton];
    [self.modifyOddsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-15);
        make.centerY.equalTo(self);
        make.width.equalTo(@75);
        make.height.equalTo(@25);
    }];
}


-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView;
}

-(UILabel *)documentaryStatusLabel{
    if (_documentaryStatusLabel == nil) {
        _documentaryStatusLabel = [[UILabel alloc]init];
        _documentaryStatusLabel.font = [UIFont systemFontOfSize:12];
        _documentaryStatusLabel.textColor = MCUIColorFromRGB(0x999999);
        _documentaryStatusLabel.textAlignment = NSTextAlignmentCenter;
        _documentaryStatusLabel.text = @"跟单状态";
    }
    return _documentaryStatusLabel;
}

-(UILabel *)openLabel{
    if (_openLabel == nil) {
        _openLabel = [[UILabel alloc]init];
        _openLabel.font = [UIFont systemFontOfSize:12];
        _openLabel.textColor = MCUIColorFromRGB(0x999999);
        _openLabel.textAlignment = NSTextAlignmentCenter;
        _openLabel.text = @"开";
    }
    return _openLabel;
}

-(UIButton *)statusSwitchButton{
    if (!_statusSwitchButton) {
        _statusSwitchButton = [[UIButton alloc]init];
        [_statusSwitchButton setImage:[UIImage imageNamed:@"OFF"] forState:UIControlStateNormal];
        [_statusSwitchButton setImage:[UIImage imageNamed:@"ON"] forState:UIControlStateSelected];
        _statusSwitchButton.selected = NO;
        [_statusSwitchButton addTarget: self action:@selector(clickStatusSwitchButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _statusSwitchButton;
}

-(UILabel *)turnOffLabel{
    if (_turnOffLabel == nil) {
        _turnOffLabel = [[UILabel alloc]init];
        _turnOffLabel.font = [UIFont systemFontOfSize:12];
        _turnOffLabel.textColor = MCUIColorFromRGB(0x999999);
        _turnOffLabel.textAlignment = NSTextAlignmentCenter;
        _turnOffLabel.text = @"关";
    }
    return _turnOffLabel;
}

-(UIButton *)modifyOddsButton{
    if (!_modifyOddsButton) {
        _modifyOddsButton = [[UIButton alloc]init];
        [_modifyOddsButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [_modifyOddsButton setBackgroundColor:MCUIColorFromRGB(0x40B6EE)];
        [_modifyOddsButton setTitle:@"修改倍率" forState:UIControlStateNormal];
        _modifyOddsButton.layer.cornerRadius = 3;
        [_modifyOddsButton addTarget:self action:@selector(clickModifyOddsButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _modifyOddsButton;
}

-(void)clickStatusSwitchButton:(UIButton *)sender{
    if (!_gameDocumentaryModel) {
        [CCView BSMBProgressHUD_onlyTextWithView:[AppDelegate sharedApplicationDelegate].window andText:@"当前没有可操修的跟单！"];
        return;
    }
    if (!sender.selected) {
        [CCView BSMBProgressHUD_onlyTextWithView:[AppDelegate sharedApplicationDelegate].window andText:@"当前跟单已暂停！"];
        return;
    }
    if (self.clickStatusSwitchBtn) {
        self.clickStatusSwitchBtn(sender.selected);
    }
}

-(void)clickModifyOddsButton{
    if (self.clickModifyOddsBtn) {
        self.clickModifyOddsBtn();
    }
}

@end
