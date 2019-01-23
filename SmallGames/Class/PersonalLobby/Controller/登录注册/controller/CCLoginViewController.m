//
//  CCLoginViewController.m
//  KitchenAlwaysOnline
//
//  Created by hello on 2018/9/13.
//  Copyright © 2018年 hello. All rights reserved.
//

#define MCScreenWidth [UIScreen mainScreen].bounds.size.width

#import "CCLoginViewController.h"
#import "CCLoginView.h"
#import "CCRegisteredViewController.h"//注册
#import "CCPasswordViewController.h"
#import "CCHomeViewController.h"
#import "CCPersonalBindingCardView.h"



@interface CCLoginViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)CCLoginView *loginView;
@property(nonatomic, strong)UIButton *loginButton;
@property(nonatomic, strong)UIButton *registerButton;
@property(nonatomic,strong)UIImageView *logoImageView;
@property(nonatomic,strong)CCPersonalBindingCardView *personalBindingCardView;

@end

@implementation CCLoginViewController

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
}



-(void)initView{
    [super initView];
    
    [self.view addSubview:self.loginView];
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(MCScreenWidth-40));
        make.height.equalTo(@100);
        make.center.equalTo(self.view);
    }];
    
    [self.view addSubview:self.loginButton];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginView.mas_bottom).offset(50);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@50);
    }];
    
    [self.view addSubview:self.registerButton];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginButton.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@50);
    }];
    
    [self.view addSubview:self.logoImageView];
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.loginView.mas_top).offset(-50);
        make.centerX.equalTo(self.view);
    }];

    [self addRoomNumberView];
}



- (UIButton *)registerButton {
    if (_registerButton == nil) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerButton.layer.masksToBounds = YES;
        _registerButton.layer.cornerRadius = 5;
        [_registerButton setBackgroundColor:MCUIColorFromRGB(0x44619D)];
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [_registerButton addTarget:self action:@selector(registerButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    } return _registerButton;
}

- (UIButton *)loginButton {
    if (_loginButton == nil) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setBackgroundColor:MCUIColorFromRGB(0x64A0D7)];
        _loginButton.layer.masksToBounds = YES;
        _loginButton.layer.cornerRadius = 5;
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:17];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(clickLoginButton) forControlEvents:UIControlEventTouchUpInside];
    } return _loginButton;
}

-(CCPersonalBindingCardView *)personalBindingCardView{
    if (!_personalBindingCardView) {
        _personalBindingCardView = [[CCPersonalBindingCardView alloc]init];
        _personalBindingCardView.viewType = BaseViewTypeEnterRoomNumber;
        __block typeof(self) weakself = self;
        _personalBindingCardView.clickConfirmBtn = ^(NSString *baseViewString) {
            [weakself verifyRoomNumberWithNumber:baseViewString];
        };
    }
    return _personalBindingCardView;
}

//验证房间号
-(void)verifyRoomNumberWithNumber:(NSString *)number{
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view.window andText:@"房间号验证中..."];
    [CCMineManage MineIntoRoomWithRoomId:number completion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view.window];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view.window andText:@"网络错误，请稍后再试！"];
        }else{
            NSLog(@"%@",resultDictionary);
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            NSString *msg = [resultDictionary objectForKey:@"msg"];
            [CCView BSMBProgressHUD_onlyTextWithView:self.view.window andText:msg];
            
            if ([error isEqualToString:@"0"]) {
                [self.personalBindingCardView removeFromSuperview];
                [CCUserInfoModel UserRoomIDWithObject:number];
            }
        }
    }];
}

-(UIImageView *)logoImageView{
    if (_logoImageView == nil) {
        _logoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"denglu-logo"]];
    }
    return _logoImageView;
}

-(void)forgetButtonClicked{
    CCPasswordViewController *passwordVC = [[CCPasswordViewController alloc]init];
    passwordVC.viewTaye = @"1";
    [self.navigationController pushViewController:passwordVC animated:YES];
}

-(void)registerButtonClicked{
    CCRegisteredViewController *registeredVC = [[CCRegisteredViewController alloc]init];
    registeredVC.roomId = [CCUserInfoModel UserRoomID];
    [self.navigationController pushViewController:registeredVC animated:YES];
}

//登陆
-(void)clickLoginButton{
    [self.loginView.userNameView.textField resignFirstResponder];
    [self.loginView.passwordView.textField resignFirstResponder];
    
    if (self.loginView.userNameView.textField.text.length == 0) {
        [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"请输入用户名"];
        return;
    }
    if (self.loginView.passwordView.textField.text.length == 0) {
        [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"请输入密码"];
        return;
    }
    
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view andText:@"正在登录，请稍等！"];
    [CCMineManage MineLoginWithUserName:self.loginView.userNameView.textField.text andPassWord:self.loginView.passwordView.textField.text andRoomNumber:[CCUserInfoModel UserRoomID] completion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
            
            [self addRoomNumberView];
        }else{
           NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            NSString *msg = [resultDictionary objectForKey:@"msg"];
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:msg];
            if ([error isEqualToString:@"0"]) {
                NSDictionary *userDic = [resultDictionary objectForKey:@"data"];
                [CCUserInfoModel UserInfoStorageWithObject:userDic];
                [AppDelegate sharedApplicationDelegate].userInfoModel = [CCUserInfoModel modelWithDictionary:userDic];;
                self.loginView.userNameView.textField.text = nil;
                self.loginView.passwordView.textField.text = nil;
                __block typeof(self) weakSelf = self;
                dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5* NSEC_PER_SEC));
                dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                    CCHomeViewController *homeVC = [[CCHomeViewController alloc]init];
                    [weakSelf.navigationController pushViewController:homeVC animated:YES];
                });
            }
        }
    }];
}

-(CCLoginView *)loginView{
    if (!_loginView) {
        _loginView = [[CCLoginView alloc]init];
        _loginView.layer.masksToBounds = YES;
        _loginView.layer.cornerRadius = 5;
    }
    return _loginView;
}

-(void)addRoomNumberView{
    for (UIView *view in [AppDelegate sharedApplicationDelegate].window.subviews) {
        if ([view isKindOfClass:[CCPersonalBindingCardView class]]) {
            [view removeFromSuperview];
        }
    }
    [[AppDelegate sharedApplicationDelegate].window addSubview:self.personalBindingCardView];
    [self.personalBindingCardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo([AppDelegate sharedApplicationDelegate].window);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
