//
//  CCGameHomeViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/18.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameHomeViewController.h"
#import "CCAutoScrollLabel.h"
#import "CCGameViewController.h"

@interface CCGameHomeViewController ()
@property(nonatomic,strong)UIView *titleView;
@property(nonatomic,strong)UIImageView *titleImageView;
@property(nonatomic,strong)CCAutoScrollLabel *autoScrollLabel;
@property(nonatomic,strong)UIView *autoScrollView;
@property(nonatomic,strong)UIImageView *autoScrollImageView;

@property(nonatomic,strong)UIImageView *beijingRacingImageView;
@property(nonatomic,strong)UIImageView *chongqingTimeColorImageView;
@property(nonatomic,strong)UIImageView *luckyAirshipImageView;

@property(nonatomic,strong)UIButton *beijingRacingButton;
@property(nonatomic,strong)UIButton *chongqingTimeColorButton;
@property(nonatomic,strong)UIButton *luckyAirshipButton;

@end

@implementation CCGameHomeViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.autoScrollLabel.text = @"暂无公告";
}

-(void)initView{
    [self.view addSubview:self.titleView];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.equalTo(@44);
        make.top.equalTo(self.view).offset(MCStatusBarHeight);
    }];
    
    [self.titleView addSubview:self.titleImageView];
    [self.titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.titleView);
    }];
    
    [self.view addSubview:self.autoScrollView];
    [self.autoScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.top.equalTo(self.titleView.mas_bottom).offset(15);
        make.height.equalTo(@50);
    }];
    
    [self.autoScrollView addSubview:self.autoScrollImageView];
    [self.autoScrollImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.autoScrollView).offset(10);
        make.centerY.equalTo(self.autoScrollView);
    }];
    
    [self.autoScrollView addSubview:self.autoScrollLabel];
    [self.autoScrollLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.autoScrollImageView.mas_right).offset(5);
        make.right.equalTo(self.autoScrollView).offset(-5);
        make.top.equalTo(self.autoScrollView);
        make.height.equalTo(@50);
    }];
    
    [self.view addSubview:self.beijingRacingImageView];
    [self.beijingRacingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.autoScrollView.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
    }];
    
    [self.view addSubview:self.chongqingTimeColorImageView];
    [self.chongqingTimeColorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.beijingRacingImageView.mas_bottom);
        make.centerX.equalTo(self.view);
    }];
    
    [self.view addSubview:self.luckyAirshipImageView];
    [self.luckyAirshipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.chongqingTimeColorImageView.mas_bottom);
        make.centerX.equalTo(self.view);
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



-(UIView *)titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc]init];
    }
    return _titleView;
}

-(UIImageView *)titleImageView{
    if (!_titleImageView) {
        _titleImageView = [[UIImageView alloc]init];
        _titleImageView.image = [UIImage imageNamed:@"youxidating"];
    }
    return _titleImageView;
}

-(UIImageView *)autoScrollImageView{
    if (!_autoScrollImageView) {
        _autoScrollImageView = [[UIImageView alloc]init];
        _autoScrollImageView.image = [UIImage imageNamed:@"trumpet"];
    }
    return _autoScrollImageView;
}

-(UIView *)autoScrollView{
    if (!_autoScrollView) {
        _autoScrollView = [[UIView alloc]init];
        _autoScrollView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        _autoScrollView.layer.cornerRadius = 4;
    }
    return _autoScrollView;
}

- (CCAutoScrollLabel *)autoScrollLabel {
    if (_autoScrollLabel == nil) {
        _autoScrollLabel = [[CCAutoScrollLabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
        _autoScrollLabel.textColor = [UIColor whiteColor];
        _autoScrollLabel.scrollSpeed = 10.0;
        _autoScrollLabel.font = [UIFont systemFontOfSize:14];
    }
    return _autoScrollLabel;
}

-(UIImageView *)beijingRacingImageView{
    if (!_beijingRacingImageView) {
        _beijingRacingImageView = [[UIImageView alloc]init];
        _beijingRacingImageView.userInteractionEnabled = YES;
        _beijingRacingImageView.image = [UIImage imageNamed:@"yxdt-bjsc"];
    }
    return _beijingRacingImageView;
}

-(UIImageView *)chongqingTimeColorImageView{
    if (!_chongqingTimeColorImageView) {
        _chongqingTimeColorImageView = [[UIImageView alloc]init];
        _chongqingTimeColorImageView.userInteractionEnabled = YES;
        _chongqingTimeColorImageView.image = [UIImage imageNamed:@"yxdt-ssc"];
    }
    return _chongqingTimeColorImageView;
}

-(UIImageView *)luckyAirshipImageView{
    if (!_luckyAirshipImageView) {
        _luckyAirshipImageView = [[UIImageView alloc]init];
        _luckyAirshipImageView.userInteractionEnabled = YES;
        _luckyAirshipImageView.image = [UIImage imageNamed:@"yxdt-xfft"];
    }
    return _luckyAirshipImageView;
}

-(UIButton *)beijingRacingButton{
    if (!_beijingRacingButton) {
        _beijingRacingButton = [[UIButton alloc]init];
        [_beijingRacingButton setBackgroundColor:[UIColor clearColor]];
        [_beijingRacingButton addTarget:self action:@selector(clickBeijingRacingButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _beijingRacingButton;
}

-(UIButton *)chongqingTimeColorButton{
    if (!_chongqingTimeColorButton) {
        _chongqingTimeColorButton = [[UIButton alloc]init];
        [_chongqingTimeColorButton setBackgroundColor:[UIColor clearColor]];
        [_chongqingTimeColorButton addTarget:self action:@selector(clickChongqingTimeColorButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chongqingTimeColorButton;
}

-(UIButton *)luckyAirshipButton{
    if (!_luckyAirshipButton) {
        _luckyAirshipButton = [[UIButton alloc]init];
        [_luckyAirshipButton setBackgroundColor:[UIColor clearColor]];
        [_luckyAirshipButton addTarget:self action:@selector(clickLuckyAirshipButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _luckyAirshipButton;
}

-(void)clickBeijingRacingButton{
    CCGameViewController *gameVC = [[CCGameViewController alloc]init];
    gameVC.gameType = GameTypeBeijingRacing;
    [self.navigationController pushViewController:gameVC animated:YES];
}

-(void)clickChongqingTimeColorButton{
    CCGameViewController *gameVC = [[CCGameViewController alloc]init];
    gameVC.gameType = GameTypeChongqingTimeColor;
    [self.navigationController pushViewController:gameVC animated:YES];
}

-(void)clickLuckyAirshipButton{
    CCGameViewController *gameVC = [[CCGameViewController alloc]init];
    gameVC.gameType = GameTypeLuckyAirship;
    [self.navigationController pushViewController:gameVC animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
