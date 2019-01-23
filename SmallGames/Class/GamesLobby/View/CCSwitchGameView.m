//
//  CCSwitchGameView.m
//  SmallGames
//
//  Created by hello on 2018/9/26.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCSwitchGameView.h"

@interface CCSwitchGameView()
@property(nonatomic,strong)UIImageView *bgImageView;
@property(nonatomic,strong)UIImageView *titleImageView;
@property(nonatomic,strong)UIButton *deleteButton;

@property(nonatomic,strong)UIImageView *beijingRacingImageView;
@property(nonatomic,strong)UIImageView *chongqingTimeColorImageView;
@property(nonatomic,strong)UIImageView *luckyAirshipImageView;

@property(nonatomic,strong)UIButton *beijingRacingButton;
@property(nonatomic,strong)UIButton *chongqingTimeColorButton;
@property(nonatomic,strong)UIButton *luckyAirshipButton;
@end

@implementation CCSwitchGameView

-(void)initView{
    [super initView];
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    [self addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
    [self addSubview:self.titleImageView];
    [self.titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bgImageView.mas_top);
        make.centerX.equalTo(self);
    }];
    
    [self addSubview:self.deleteButton];
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgImageView).offset(5);
        make.right.equalTo(self.bgImageView).offset(-5);
        make.width.height.equalTo(@50);
    }];
    
    
    [self.bgImageView addSubview:self.luckyAirshipImageView];
    [self.luckyAirshipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.bgImageView);
    }];
    
    [self.bgImageView addSubview:self.beijingRacingImageView];
    [self.beijingRacingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgImageView);
        make.right.equalTo(self.luckyAirshipImageView.mas_left);
    }];
    
    [self.bgImageView addSubview:self.chongqingTimeColorImageView];
    [self.chongqingTimeColorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgImageView);
        make.left.equalTo(self.luckyAirshipImageView.mas_right);
    }];
    
    [self.beijingRacingImageView addSubview:self.beijingRacingButton];
    [self.beijingRacingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.beijingRacingImageView);
    }];
    
    [self.chongqingTimeColorImageView addSubview:self.chongqingTimeColorButton];
    [self.chongqingTimeColorButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.chongqingTimeColorImageView);
    }];
    
    [self.luckyAirshipImageView addSubview:self.luckyAirshipButton];
    [self.luckyAirshipButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.luckyAirshipImageView);
    }];
   
}

-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
        _bgImageView.userInteractionEnabled = YES;
        _bgImageView.image = [UIImage imageNamed:@"dAPP-bj"];
    }
    return _bgImageView;
}

-(UIImageView *)titleImageView{
    if (!_titleImageView) {
        _titleImageView = [[UIImageView alloc]init];
        _titleImageView.image = [UIImage imageNamed:@"qiehuantyouxi-top"];
    }
    return _titleImageView;
}
-(UIButton *)deleteButton{
    if (!_deleteButton) {
        _deleteButton = [[UIButton alloc]init];
        [_deleteButton setImage:[UIImage imageNamed:@"bbyx_guangbi_normal"] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(clickDeleteButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}

-(UIImageView *)beijingRacingImageView{
    if (!_beijingRacingImageView) {
        _beijingRacingImageView = [[UIImageView alloc]init];
        _beijingRacingImageView.userInteractionEnabled = YES;
        _beijingRacingImageView.image = [UIImage imageNamed:@"qiehuanyouxil_sc"];
    }
    return _beijingRacingImageView;
}

-(UIImageView *)chongqingTimeColorImageView{
    if (!_chongqingTimeColorImageView) {
        _chongqingTimeColorImageView = [[UIImageView alloc]init];
        _chongqingTimeColorImageView.userInteractionEnabled = YES;
        _chongqingTimeColorImageView.image = [UIImage imageNamed:@"qiehuanyouxil_ssc"];
    }
    return _chongqingTimeColorImageView;
}

-(UIImageView *)luckyAirshipImageView{
    if (!_luckyAirshipImageView) {
        _luckyAirshipImageView = [[UIImageView alloc]init];
        _luckyAirshipImageView.userInteractionEnabled = YES;
        _luckyAirshipImageView.image = [UIImage imageNamed:@"qiehuanyouxil_ft"];
    }
    return _luckyAirshipImageView;
}

-(UIButton *)beijingRacingButton{
    if (!_beijingRacingButton) {
        _beijingRacingButton = [[UIButton alloc]init];
        [_beijingRacingButton setBackgroundColor:[UIColor clearColor]];
        _beijingRacingButton.tag = 1;
        [_beijingRacingButton addTarget:self action:@selector(clickSwitchGameButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _beijingRacingButton;
}

-(UIButton *)chongqingTimeColorButton{
    if (!_chongqingTimeColorButton) {
        _chongqingTimeColorButton = [[UIButton alloc]init];
        [_chongqingTimeColorButton setBackgroundColor:[UIColor clearColor]];
        _chongqingTimeColorButton.tag = 2;
        [_chongqingTimeColorButton addTarget:self action:@selector(clickSwitchGameButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chongqingTimeColorButton;
}

-(UIButton *)luckyAirshipButton{
    if (!_luckyAirshipButton) {
        _luckyAirshipButton = [[UIButton alloc]init];
        [_luckyAirshipButton setBackgroundColor:[UIColor clearColor]];
        _luckyAirshipButton.tag = 3;
        [_luckyAirshipButton addTarget:self action:@selector(clickSwitchGameButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _luckyAirshipButton;
}

-(void)clickSwitchGameButton:(UIButton *)sender{
    if (self.clickSwitchGameBtn) {
        self.clickSwitchGameBtn((GameType)sender.tag);
    }
    [self clickDeleteButton];
}

-(void)clickDeleteButton{
    [self removeFromSuperview];
}

@end
