//
//  CCGameFootView.m
//  SmallGames
//
//  Created by hello on 2018/9/18.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameFootView.h"
@interface CCGameFootView ()
@property(nonatomic,strong)UIView *footView;
@property(nonatomic,strong)UIButton *customerServiceButton;
@property(nonatomic,strong)UIButton *gameHomeButton;
@property(nonatomic,strong)UIButton *personalHomeButton;

@property(nonatomic,strong)UILabel *customerServiceLabel;
@property(nonatomic,strong)UILabel *personalHomeLabel;

@end
@implementation CCGameFootView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)initView{
    [self addSubview:self.footView];
    [self.footView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
        if (IS_IPHONE_X) {
            make.height.equalTo(@74);
        }else{
            make.height.equalTo(@49);
        }
        
    }];
    
    [self addSubview:self.gameHomeButton];
    [self.gameHomeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(3);
        make.width.height.equalTo(@74);
        make.centerX.equalTo(self);
    }];
    
    [self addSubview:self.customerServiceButton];
    [self.customerServiceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.footView);
        make.height.equalTo(@35);
        make.width.equalTo(@(MCScreenWidth/3));
    }];
    
    [self addSubview:self.personalHomeButton];
    [self.personalHomeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self.footView);
        make.height.equalTo(@35);
        make.width.equalTo(@(MCScreenWidth/3));
    }];
    
    [self addSubview:self.customerServiceLabel];
    [self.customerServiceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.customerServiceButton);
        make.top.equalTo(self.customerServiceButton.mas_bottom).offset(3);
    }];
    
    [self addSubview:self.personalHomeLabel];
    [self.personalHomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.personalHomeButton);
        make.top.equalTo(self.personalHomeButton.mas_bottom).offset(3);
    }];
    
    
}

-(UIView *)footView{
    if (!_footView) {
        _footView = [[UIView alloc]init];
        _footView.backgroundColor = [UIColor colorWithRed:9/255.0 green:14/255.0 blue:33/255.0 alpha:1];
    }
    return _footView;
}

-(UIButton *)gameHomeButton{
    if (!_gameHomeButton) {
        _gameHomeButton = [[UIButton alloc]init];
        _gameHomeButton.layer.masksToBounds = YES;
        _gameHomeButton.layer.cornerRadius = 37;
        _gameHomeButton.backgroundColor = [UIColor grayColor];
        [_gameHomeButton setBackgroundImage:[UIImage imageNamed:@"GameFootViewIcon_yxdt"] forState:UIControlStateNormal];
        [_gameHomeButton addTarget:self action:@selector(clickGameHomeButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _gameHomeButton;
}

-(UIButton *)customerServiceButton{
    if (!_customerServiceButton) {
        _customerServiceButton = [[UIButton alloc]init];
        [_customerServiceButton setImage:[UIImage imageNamed:@"GameFootViewIcon_kfzx"] forState:UIControlStateNormal];
        [_customerServiceButton addTarget:self action:@selector(clickCustomerServiceButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _customerServiceButton;
}

-(UIButton *)personalHomeButton{
    if (!_personalHomeButton) {
        _personalHomeButton = [[UIButton alloc]init];
        [_personalHomeButton setImage:[UIImage imageNamed:@"GameFootViewIcon_grzx"] forState:UIControlStateNormal];
        [_personalHomeButton addTarget:self action:@selector(clickPersonalHomeButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _personalHomeButton;
}

-(UILabel *)customerServiceLabel{
    if (!_customerServiceLabel) {
        _customerServiceLabel = [[UILabel alloc]init];
        _customerServiceLabel.font = [UIFont systemFontOfSize:9];
        _customerServiceLabel.textAlignment = NSTextAlignmentCenter;
        _customerServiceLabel.textColor = [UIColor colorWithRed:158/255.0 green:197/255.0 blue:230/255.0 alpha:1];
        _customerServiceLabel.text = @"客用中心";
    }
    return _customerServiceLabel;
}

-(UILabel *)personalHomeLabel{
    if (!_personalHomeLabel) {
        _personalHomeLabel = [[UILabel alloc]init];
        _personalHomeLabel.font = [UIFont systemFontOfSize:9];
        _personalHomeLabel.textAlignment = NSTextAlignmentCenter;
        _personalHomeLabel.textColor = [UIColor colorWithRed:158/255.0 green:197/255.0 blue:230/255.0 alpha:1];
        _personalHomeLabel.text = @"个人中心";
    }
    return _personalHomeLabel;
}



-(void)clickGameHomeButton{
    if (self.clickGameHomeBtn) {
        self.clickGameHomeBtn();
    }
}

-(void)clickCustomerServiceButton{
    if (self.clickCustomerServiceBtn) {
        self.clickCustomerServiceBtn();
    }
}

-(void)clickPersonalHomeButton{
    if (self.clickPersonalHomeBtn) {
        self.clickPersonalHomeBtn();
    }
}

@end
