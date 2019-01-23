//
//  CCGameDocumentaryView.m
//  SmallGames
//
//  Created by hello on 2018/9/29.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameDocumentaryView.h"
#import "CCUserInfoView.h"

@interface CCGameDocumentaryView()<UITextFieldDelegate>
@property(nonatomic,strong)UIView *showView;

@property(nonatomic,strong)CCUserInfoView *modifyOddsView;
@property(nonatomic,strong)UIButton *cancelButton;
@property(nonatomic,strong)UIButton *confirmButton;

@property(nonatomic,strong)UIImageView *chatTypeImageView;
@property(nonatomic,strong)UIImageView *userHeaderImageView;
@property(nonatomic,strong)UILabel *userNameLabel;
@property(nonatomic,strong)UILabel *userIdLabel;
@end

@implementation CCGameDocumentaryView
-(void)initView{
    [super initView];
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    [self addSubview:self.showView];
    [self.showView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@(MCScreenWidth-60));
        make.height.equalTo(@280);
    }];
    
    [self.showView addSubview:self.chatTypeImageView];
    [self.chatTypeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.showView).offset(10);
        make.top.equalTo(self.showView).offset(10);
    }];
    
    UIButton *chatTypButton = [[UIButton alloc]init];
    [chatTypButton addTarget:self action:@selector(clickRuleButton) forControlEvents:UIControlEventTouchUpInside];
    [self.showView addSubview:chatTypButton];
    [chatTypButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.chatTypeImageView);
    }];
    
    
    [self.showView addSubview:self.userHeaderImageView];
    [self.userHeaderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.showView).offset(20);
        make.centerX.equalTo(self.showView);
        make.width.height.equalTo(@75);
    }];
    
    [self.showView addSubview:self.userNameLabel];
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userHeaderImageView.mas_bottom).offset(15);
        make.centerX.equalTo(self.userHeaderImageView);
    }];
    
    [self.showView addSubview:self.userIdLabel];
    [self.userIdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userNameLabel.mas_bottom).offset(10);
        make.centerX.equalTo(self.userHeaderImageView);
    }];
    
    
    float modifyOddsViewW = MCScreenWidth - 60-90;
    [self.showView addSubview:self.modifyOddsView];
    [self.modifyOddsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userIdLabel.mas_bottom).offset(35);
        make.left.equalTo(self.showView).offset(20);
        make.width.equalTo(@(modifyOddsViewW));
        make.height.equalTo(@40);
    }];
    
    [self.showView addSubview:self.confirmButton];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.modifyOddsView);
        make.left.equalTo(self.modifyOddsView.mas_right).offset(10);
        make.width.height.equalTo(@40);
    }];
    
    [self.showView addSubview:self.cancelButton];
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.showView);
        make.width.height.equalTo(@50);
    }];
    
}

-(void)setChatMessageModel:(CCChatMessageModel *)chatMessageModel{
    _chatMessageModel = chatMessageModel;
    [self.userHeaderImageView setImageWithURL:[NSURL URLWithString:chatMessageModel.head_img_url] placeholder:[UIImage imageNamed:@"GameFootViewIcon_grzx"]];
    self.userNameLabel.text = chatMessageModel.from_client_name;
    self.userIdLabel.text = [NSString stringWithFormat:@"ID：%@",chatMessageModel.from_show_id];
}

-(UIImageView *)chatTypeImageView{
    if (!_chatTypeImageView) {
        _chatTypeImageView = [[UIImageView alloc]init];
        _chatTypeImageView.image = [UIImage imageNamed:@"guize"];
    }
    return _chatTypeImageView;
}

-(UIImageView *)userHeaderImageView{
    if (!_userHeaderImageView) {
        _userHeaderImageView = [[UIImageView alloc]init];
        _userHeaderImageView.image = [UIImage imageNamed:@"0"];
        _userHeaderImageView.layer.cornerRadius = 37.5;
        _userHeaderImageView.layer.masksToBounds = YES;
    }
    return _userHeaderImageView;
}



-(UIView *)showView{
    if (!_showView) {
        _showView = [[UIView alloc]init];
        _showView.backgroundColor = [UIColor whiteColor];
        _showView.layer.masksToBounds = YES;
        _showView.layer.cornerRadius = 10;
    }
    return _showView;
}

-(UILabel *)userNameLabel{
    if (_userNameLabel == nil) {
        _userNameLabel = [[UILabel alloc]init];
        _userNameLabel.font = [UIFont systemFontOfSize:13];
        _userNameLabel.textColor = [UIColor blackColor];
        _userNameLabel.textAlignment = NSTextAlignmentCenter;
        _userNameLabel.text = @"昵称名称";
    }
    return _userNameLabel;
}

-(UILabel *)userIdLabel{
    if (_userIdLabel == nil) {
        _userIdLabel = [[UILabel alloc]init];
        _userIdLabel.font = [UIFont systemFontOfSize:11];
        _userIdLabel.textColor = [UIColor blackColor];
        _userIdLabel.textAlignment = NSTextAlignmentCenter;
        _userIdLabel.text = @"ID：123123123";
    }
    return _userIdLabel;
}


- (UIButton *)confirmButton {
    if (_confirmButton == nil) {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmButton.layer.masksToBounds = YES;
        _confirmButton.layer.cornerRadius = 20;
        _confirmButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_confirmButton setTitle:@"跟单" forState:UIControlStateNormal];
        UIColor *color = MCUIColorFromRGB(0xA188CC);
        _confirmButton.layer.borderWidth = 1;
        _confirmButton.layer.borderColor = color.CGColor;
        [_confirmButton setTitleColor:color forState:UIControlStateNormal];
        [_confirmButton addTarget:self action:@selector(clickConfirmButton) forControlEvents:UIControlEventTouchUpInside];
    } return _confirmButton;
}


- (CCUserInfoView *)modifyOddsView {
    if (_modifyOddsView == nil) {
        _modifyOddsView = [[CCUserInfoView alloc] init];
        _modifyOddsView.textField.placeholder = @"请输入倍率（0.1倍-1000倍）";
        _modifyOddsView.textField.delegate = self;
        _modifyOddsView.textField.keyboardType = UIKeyboardTypeNumberPad;
        _modifyOddsView.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _modifyOddsView.textField.font = [UIFont systemFontOfSize:11];
        _modifyOddsView.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        UIColor *color = MCUIColorFromRGB(0xBFBFBF);
        _modifyOddsView.layer.borderWidth = 1;
        _modifyOddsView.layer.borderColor = color.CGColor;
        _modifyOddsView.backgroundColor = MCUIColorFromRGB(0xEEEEEE);
        _modifyOddsView.layer.cornerRadius = 20;
        _modifyOddsView.layer.masksToBounds = YES;
        
    }
    return _modifyOddsView;
}

- (UIButton *)cancelButton{
    if (_cancelButton == nil) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelButton setImage:[UIImage imageNamed:@"×"] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(clickCancelButton) forControlEvents:UIControlEventTouchUpInside];
    } return _cancelButton;
}

-(void)clickConfirmButton{
    NSString *magnification= self.modifyOddsView.textField.text;
    
    if (magnification.length == 0) {
        [CCView BSMBProgressHUD_onlyTextWithView:[AppDelegate sharedApplicationDelegate].window andText:@"请设置倍率"];
        return;
    }
    
    if ([magnification intValue] == 0) {
        [CCView BSMBProgressHUD_onlyTextWithView:[AppDelegate sharedApplicationDelegate].window andText:@"设置的倍率不合法，请重新设置"];
        return;
    }
    
    magnification = [magnification stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"0"]];
  
    if (self.clickConfirmBtn) {
        self.clickConfirmBtn(magnification,_chatMessageModel.from_show_id);
        self.modifyOddsView.textField.text = nil;
        [self removeFromSuperview];
    }
}

-(void)clickRuleButton{
    if (self.clickRuleBtn) {
        self.clickRuleBtn();
    }
}

-(void)clickCancelButton{
    [self removeFromSuperview];
}
@end

