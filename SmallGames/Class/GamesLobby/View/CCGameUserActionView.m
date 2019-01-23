//
//  CCGameUserActionView.m
//  SmallGames
//
//  Created by hello on 2018/9/26.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameUserActionView.h"
@interface CCGameUserActionView()
@property(nonatomic,strong)UIButton *gameTypeButton;//游戏类型
@property(nonatomic,strong)UIButton *animationButton;//动画
@property(nonatomic,strong)UIButton *trendButton;//走势
@property(nonatomic,strong)UIButton *longDragonButton;//长龙
@property(nonatomic,strong)UIButton *refreshButton;//刷新
@property(nonatomic,strong)UIButton *documentaryButton;//跟单
@end

@implementation CCGameUserActionView

-(void)initView{
    self.backgroundColor = MCUIColorFromRGB(0xF2F2F2);
    
    [self addSubview:self.gameTypeButton];
    [self.gameTypeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(2);
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.animationButton];
    [self.animationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.gameTypeButton.mas_right).offset(2);
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.trendButton];
    [self.trendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.animationButton.mas_right).offset(2);
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.longDragonButton];
    [self.longDragonButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.trendButton.mas_right).offset(2);
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.refreshButton];
    [self.refreshButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.longDragonButton.mas_right).offset(2);
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.documentaryButton];
    [self.documentaryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.refreshButton.mas_right).offset(2);
        make.centerY.equalTo(self);
    }];
    
}

-(void)setGameType:(GameType)gameType{
    _gameType = gameType;
    if (gameType == GameTypeBeijingRacing) {
        [_gameTypeButton setImage:[UIImage imageNamed:@"beijingsaicheyouxi"] forState:UIControlStateNormal];
    }else if(gameType == GameTypeChongqingTimeColor){
        [_gameTypeButton setImage:[UIImage imageNamed:@"chongqingshishicai"] forState:UIControlStateNormal];
    }else if(gameType == GameTypeLuckyAirship){
        [_gameTypeButton setImage:[UIImage imageNamed:@"xingyunfeiting"] forState:UIControlStateNormal];
    }
}

-(UIButton *)gameTypeButton{
    if (!_gameTypeButton) {
        _gameTypeButton = [[UIButton alloc]init];
        [_gameTypeButton setImage:[UIImage imageNamed:@"beijingsaicheyouxi"] forState:UIControlStateNormal];
        [_gameTypeButton addTarget:self action:@selector(clickGameTypeButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _gameTypeButton;
}

-(UIButton *)animationButton{
    if (!_animationButton) {
        _animationButton = [[UIButton alloc]init];
        [_animationButton setImage:[UIImage imageNamed:@"donghua"] forState:UIControlStateNormal];
        _animationButton.selected = YES;
        [_animationButton setImage:[UIImage imageNamed:@"donghua-xz"] forState:UIControlStateSelected];
        [_animationButton addTarget:self action:@selector(clickAnimationButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _animationButton;
}

-(UIButton *)trendButton{
    if (!_trendButton) {
        _trendButton = [[UIButton alloc]init];
        [_trendButton setImage:[UIImage imageNamed:@"zoushi"] forState:UIControlStateNormal];
        _trendButton.selected = NO;
        [_trendButton setImage:[UIImage imageNamed:@"zoushi-xz"] forState:UIControlStateSelected];
        [_trendButton addTarget:self action:@selector(clickTrendButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _trendButton;
}

-(UIButton *)longDragonButton{
    if (!_longDragonButton) {
        _longDragonButton = [[UIButton alloc]init];
        [_longDragonButton setImage:[UIImage imageNamed:@"changlong"] forState:UIControlStateNormal];
//        _longDragonButton.selected = NO;
//        [_longDragonButton setImage:[UIImage imageNamed:@"changlong-xz"] forState:UIControlStateSelected];
        [_longDragonButton addTarget:self action:@selector(clickLongDragonButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _longDragonButton;
}

-(UIButton *)refreshButton{
    if (!_refreshButton) {
        _refreshButton = [[UIButton alloc]init];
        [_refreshButton setImage:[UIImage imageNamed:@"shuaxin"] forState:UIControlStateNormal];
//        _refreshButton.selected = NO;
//        [_refreshButton setImage:[UIImage imageNamed:@"shuaxin-xz"] forState:UIControlStateSelected];
        [_refreshButton addTarget:self action:@selector(clickRefreshButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _refreshButton;
}

-(UIButton *)documentaryButton{
    if (!_documentaryButton) {
        _documentaryButton = [[UIButton alloc]init];
        [_documentaryButton setImage:[UIImage imageNamed:@"gendan"] forState:UIControlStateNormal];
//        _documentaryButton.selected = NO;
//        [_documentaryButton setImage:[UIImage imageNamed:@"gendan-xz"] forState:UIControlStateSelected];
        [_documentaryButton addTarget:self action:@selector(clickDocumentaryButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _documentaryButton;
}



-(void)clickGameTypeButton{
    if (self.clickGameTypeBtn) {
        self.clickGameTypeBtn();
    }
}

-(void)clickAnimationButton:(UIButton *)sender{
    if (sender.selected) {
        return;
    }
    sender.selected = !sender.selected;
    self.trendButton.selected = NO;
    if (self.clickAnimationORTrend) {
        self.clickAnimationORTrend(YES);
    }
}

-(void)clickTrendButton:(UIButton *)sender{
    if (sender.selected) {
        return;
    }
    sender.selected = !sender.selected;
    self.animationButton.selected = NO;
    if (self.clickAnimationORTrend) {
        self.clickAnimationORTrend(NO);
    }
}

-(void)clickLongDragonButton{
    if (self.clickLongDragonBtn) {
        self.clickLongDragonBtn();
    }
}

-(void)clickRefreshButton:(UIButton *)sender{
    if (self.clickRefreshBtn) {
        self.clickRefreshBtn();
    }
}

-(void)clickDocumentaryButton:(UIButton *)sender{
    if (self.clickDocumentaryBtn) {
        self.clickDocumentaryBtn();
    }
}

@end
