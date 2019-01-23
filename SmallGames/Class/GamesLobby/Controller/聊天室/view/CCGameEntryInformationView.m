//
//  CCGameEntryInformationView.m
//  SmallGames
//
//  Created by hello on 2018/9/27.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameEntryInformationView.h"
#import "CCGameTimelyColorKeyboardView.h"
#import "CCGameBeijingRacingKeyboardView.h"

@interface CCGameEntryInformationView()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField *entryInformationTextField;
@property(nonatomic,strong)UIButton *sendMessageButton;
@property(nonatomic,strong)UIButton *switchKeyboardButton;

@property(nonatomic,strong)CCGameTimelyColorKeyboardView *gameTimelyColorKeyboardView;
@property(nonatomic,strong)CCGameBeijingRacingKeyboardView *gameBeijingRacingKeyboardView;
@end

@implementation CCGameEntryInformationView


-(void)initView{
    self.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(exitKeyboard) name:@"ExitKeyboard" object:nil];
    
    [self addSubview:self.switchKeyboardButton];
    [self.switchKeyboardButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self);
        make.height.equalTo(@27);
        make.width.equalTo(@42);
    }];
    
    [self addSubview:self.sendMessageButton];
    [self.sendMessageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.switchKeyboardButton.mas_left).offset(-10);
        make.centerY.equalTo(self);
        make.height.equalTo(@35);
        make.width.equalTo(@70);
    }];
    
    [self addSubview:self.entryInformationTextField];
    [self.entryInformationTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.height.equalTo(@35);
        make.centerY.equalTo(self);
        make.width.equalTo(@(MCScreenWidth-50-27-70));
    }];
}

-(UITextField *)entryInformationTextField{
    if (!_entryInformationTextField) {
        _entryInformationTextField = [[UITextField alloc]init];
        _entryInformationTextField.layer.masksToBounds = YES;
        _entryInformationTextField.layer.cornerRadius = 3;
        _entryInformationTextField.placeholder = @"名次／数字／分数";
        _entryInformationTextField.font = [UIFont systemFontOfSize:12];
        _entryInformationTextField.delegate = self;
        _entryInformationTextField.layer.borderWidth = 1;
        _entryInformationTextField.textColor = MCUIColorFromRGB(0x6AA5D9);
        UIColor *color = MCUIColorFromRGB(0x64A0D7);
        _entryInformationTextField.layer.borderColor = color.CGColor;
        UIImageView *leftPhoneImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        _entryInformationTextField.leftView = leftPhoneImgView;
        _entryInformationTextField.leftViewMode = UITextFieldViewModeAlways;
//        _entryInformationTextField.inputView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MCScreenWidth, 200)];
    }
    return _entryInformationTextField;
}

-(UIButton *)sendMessageButton{
    if (!_sendMessageButton) {
        _sendMessageButton = [[UIButton alloc]init];
        [_sendMessageButton setImage:[UIImage imageNamed:@"jianpam-fasong"] forState:UIControlStateNormal];
        [_sendMessageButton addTarget:self action:@selector(clickSendMessageButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendMessageButton;
}

-(UIButton *)switchKeyboardButton{
    if (!_switchKeyboardButton) {
        _switchKeyboardButton = [[UIButton alloc]init];
        _switchKeyboardButton.selected = NO;
        [_switchKeyboardButton setImage:[UIImage imageNamed:@"jianpan"] forState:UIControlStateNormal];
        
        [_switchKeyboardButton setImage:[UIImage imageNamed:@"youxijianpan-weixuanze"] forState:UIControlStateSelected];
        [_switchKeyboardButton addTarget:self action:@selector(clickSwitchKeyboardButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _switchKeyboardButton;
}

-(CCGameTimelyColorKeyboardView *)gameTimelyColorKeyboardView{
    if (!_gameTimelyColorKeyboardView) {
        _gameTimelyColorKeyboardView = [[CCGameTimelyColorKeyboardView alloc]init];
        __block typeof(self) weakSelf = self;
        _gameTimelyColorKeyboardView.clickBtn = ^(NSString *inputString) {
            [weakSelf gameTimelyColorKeyboardViewInputString:inputString];
        };
    }
    return _gameTimelyColorKeyboardView;
}

-(CCGameBeijingRacingKeyboardView *)gameBeijingRacingKeyboardView{
    if (!_gameBeijingRacingKeyboardView) {
        _gameBeijingRacingKeyboardView = [[CCGameBeijingRacingKeyboardView alloc]init];
        __block typeof(self) weakSelf = self;
        _gameBeijingRacingKeyboardView.clickBtn = ^(NSString *inputString) {
            [weakSelf gameTimelyColorKeyboardViewInputString:inputString];
        };
    }
    
    return _gameBeijingRacingKeyboardView;
}

-(void)clickSendMessageButton{
    if (self.entryInformationTextField.text.length == 0) {
        [CCView BSMBProgressHUD_onlyTextWithView:[AppDelegate sharedApplicationDelegate].window andText:@"请输入内容！"];
        return;
    }
    
    NSString *BetGameString;
    if (self.gameType == GameTypeBeijingRacing) {
        BetGameString = @"pk10";
    }else if(self.gameType == GameTypeChongqingTimeColor){
        BetGameString = @"cqssc";
    }else if(self.gameType == GameTypeLuckyAirship){
        BetGameString = @"xyft";
    }
    
    if (self.clickSendMessageBtn) {
        self.clickSendMessageBtn(self.entryInformationTextField.text, self.switchKeyboardButton.selected, BetGameString);
        self.entryInformationTextField.text = nil;
        [self.entryInformationTextField resignFirstResponder];
    }
}

-(void)clickSwitchKeyboardButton:(UIButton *)sender{
    sender.selected = !sender.selected;
    self.entryInformationTextField.text = nil;
    if (sender.selected) {
        [self.entryInformationTextField resignFirstResponder];
        
        float InputViewH;
        if (self.gameType == GameTypeChongqingTimeColor) {
            InputViewH = 280;
        }else{
            InputViewH = 190;
        }

        self.entryInformationTextField.inputView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,MCScreenWidth, InputViewH)];
        if (self.gameType == GameTypeChongqingTimeColor) {
            [self.entryInformationTextField.inputView addSubview:self.gameTimelyColorKeyboardView];
            [self.gameTimelyColorKeyboardView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.entryInformationTextField.inputView);
            }];
        }else{
            [self.entryInformationTextField.inputView addSubview:self.gameBeijingRacingKeyboardView];
            [self.gameBeijingRacingKeyboardView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.entryInformationTextField.inputView);
            }];
        }
        [self.entryInformationTextField becomeFirstResponder];
    }else{
        [self.entryInformationTextField resignFirstResponder];
        
        self.entryInformationTextField.inputView = nil;
        
        [self.entryInformationTextField becomeFirstResponder];
    }
}

-(void)gameTimelyColorKeyboardViewInputString:(NSString *)inputString{
    NSString *text = self.entryInformationTextField.text;
    if ([inputString isEqualToString:@"x"]) {
        if (text.length == 0) {
            return;
        }
        self.entryInformationTextField.text = [self.entryInformationTextField.text substringToIndex:self.entryInformationTextField.text.length-1];
        return;
    }
    if ([inputString isEqualToString:@"关闭"]) {
        [self.entryInformationTextField resignFirstResponder];
        return;
    }
    self.entryInformationTextField.text = [NSString stringWithFormat:@"%@%@",text,inputString];
}

-(void)exitKeyboard{
    [self.entryInformationTextField resignFirstResponder];
}

@end
