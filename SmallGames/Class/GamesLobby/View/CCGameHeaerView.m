//
//  CCGameHeaerView.m
//  SmallGames
//
//  Created by hello on 2018/9/26.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameHeaerView.h"
@interface CCGameHeaerView()
@property(nonatomic,strong)UIView *titleView;
@property(nonatomic,strong)UIButton *customLeftButton;
@property(nonatomic,strong)UILabel *onlineUsersLabel;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *remainingPointLabel;
@property(nonatomic,strong)UIButton *soundButton;
@end

@implementation CCGameHeaerView

-(void)setPeopleNumber:(NSString *)peopleNumber{
    _peopleNumber = peopleNumber;
    self.onlineUsersLabel.text = [NSString stringWithFormat:@"在线：%@",peopleNumber];
}

-(void)initView{
    [super initView];

    [self addSubview:self.titleView];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.equalTo(@44);
    }];
    
    [self.titleView addSubview:self.customLeftButton];
    [self.customLeftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.titleView);
        make.left.equalTo(self.titleView);
        make.width.equalTo(@44);
    }];
    
    [self.titleView addSubview:self.onlineUsersLabel];
    [self.onlineUsersLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.titleView);
        make.left.equalTo(self.customLeftButton.mas_right);
    }];
    
    [self.titleView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.titleView);
        make.centerX.equalTo(self.titleView);
    }];
    
    [self.titleView addSubview:self.remainingPointLabel];
    [self.remainingPointLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.titleView).offset(-10);
        make.bottom.top.equalTo(self.titleView);
    }];
    
    [self.titleView addSubview:self.soundButton];
    [self.soundButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.titleView);
        make.width.equalTo(@44);
        make.right.equalTo(self.remainingPointLabel.mas_left);
    }];
}


-(UIView *)titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc]init];
    }
    return _titleView;
}

-(void)setGameType:(GameType)gameType{
    _gameType = gameType;
    if (gameType == GameTypeBeijingRacing) {
        self.titleLabel.text = @"北京赛车";
    }else if(gameType == GameTypeChongqingTimeColor){
        self.titleLabel.text = @"重庆时时彩";
    }else if(gameType == GameTypeLuckyAirship){
        self.titleLabel.text = @"幸运飞艇";
    }
}

- (UIButton *)customLeftButton{
    if (_customLeftButton == nil) {
        _customLeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_customLeftButton setImage:[UIImage imageNamed:@"ARROWLEFT"] forState:UIControlStateNormal];
        [_customLeftButton addTarget:self action:@selector(clickCustomLeftButton) forControlEvents:UIControlEventTouchUpInside];
        _customLeftButton.adjustsImageWhenHighlighted = NO;
    }
    return _customLeftButton;
}

-(UILabel *)onlineUsersLabel{
    if (!_onlineUsersLabel) {
        _onlineUsersLabel = [[UILabel alloc]init];
        _onlineUsersLabel.textColor = [UIColor whiteColor];
        _onlineUsersLabel.font = [UIFont systemFontOfSize:14];
    }
    return _onlineUsersLabel;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:17];
    }
    return _titleLabel;
}

-(UILabel *)remainingPointLabel{
    if (!_remainingPointLabel) {
        _remainingPointLabel = [[UILabel alloc]init];
        _remainingPointLabel.textColor = [UIColor whiteColor];
        _remainingPointLabel.font = [UIFont systemFontOfSize:14];
        NSString *umoney = [NSString stringWithFormat:@"%@",[AppDelegate sharedApplicationDelegate].userInfoModel.umoney];
        if (umoney.length == 0 || [umoney isEqualToString:@"<null>"]||[umoney isEqual:nil]||[umoney isKindOfClass:[NSNull class]]) {
            _remainingPointLabel.text = @"余点:0.00";
        }else{
            _remainingPointLabel.text = [NSString stringWithFormat:@"余点:%@",[AppDelegate sharedApplicationDelegate].userInfoModel.umoney];
        }
        
    }
    return _remainingPointLabel;
}

-(UIButton *)soundButton{
    if (!_soundButton) {
        _soundButton = [[UIButton alloc]init];
        [_soundButton setImage:[UIImage imageNamed:@"VOLUME"] forState:UIControlStateNormal];
        _soundButton.selected = NO;
        [_soundButton setImage:[UIImage imageNamed:@"VOLUMEOFF"] forState:UIControlStateSelected];
        [_soundButton addTarget:self action:@selector(clickSoundButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _soundButton;
}

-(void)clickSoundButton:(UIButton *)sender{
    sender.selected = !sender.selected;
    if(self.clickClickSoundBtn){
       self.clickClickSoundBtn(!sender.selected);
    }
    
}

-(void)clickCustomLeftButton{
    if(self.clickCustomLeftBtn){
        self.clickCustomLeftBtn();
    }
}

@end
