//
//  CCPersonalPurseScoreViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/22.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalPurseScoreViewController.h"
#import "CCPersonalScoreRecordingViewController.h"
#import "CCCustomerServiceView.h"

@interface CCPersonalPurseScoreViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UIView *backgroundView;
@property(nonatomic,strong)UIButton *confirmButton;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *unitLabel;
@property(nonatomic,strong)UITextField *numberTextField;
@property(nonatomic,strong)CCCustomerServiceView *customerServiceView;

@end

@implementation CCPersonalPurseScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setPurseScoreType:(PurseScoreType)purseScoreType{
    _purseScoreType = purseScoreType;
    if (purseScoreType == PurseScoreTypeUpper) {
        self.title = @"上分";
    }else{
        self.title = @"下分";
    }
}

-(void)initView{
    [super initView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = self.customLeftItem;
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    [CCView BSBarButtonItem_text_who:self.navigationItem size:CGSizeMake(60, 44) target:self selected:@selector(clickRecording) textColor:[UIColor whiteColor] font:13 andText:@"记录" isLeft:YES];
    
    [self.view addSubview:self.backgroundView];
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@70);
        make.right.left.equalTo(self.view);
        make.top.equalTo(self.view).offset(20);
    }];
    
    [self.backgroundView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backgroundView).offset(15);
        make.centerY.equalTo(self.backgroundView);
    }];
    
    [self.backgroundView addSubview:self.unitLabel];
    [self.unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.backgroundView).offset(-10);
        make.centerY.equalTo(self.backgroundView);
    }];
    
    [self.backgroundView addSubview:self.numberTextField];
    [self.numberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.backgroundView).offset(-18);
        make.top.bottom.equalTo(self.backgroundView);
        make.width.equalTo(@100);
    }];
    
    
    [self.view addSubview:self.confirmButton];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(50);
        make.top.equalTo(self.backgroundView.mas_bottom).offset(150);
        make.right.equalTo(self.view).offset(-50);
        make.height.equalTo(@40);
    }];
  
}

-(UIView *)backgroundView{
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc]init];
        _backgroundView.backgroundColor = [UIColor whiteColor];
    }
    return _backgroundView;
}

- (UIButton *)confirmButton {
    if (_confirmButton == nil) {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmButton.backgroundColor = MCUIColorFromRGB(0x1D2443);
        _confirmButton.layer.masksToBounds = YES;
        _confirmButton.layer.cornerRadius = 20;
        _confirmButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_confirmButton setTitle:[NSString stringWithFormat:@"确认%@",self.title] forState:UIControlStateNormal];
        [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_confirmButton addTarget:self action:@selector(clickConfirmButton) forControlEvents:UIControlEventTouchUpInside];
    } return _confirmButton;
}


-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = MCUIColorFromRGB(0x333333);
        _titleLabel.text = [NSString stringWithFormat:@"%@数:",self.title];
    }
    return _titleLabel;
}

-(UILabel *)unitLabel{
    if (_unitLabel == nil) {
        _unitLabel = [[UILabel alloc]init];
        _unitLabel.font = [UIFont systemFontOfSize:11];
        _unitLabel.textColor = MCUIColorFromRGB(0x777777);
        _unitLabel.text = @"分";
    }
    return _unitLabel;
}

-(UITextField *)numberTextField{
    if (!_numberTextField) {
        _numberTextField = [[UITextField alloc]init];
        _numberTextField.placeholder = @"请输入";
        _numberTextField.font = [UIFont systemFontOfSize:18];
        _numberTextField.delegate = self;
        _numberTextField.textColor = MCUIColorFromRGB(0x777777);
        _numberTextField.keyboardType = UIKeyboardTypeNumberPad;
        
        UIImageView *leftPhoneImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
        _numberTextField.rightView = leftPhoneImgView;
        _numberTextField.rightViewMode = UITextFieldViewModeAlways;
        _numberTextField.textAlignment = NSTextAlignmentRight;
    }
    return _numberTextField;
}


-(void)clickRecording{
    CCPersonalScoreRecordingViewController *psrvc = [[CCPersonalScoreRecordingViewController alloc]init];
    psrvc.purseScoreType = _purseScoreType;
    [self.navigationController pushViewController:psrvc animated:YES];
}

-(void)clickConfirmButton{
    if (self.numberTextField.text.length == 0) {
        [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:[NSString stringWithFormat:@"请输入%@分数",self.title]];
        return;
    }
    [self.numberTextField resignFirstResponder];
    
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view andText:[NSString stringWithFormat:@"正在%@，请稍等",self.title]];
    [CCMineManage MineUpperLowerPointsWithPurseScoreType:_purseScoreType andMoney:self.numberTextField.text completion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            if ([error isEqualToString:@"0"]) {
                 [self showCustomerServiceView];
            }else{
                NSString *msg = [resultDictionary objectForKey:@"msg"];
                [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:msg];
            }
        }
    }];
}


-(void)showCustomerServiceView{
    [self.view.window addSubview:self.customerServiceView];
    self.customerServiceView.viewType = ShowViewMessage;
    [self.customerServiceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view.window);
    }];
}

-(CCCustomerServiceView *)customerServiceView{
    if (!_customerServiceView) {
        _customerServiceView = [[CCCustomerServiceView alloc]init];
        _customerServiceView.viewType = ShowViewMessage;
        _customerServiceView.viewMessageString = @"您已提交成功，请等待审核";
    }
    return _customerServiceView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
