//
//  CCGameModifyOddsView.m
//  SmallGames
//
//  Created by hello on 2018/9/29.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameModifyOddsView.h"
#import "CCUserInfoView.h"

@interface CCGameModifyOddsView()<UITextFieldDelegate>
@property(nonatomic,strong)UIView *showView;
@property(nonatomic,strong)UIButton *confirmButton;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *currentMagnificationLabel;
@property(nonatomic,strong)CCUserInfoView *modifyOddsView;
@property(nonatomic,strong)UIButton *cancelButton;
@end

@implementation CCGameModifyOddsView

-(void)setGameDocumentaryModel:(CCGameDocumentaryModel *)gameDocumentaryModel{
    _gameDocumentaryModel = gameDocumentaryModel;
    self.currentMagnificationLabel.text = [NSString stringWithFormat:@"当前倍率为 %@ 倍",gameDocumentaryModel.bl];
}

-(void)initView{
    [super initView];
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    [self addSubview:self.showView];
    [self.showView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@(MCScreenWidth-80));
        make.height.equalTo(@300);
    }];
    
    [self.showView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.showView).offset(30);
        make.centerX.equalTo(self.showView);
    }];
    
    [self.showView addSubview:self.currentMagnificationLabel];
    [self.currentMagnificationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.showView).offset(20);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(45);
    }];
    
    [self.showView addSubview:self.modifyOddsView];
    [self.modifyOddsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.currentMagnificationLabel.mas_bottom).offset(10);
        make.left.equalTo(self.showView).offset(20);
        make.right.equalTo(self.showView).offset(-20);
        make.height.equalTo(@40);
    }];
    
    float buttonW = (MCScreenWidth - 60-80)/2;
    
    [self addSubview:self.cancelButton];
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.showView).offset(20);
        make.top.equalTo(self.modifyOddsView.mas_bottom).offset(50);
        make.width.equalTo(@(buttonW));
        make.height.equalTo(@42);
    }];
    
    [self addSubview:self.confirmButton];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.showView).offset(-20);
        make.top.equalTo(self.modifyOddsView.mas_bottom).offset(50);
        make.width.equalTo(@(buttonW));
        make.height.equalTo(@42);
    }];
    
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

- (UIButton *)confirmButton {
    if (_confirmButton == nil) {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmButton.layer.masksToBounds = YES;
        _confirmButton.layer.cornerRadius = 21;
        _confirmButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_confirmButton setTitle:@"确定" forState:UIControlStateNormal];
        UIColor *color = MCUIColorFromRGB(0xD3D3D3);
        _confirmButton.layer.borderWidth = 1;
        _confirmButton.layer.borderColor = color.CGColor;
        [_confirmButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_confirmButton addTarget:self action:@selector(clickConfirmButtonButton) forControlEvents:UIControlEventTouchUpInside];
    } return _confirmButton;
}

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = [NSString stringWithFormat:@"修改倍率"];
    }
    return _titleLabel;
}

-(UILabel *)currentMagnificationLabel{
    if (_currentMagnificationLabel == nil) {
        _currentMagnificationLabel = [[UILabel alloc]init];
        _currentMagnificationLabel.font = [UIFont systemFontOfSize:14];
        _currentMagnificationLabel.textColor = MCUIColorFromRGB(0x333333);
        _currentMagnificationLabel.textAlignment = NSTextAlignmentCenter;
        _currentMagnificationLabel.text = [NSString stringWithFormat:@"当前倍率为3倍"];
    }
    return _currentMagnificationLabel;
}

- (CCUserInfoView *)modifyOddsView {
    if (_modifyOddsView == nil) {
        _modifyOddsView = [[CCUserInfoView alloc] init];
        _modifyOddsView.textField.placeholder = @"请输入更改的倍率";
//        _modifyOddsView.textField.secureTextEntry = YES;
        _modifyOddsView.textField.delegate = self;
        _modifyOddsView.textField.keyboardType = UIKeyboardTypeNumberPad;
        _modifyOddsView.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
//        _modifyOddsView.textField.secureTextEntry = YES;
        _modifyOddsView.textField.font = [UIFont systemFontOfSize:11];
        _modifyOddsView.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        
    } return _modifyOddsView;
}

- (UIButton *)cancelButton {
    if (_cancelButton == nil) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelButton.layer.masksToBounds = YES;
        _cancelButton.layer.cornerRadius = 21;
        _cancelButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        UIColor *color = MCUIColorFromRGB(0xD3D3D3);
        _cancelButton.layer.borderWidth = 1;
        _cancelButton.layer.borderColor = color.CGColor;
        [_cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(clickCancelButton) forControlEvents:UIControlEventTouchUpInside];
    } return _cancelButton;
}

-(void)clickConfirmButtonButton{
    NSString *magnification= self.modifyOddsView.textField.text;
    
    if (magnification.length == 0) {
        [CCView BSMBProgressHUD_onlyTextWithView:[AppDelegate sharedApplicationDelegate].window andText:@"请设置新的倍率"];
        return;
    }
    
    if ([magnification intValue] == 0) {
        [CCView BSMBProgressHUD_onlyTextWithView:[AppDelegate sharedApplicationDelegate].window andText:@"设置的倍率不合法，请重新设置"];
        return;
    }

    magnification = [magnification stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"0"]];
    if ([magnification intValue] == [_gameDocumentaryModel.bl intValue]) {
        [CCView BSMBProgressHUD_onlyTextWithView:[AppDelegate sharedApplicationDelegate].window andText:@"和当前倍率相同，不用重新修改"];
        return;
    }
    if (self.clickConfirmButtonBtn) {
        self.clickConfirmButtonBtn(magnification);
    }
}



-(void)clickCancelButton{
    [self removeFromSuperview];
}


@end
