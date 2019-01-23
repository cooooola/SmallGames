//
//  CCPersonalHomeHeaderView.m
//  SmallGames
//
//  Created by hello on 2018/9/20.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalHomeHeaderView.h"

@interface CCPersonalHomeHeaderView()<UITextFieldDelegate>
@property(nonatomic,strong)UILabel *purseTitleLabel;//钱包
@property(nonatomic,strong)UILabel *purseLabel;
@property(nonatomic,strong)UIButton *purseButton;

@property(nonatomic,strong)UILabel *profitTitleLabel;//盈亏
@property(nonatomic,strong)UILabel *profitLabel;
@property(nonatomic,strong)UIButton *profitButton;

@property(nonatomic,strong)UILabel *streamTitleLabel;//流水
@property(nonatomic,strong)UILabel *streamLabel;
@property(nonatomic,strong)UIButton *streamButton;

@property(nonatomic,strong)UIButton *userHeaderImageButton;
@property(nonatomic,strong)UILabel *userNameLabel;
@property(nonatomic,strong)UILabel *userIDLabel;

@property(nonatomic,strong)UIButton *changeUserNameButton;

@property(nonatomic,strong)UITextField *changeUserNameTextField;

@property(nonatomic,strong)UIButton *determineButton;
@property(nonatomic,strong)UIButton *cancelButton;

@property(nonatomic,strong)UIView *viewLine_1;
@property(nonatomic,strong)UIView *viewLine_2;

@end

@implementation CCPersonalHomeHeaderView

-(void)setYingkueiString:(NSString *)yingkueiString{
    _yingkueiString = yingkueiString;
    self.profitLabel.text = [NSString stringWithFormat:@"%@",yingkueiString];
}

-(void)setLushuiStrin:(NSString *)lushuiStrin{
    _lushuiStrin = lushuiStrin;
    self.streamLabel.text = [NSString stringWithFormat:@"%@",lushuiStrin];
}

-(void)setUmoneyString:(NSString *)umoneyString{
    _umoneyString = umoneyString;
    self.purseLabel.text = [NSString stringWithFormat:@"%@",umoneyString];
}

-(void)setUserNameString:(NSString *)userNameString{
    _userNameString = userNameString;
    self.userNameLabel.text = [NSString stringWithFormat:@"%@",userNameString];
}


-(void)initView{
    [super initView];
    self.backgroundColor = MCUIColorFromRGB(0x1D2443);
    float labelW = (MCScreenWidth-2)/3;
    
    [self addSubview:self.purseTitleLabel];
    [self.purseTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.width.equalTo(@(labelW));
        make.bottom.equalTo(self).offset(-10);
    }];
    
    [self addSubview:self.purseLabel];
    [self.purseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.width.equalTo(@(labelW));
        make.bottom.equalTo(self.purseTitleLabel.mas_top).offset(-10);
    }];
    
    [self addSubview:self.profitTitleLabel];
    [self.profitTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.purseTitleLabel.mas_right).offset(1);
        make.width.equalTo(@(labelW));
        make.bottom.equalTo(self).offset(-10);
    }];
    
    [self addSubview:self.profitLabel];
    [self.profitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.purseTitleLabel.mas_right).offset(1);
        make.width.equalTo(@(labelW));
        make.bottom.equalTo(self.profitTitleLabel.mas_top).offset(-10);
    }];
    
    [self addSubview:self.streamTitleLabel];
    [self.streamTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.width.equalTo(@(labelW));
        make.bottom.equalTo(self).offset(-10);
    }];
    
    [self addSubview:self.streamLabel];
    [self.streamLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.width.equalTo(@(labelW));
        make.bottom.equalTo(self.profitTitleLabel.mas_top).offset(-10);
    }];
    
    [self addSubview:self.viewLine_1];
    [self.viewLine_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.purseTitleLabel.mas_right);
        make.right.equalTo(self.profitTitleLabel.mas_left);
        make.top.equalTo(self.purseLabel);
        make.bottom.equalTo(self.purseTitleLabel);
    }];
    
    [self addSubview:self.viewLine_2];
    [self.viewLine_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.profitTitleLabel.mas_right);
        make.right.equalTo(self.streamTitleLabel.mas_left);
        make.top.equalTo(self.purseLabel);
        make.bottom.equalTo(self.purseTitleLabel);
    }];
    
    
    [self addSubview:self.purseButton];
    [self.purseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.viewLine_1);
        make.left.equalTo(self);
        make.right.equalTo(self.viewLine_1.mas_left);
    }];
    
    [self addSubview:self.profitButton];
    [self.profitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.viewLine_1);
        make.left.equalTo(self.viewLine_1.mas_right);
        make.right.equalTo(self.viewLine_2.mas_left);
    }];
    
    [self addSubview:self.streamButton];
    [self.streamButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.viewLine_1);
        make.left.equalTo(self.viewLine_2.mas_right);
        make.right.equalTo(self);
    }];
    
    
    [self addSubview:self.userHeaderImageButton];
    [self.userHeaderImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(40);
        make.left.equalTo(self).offset(30);
        make.width.height.equalTo(@65);
    }];
    
    [self addSubview:self.userNameLabel];
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userHeaderImageButton).offset(5);
        make.left.equalTo(self.userHeaderImageButton.mas_right).offset(15);
    }];
    
    [self addSubview:self.changeUserNameButton];
    [self.changeUserNameButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userNameLabel.mas_right).offset(10);
        make.centerY.equalTo(self.userNameLabel);
    }];
    
    [self addSubview:self.userIDLabel];
    [self.userIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.userHeaderImageButton).offset(-5);
        make.left.equalTo(self.userNameLabel);
        make.right.equalTo(self).offset(-15);
    }];
    
    [self addSubview:self.changeUserNameTextField];
    [self.changeUserNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userHeaderImageButton).offset(5);
        make.left.equalTo(self.userHeaderImageButton.mas_right).offset(15);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
    }];
    self.changeUserNameTextField.hidden = YES;
    
    [self addSubview:self.determineButton];
    [self.determineButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.changeUserNameTextField.mas_right);
        make.centerY.equalTo(self.changeUserNameTextField);
        make.width.equalTo(@60);
        make.height.equalTo(@20);
    }];
    self.determineButton.hidden = YES;
    
    [self addSubview:self.cancelButton];
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.determineButton.mas_right);
        make.centerY.equalTo(self.determineButton);
        make.width.equalTo(@60);
        make.height.equalTo(@20);
    }];
    self.cancelButton.hidden = YES;
    
}

-(UILabel *)purseTitleLabel{
    if (_purseTitleLabel == nil) {
        _purseTitleLabel = [[UILabel alloc]init];
        _purseTitleLabel.font = [UIFont systemFontOfSize:14];
        _purseTitleLabel.textColor = MCUIColorFromRGB(0xC8C8C8);
        _purseTitleLabel.textAlignment = NSTextAlignmentCenter;
        _purseTitleLabel.text = @"我的钱包";
    }
    return _purseTitleLabel;
}
-(UILabel *)profitTitleLabel{
    if (_profitTitleLabel == nil) {
        _profitTitleLabel = [[UILabel alloc]init];
        _profitTitleLabel.font = [UIFont systemFontOfSize:14];
        _profitTitleLabel.textColor = MCUIColorFromRGB(0xC8C8C8);
        _profitTitleLabel.textAlignment = NSTextAlignmentCenter;
        _profitTitleLabel.text = @"今日盈亏";
    }
    return _profitTitleLabel;
}
-(UILabel *)streamTitleLabel{
    if (_streamTitleLabel == nil) {
        _streamTitleLabel = [[UILabel alloc]init];
        _streamTitleLabel.font = [UIFont systemFontOfSize:14];
        _streamTitleLabel.textColor = MCUIColorFromRGB(0xC8C8C8);
        _streamTitleLabel.textAlignment = NSTextAlignmentCenter;
        _streamTitleLabel.text = @"今日流水";
    }
    return _streamTitleLabel;
}

-(UILabel *)purseLabel{
    if (_purseLabel == nil) {
        _purseLabel = [[UILabel alloc]init];
        _purseLabel.font = [UIFont systemFontOfSize:14];
        _purseLabel.textColor = MCUIColorFromRGB(0xC8C8C8);
        _purseLabel.textAlignment = NSTextAlignmentCenter;
        NSString *umoney = [NSString stringWithFormat:@"%@",[AppDelegate sharedApplicationDelegate].userInfoModel.umoney];
        if (umoney.length == 0 || [umoney isEqualToString:@"<null>"]||[umoney isEqual:nil]||[umoney isKindOfClass:[NSNull class]]) {
            _purseLabel.text = @"0";
        }else{
            _purseLabel.text = umoney;
        }
    }
    return _purseLabel;
}
-(UILabel *)profitLabel{
    if (_profitLabel == nil) {
        _profitLabel = [[UILabel alloc]init];
        _profitLabel.font = [UIFont systemFontOfSize:14];
        _profitLabel.textColor = MCUIColorFromRGB(0xC8C8C8);
        _profitLabel.textAlignment = NSTextAlignmentCenter;
        _profitLabel.text = @"盈亏";
    }
    return _profitLabel;
}
-(UILabel *)streamLabel{
    if (_streamLabel == nil) {
        _streamLabel = [[UILabel alloc]init];
        _streamLabel.font = [UIFont systemFontOfSize:14];
        _streamLabel.textColor = MCUIColorFromRGB(0xC8C8C8);
        _streamLabel.textAlignment = NSTextAlignmentCenter;
        _streamLabel.text = @"流水";
    }
    return _streamLabel;
}

-(UIButton *)userHeaderImageButton{
    if (_userHeaderImageButton == nil) {
        _userHeaderImageButton = [[UIButton alloc]init];
        _userHeaderImageButton.backgroundColor = MCUIColorFromRGB(0x54619E);
        _userHeaderImageButton.layer.masksToBounds = YES;
        _userHeaderImageButton.layer.cornerRadius = 5;
        _userHeaderImageButton.imageView.contentMode = UIViewContentModeScaleToFill;
        [_userHeaderImageButton setImageWithURL:[NSURL URLWithString:[AppDelegate sharedApplicationDelegate].userInfoModel.headimg] forState:UIControlStateNormal placeholder:nil];
        [_userHeaderImageButton addTarget:self action:@selector(clickUserHeaderImageButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _userHeaderImageButton;
}

-(UILabel *)userNameLabel{
    if (_userNameLabel == nil) {
        _userNameLabel = [[UILabel alloc]init];
        _userNameLabel.font = [UIFont systemFontOfSize:14];
        _userNameLabel.textColor = MCUIColorFromRGB(0x6AA5D9);
        _userNameLabel.text = [AppDelegate sharedApplicationDelegate].userInfoModel.username;
    }
    return _userNameLabel;
}

-(UILabel *)userIDLabel{
    if (_userIDLabel == nil) {
        _userIDLabel = [[UILabel alloc]init];
        _userIDLabel.font = [UIFont systemFontOfSize:14];
        _userIDLabel.textColor = MCUIColorFromRGB(0x6AA5D9);
        _userIDLabel.text = [NSString stringWithFormat:@"ID：%@",[AppDelegate sharedApplicationDelegate].userInfoModel.showid];
    }
    return _userIDLabel;
}

-(UIButton *)changeUserNameButton{
    if (!_changeUserNameButton) {
        _changeUserNameButton = [[UIButton alloc]init];
        _changeUserNameButton.hidden = YES;
        [_changeUserNameButton setImage:[UIImage imageNamed:@"PEN3"] forState:UIControlStateNormal];
        [_changeUserNameButton addTarget:self action:@selector(clickChangeUserNameButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeUserNameButton;
}

-(UITextField *)changeUserNameTextField{
    if (!_changeUserNameTextField) {
        _changeUserNameTextField = [[UITextField alloc]init];
        _changeUserNameTextField.layer.masksToBounds = YES;
        _changeUserNameTextField.layer.cornerRadius = 2;
        _changeUserNameTextField.placeholder = @"输入新昵称";
        _changeUserNameTextField.font = [UIFont systemFontOfSize:14];
        _changeUserNameTextField.delegate = self;
        _changeUserNameTextField.layer.borderWidth = 1;
        _changeUserNameTextField.textColor = MCUIColorFromRGB(0x6AA5D9);
        UIColor *color = MCUIColorFromRGB(0x6AA5D9);
        _changeUserNameTextField.layer.borderColor = color.CGColor;
        UIImageView *leftPhoneImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
        _changeUserNameTextField.leftView = leftPhoneImgView;
        _changeUserNameTextField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _changeUserNameTextField;
}

- (UIButton *)determineButton {
    if (_determineButton == nil) {
        _determineButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _determineButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_determineButton setTitle:@"确定" forState:UIControlStateNormal];
        [_determineButton addTarget:self action:@selector(clickDetermineButton) forControlEvents:UIControlEventTouchUpInside];
    } return _determineButton;
}

- (UIButton *)cancelButton {
    if (_cancelButton == nil) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(clickCancelButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

-(UIButton *)profitButton{
    if (!_profitButton) {
        _profitButton = [[UIButton alloc]init];
        _profitButton.backgroundColor = [UIColor clearColor];
        [_profitButton addTarget:self action:@selector(clickProfitButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _profitButton;
}
-(UIButton *)streamButton{
    if (!_streamButton) {
        _streamButton = [[UIButton alloc]init];
        _streamButton.backgroundColor = [UIColor clearColor];
        [_streamButton addTarget:self action:@selector(clickStreamButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _streamButton;
}

-(UIButton *)purseButton{
    if (!_purseButton) {
        _purseButton = [[UIButton alloc]init];
        _purseButton.backgroundColor = [UIColor clearColor];
        [_purseButton addTarget:self action:@selector(clickPurseButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _purseButton;
}

-(UIView *)viewLine_1{
    if (!_viewLine_1) {
        _viewLine_1 = [[UIView alloc]init];
        _viewLine_1.backgroundColor = MCUIColorFromRGB(0x54619E);
    }
    return _viewLine_1;
}
-(UIView *)viewLine_2{
    if (!_viewLine_2) {
        _viewLine_2 = [[UIView alloc]init];
        _viewLine_2.backgroundColor = MCUIColorFromRGB(0x54619E);
    }
    return _viewLine_2;
}


-(void)clickUserHeaderImageButton{
    if (self.clickUserHeaderImageBtn) {
        self.clickUserHeaderImageBtn();
    }
}

-(void)clickChangeUserNameButton{
    self.userNameLabel.hidden = YES;
    self.changeUserNameButton.hidden = YES;
    self.changeUserNameTextField.hidden = NO;
    [self.changeUserNameTextField becomeFirstResponder];
    
    self.determineButton.hidden = NO;
    self.cancelButton.hidden = NO;
}

-(void)clickDetermineButton{
    if (self.changeUserNameTextField.text.length == 0) {
        [CCView BSMBProgressHUD_onlyTextWithView:self.window andText:@"请输入新的昵称"];
        return;
    }
    [self.changeUserNameTextField resignFirstResponder];
    if ([self.changeUserNameTextField.text isEqualToString:self.userNameLabel.text]) {
        [self clickCancelButton];
        return;
    }
    self.userNameLabel.text = self.changeUserNameTextField.text;
    [self clickCancelButton];
    if (self.clickDetermineBtn) {
        self.clickDetermineBtn(self.changeUserNameTextField.text);
    }
}

-(void)clickCancelButton{
    [self.changeUserNameTextField resignFirstResponder];
    self.userNameLabel.hidden = NO;
    self.changeUserNameButton.hidden = NO;
    self.changeUserNameTextField.hidden = YES;
    self.determineButton.hidden = YES;
    self.cancelButton.hidden = YES;
}

-(void)clickProfitButton{
    if (self.clickProfitBtn) {
        self.clickProfitBtn();
    }
}

-(void)clickStreamButton{
    if (self.clickStreamBtn) {
        self.clickStreamBtn();
    }
}

-(void)clickPurseButton{
    if(self.clickPurseBtn){
        self.clickPurseBtn();
    }
}


-(void)setUserHeaderImage:(UIImage *)userHeaderImage{
    [self.userHeaderImageButton setImage:userHeaderImage forState:UIControlStateNormal];
}
@end
