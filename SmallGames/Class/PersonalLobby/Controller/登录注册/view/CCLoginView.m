//
//  CCLoginView.m
//  SmallGames
//
//  Created by hello on 2018/9/19.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCLoginView.h"


@interface CCLoginView()<UITextFieldDelegate>

@end

@implementation CCLoginView

-(void)initView{
    [super initView];
    [self addSubview:self.userNameView];
    [self.userNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).with.offset(0);
        make.right.mas_equalTo(self).with.offset(0);
        make.top.mas_equalTo(self).with.offset(0);
        make.height.mas_equalTo(50);
    }];
    
    [self addSubview:self.passwordView];
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).with.offset(0);
        make.right.mas_equalTo(self).with.offset(0);
        make.top.mas_equalTo(self.userNameView.mas_bottom).with.offset(0);
        make.height.mas_equalTo(50);
    }];
    
    [self addSubview:self.confirmView];
    [self.confirmView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).with.offset(0);
        make.right.mas_equalTo(self).with.offset(0);
        make.top.mas_equalTo(self.passwordView.mas_bottom).with.offset(0);
        make.height.mas_equalTo(50);
    }];
    
    [self addSubview:self.codeView];
    [self.codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).with.offset(0);
        make.right.mas_equalTo(self).with.offset(0);
        make.top.mas_equalTo(self.confirmView.mas_bottom).with.offset(0);
        make.height.mas_equalTo(50);
    }];
    
    [self.codeView addSubview:self.verificationCodeView];
    [self.verificationCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self.codeView);
        make.width.equalTo(@120);
    }];
    self.codeView.textField.rightView = self.verificationCodeView;
    
    [self addSubview:self.referrerView];
    [self.referrerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).with.offset(0);
        make.right.mas_equalTo(self).with.offset(0);
        make.top.mas_equalTo(self.codeView.mas_bottom).with.offset(0);
        make.height.mas_equalTo(50);
    }];
    
}

- (CCUserInfoView *)userNameView {
    if (_userNameView == nil) {
        _userNameView = [[CCUserInfoView alloc] init];
        _userNameView.textField.placeholder = @"请输入账号";
        _userNameView.textField.delegate = self;
        _userNameView.textField.keyboardType = UIKeyboardTypeASCIICapable;
        _userNameView.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _userNameView.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    } return _userNameView;
}

- (CCUserInfoView *)passwordView {
    if (_passwordView == nil) {
        _passwordView = [[CCUserInfoView alloc] init];
        _passwordView.textField.placeholder = @"请输入密码";
        _passwordView.textField.secureTextEntry = YES;
        _passwordView.textField.delegate = self;
        _passwordView.textField.keyboardType = UIKeyboardTypeASCIICapable;
        _passwordView.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _passwordView.textField.secureTextEntry = YES;
        _passwordView.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        
    } return _passwordView;
}

- (CCUserInfoView *)confirmView {
    if (_confirmView == nil) {
        _confirmView = [[CCUserInfoView alloc] init];
        _confirmView.textField.placeholder = @"请再次输入密码";
        _confirmView.textField.delegate = self;
        _confirmView.textField.keyboardType = UIKeyboardTypeASCIICapable;
        _confirmView.textField.secureTextEntry = YES;
        _confirmView.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _confirmView.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    } return _confirmView;
}

- (CCUserInfoView *)codeView {
    if (_codeView == nil) {
        _codeView = [[CCUserInfoView alloc] init];
        _codeView.textField.placeholder = @"请输入验证码";
        _codeView.textField.delegate = self;
        _codeView.textField.keyboardType = UIKeyboardTypeASCIICapable;
        _codeView.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _codeView.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        _codeView.textField.rightViewMode = UITextFieldViewModeAlways;
    }
    return _codeView;
}

- (CCUserInfoView *)referrerView {
    if (_referrerView == nil) {
        _referrerView = [[CCUserInfoView alloc] init];
        _referrerView.textField.placeholder = @"请输入推荐人";
        _referrerView.textField.delegate = self;
        _referrerView.textField.keyboardType = UIKeyboardTypeASCIICapable;
        _referrerView.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _referrerView.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    }
    return _referrerView;
}

-(CCVerificationCodeView *)verificationCodeView{
    if (!_verificationCodeView) {
        _verificationCodeView = [[CCVerificationCodeView alloc]init];
    }
    return _verificationCodeView;
}

@end
