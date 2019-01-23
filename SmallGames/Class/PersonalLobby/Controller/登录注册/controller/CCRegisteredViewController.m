//
//  CCRegisteredViewController.m
//  KitchenAlwaysOnline
//
//  Created by hello on 2018/9/13.
//  Copyright © 2018年 hello. All rights reserved.
//

#define MCScreenWidth [UIScreen mainScreen].bounds.size.width

#import "CCRegisteredViewController.h"
#import "CCLoginView.h"
#import "Masonry.h"
#import "CCMineManage.h"


@interface CCRegisteredViewController ()
@property(nonatomic,strong)CCLoginView *loginView;
@property(nonatomic,strong)UIButton *registerButton;
@property(strong,nonatomic)UIButton *returnButton;
@property(strong,nonatomic)UIImageView *logoImageView;


@end

@implementation CCRegisteredViewController

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
    // Do any additional setup after loading the view.
    
}

-(void)initView{
    [super initView];
    
    [self.view addSubview:self.loginView];
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(MCScreenWidth-40));
        make.height.equalTo(@250);
        make.center.equalTo(self.view);
    }];
    
    [self.view addSubview:self.registerButton];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginView.mas_bottom).offset(30);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@50);
    }];
    
    [self.view addSubview:self.returnButton];
    [self.returnButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.registerButton.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@50);
    }];
    
    [self.view addSubview:self.logoImageView];
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.loginView.mas_top).offset(-30);
        make.centerX.equalTo(self.view);
    }];
    

    
    
    
    
//    [self.view addSubview:self.phoneView];
//    [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.left.mas_equalTo(self.view).with.offset(0);
//        make.right.mas_equalTo(self.view).with.offset(0);
//        make.top.mas_equalTo(self.confirmView.mas_bottom).with.offset(0);
//        make.height.mas_equalTo(60);
//    }];
    
    
    
    
//    [self.view addSubview:self.confirmButton];
//    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.view).with.offset(15);
//        make.right.mas_equalTo(self.view).with.offset(-15);
//        make.top.mas_equalTo(self.nameView.mas_bottom).with.offset(40);
//        make.height.mas_equalTo(50);
//    }];
    
}



-(CCLoginView *)loginView{
    if (!_loginView) {
        _loginView = [[CCLoginView alloc]init];
        _loginView.layer.masksToBounds = YES;
        _loginView.layer.cornerRadius = 5;
    }
    return _loginView;
}

- (UIButton *)registerButton {
    if (_registerButton == nil) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerButton setBackgroundColor:MCUIColorFromRGB(0x64A0D7)];
        _registerButton.layer.masksToBounds = YES;
        _registerButton.layer.cornerRadius = 5;
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:17];
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_registerButton addTarget:self action:@selector(clickRegisterButton) forControlEvents:UIControlEventTouchUpInside];
    } return _registerButton;
}


- (UIButton *)returnButton{
    if (_returnButton == nil) {
        _returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _returnButton.layer.masksToBounds = YES;
        _returnButton.layer.cornerRadius = 5;
        _returnButton.layer.borderWidth = 1;
        UIColor *color = MCUIColorFromRGB(0x64A0D7);
        _returnButton.layer.borderColor = color.CGColor;
        _returnButton.titleLabel.font = [UIFont systemFontOfSize:17];
        [_returnButton setTitle:@"已有账号，返回登录" forState:UIControlStateNormal];
        [_returnButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_returnButton addTarget:self action:@selector(clickReturnButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _returnButton;
}

-(UIImageView *)logoImageView{
    if (_logoImageView == nil) {
        _logoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"denglu-logo"]];
    }
    return _logoImageView;
}



//注册
-(void)clickRegisterButton{
    if (self.loginView.userNameView.textField.text.length == 0) {
        [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"请输入用户名"];
        return;
    }
    if (self.loginView.passwordView.textField.text.length == 0) {
        [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"请输入密码"];
        return;
    }
    if (self.loginView.confirmView.textField.text.length == 0) {
        [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"请再一次输入密码"];
        return;
    }
    if (![self.loginView.passwordView.textField.text isEqualToString:self.loginView.confirmView.textField.text]) {
        [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"两次输入的密码不一致，请重新输入"];
        return;
    }
    
    if (self.loginView.codeView.textField.text.length == 0) {
        [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"请输入验证码"];
        return;
    }
    
     int result = [self.loginView.codeView.textField.text compare:self.loginView.verificationCodeView.CatString options:NSCaseInsensitiveSearch];
    if (result != 0) {
        [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"验证码错误，请重新输入"];
        [self.loginView.verificationCodeView refreshCode];
        return;
    }
    
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view andText:@"正在注册，请稍等！"];
    [CCMineManage MineRegisterWithUserName:self.loginView.userNameView.textField.text andPassWord:self.loginView.passwordView.textField.text andReferrerId:self.loginView.referrerView.textField.text andRoomId:_roomId completion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            NSString *msg = [resultDictionary objectForKey:@"msg"];
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:msg];
            if ([error isEqualToString:@"0"]) {
                __block typeof(self) weakSelf = self;
                dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5* NSEC_PER_SEC));
                dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                    [weakSelf.navigationController  popViewControllerAnimated:YES];
                });
            }
        }
    }];
}

//返回
-(void)clickReturnButton{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
