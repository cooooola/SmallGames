//
//  CCPersonalBindingCardView.m
//  SmallGames
//
//  Created by hello on 2018/9/21.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalBindingCardView.h"
@interface CCPersonalBindingCardView()<UITextFieldDelegate>
@property(nonatomic,strong)UIView *showView;
@property(nonatomic,strong)UIView *titleView;
@property(nonatomic,strong)UIButton *confirmButton;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UITextField *fillCardNumberTextField;
@property(nonatomic,strong)UIButton *deleteButton;
@end

@implementation CCPersonalBindingCardView

-(void)initView{
    [super initView];
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.4];
    
    [self addSubview:self.showView];
    [self.showView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-15);
        make.center.equalTo(self);
        make.height.equalTo(@210);
    }];
    
    [self.showView addSubview:self.titleView];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.showView);
        make.height.equalTo(@40);
    }];
    
    [self.titleView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.showView).offset(15);
        make.top.bottom.equalTo(self.titleView);
        make.width.equalTo(@120);
    }];
    
    [self.titleView addSubview:self.deleteButton];
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self.titleView);
        make.width.equalTo(@40);
    }];
    
    [self.showView addSubview:self.confirmButton];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@50);
        make.right.left.bottom.equalTo(self.showView);
    }];
    
    [self.showView addSubview:self.fillCardNumberTextField];
    [self.fillCardNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.showView).offset(25);
        make.right.equalTo(self.showView).offset(-25);
        make.height.equalTo(@50);
        make.centerY.equalTo(self.showView).offset(-10);
    }];
    
    
}

-(UIView *)showView{
    if (_showView == nil) {
        _showView = [[UIView alloc]init];
        _showView.backgroundColor = MCUIColorFromRGB(0x424458);
        _showView.layer.masksToBounds = YES;
        _showView.layer.cornerRadius = 5;
    }
    return _showView;
}

-(UIView *)titleView{
    if (_titleView == nil) {
        _titleView = [[UIView alloc]init];
        _titleView.backgroundColor = MCUIColorFromRGB(0x64A0D7);
    }
    return _titleView;
}

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.backgroundColor = MCUIColorFromRGB(0x424458);
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"填写银行卡";
    }
    return _titleLabel;
}

- (UIButton *)confirmButton {
    if (_confirmButton == nil) {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmButton setBackgroundColor:MCUIColorFromRGB(0x00ACED)];
        _confirmButton.titleLabel.font = [UIFont systemFontOfSize:17];
        [_confirmButton setTitle:@"保存" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_confirmButton addTarget:self action:@selector(clickConfirmButton) forControlEvents:UIControlEventTouchUpInside];
    } return _confirmButton;
}

-(UITextField *)fillCardNumberTextField{
    if (!_fillCardNumberTextField) {
        _fillCardNumberTextField = [[UITextField alloc]init];
        _fillCardNumberTextField.backgroundColor = [UIColor whiteColor];
        _fillCardNumberTextField.layer.masksToBounds = YES;
        _fillCardNumberTextField.layer.cornerRadius = 2;
        _fillCardNumberTextField.placeholder = @"请输入银行卡号";
        _fillCardNumberTextField.font = [UIFont systemFontOfSize:14];
        _fillCardNumberTextField.delegate = self;
        _fillCardNumberTextField.textColor = MCUIColorFromRGB(0xACADB5);
        UIImageView *leftPhoneImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
        _fillCardNumberTextField.leftView = leftPhoneImgView;
        _fillCardNumberTextField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _fillCardNumberTextField;
}

-(UIButton *)deleteButton{
    if (!_deleteButton) {
        _deleteButton = [[UIButton alloc]init];
        [_deleteButton setImage:[UIImage imageNamed:@"BindingCardView_shutdown"] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(clickDeleteButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}


-(void)setViewType:(BaseViewType)viewType{
    _viewType = viewType;
    if (viewType == BaseViewTypeAlipay) {
        self.fillCardNumberTextField.placeholder = @"请输入支付宝号";
        self.titleLabel.text = [NSString stringWithFormat:@"填写支付宝"];
    }else if(viewType == BaseViewTypeBankCard){
        self.fillCardNumberTextField.placeholder = @"请输入银行卡号";
        self.titleLabel.text = [NSString stringWithFormat:@"填写银行卡"];
    }else{
        self.fillCardNumberTextField.placeholder = @"请输入房间号";
        self.titleLabel.text = [NSString stringWithFormat:@"请输入房间号"];
        [_confirmButton setTitle:@"进入" forState:UIControlStateNormal];
        _deleteButton.hidden = YES;
        _fillCardNumberTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
}

-(void)clickConfirmButton{
    if (self.fillCardNumberTextField.text.length == 0) {
        [CCView BSMBProgressHUD_onlyTextWithView:self andText:self.fillCardNumberTextField.placeholder];
        return;
    }
    if (self.clickConfirmBtn) {
        self.clickConfirmBtn(self.fillCardNumberTextField.text);
    }
    self.fillCardNumberTextField.text = nil;
    if (_viewType != BaseViewTypeEnterRoomNumber) {
       [self removeFromSuperview];
    }
}

-(void)clickDeleteButton{
    [self removeFromSuperview];
}

@end
