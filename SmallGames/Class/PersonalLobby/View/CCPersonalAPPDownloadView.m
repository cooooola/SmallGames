//
//  CCPersonalAPPDownloadView.m
//  SmallGames
//
//  Created by hello on 2018/9/21.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalAPPDownloadView.h"


@interface CCPersonalAPPDownloadView()
@property(nonatomic,strong)UIImageView *bgImageView;
@property(nonatomic,strong)UIImageView *titleImageView;
@property(nonatomic,strong)UIButton *deleteButton;
@property(nonatomic,strong)UIImageView *qrcodeImageView;
@property(nonatomic,strong)UILabel *explanationLabel;
@end

@implementation CCPersonalAPPDownloadView

-(void)initView{
    [super initView];
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    [self addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
    [self addSubview:self.titleImageView];
    [self.titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bgImageView.mas_top);
        make.centerX.equalTo(self);
    }];
    
    [self addSubview:self.deleteButton];
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgImageView).offset(5);
        make.right.equalTo(self.bgImageView).offset(-5);
        make.width.height.equalTo(@50);
    }];
    
    
    [self getData];
}

-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
        _bgImageView.image = [UIImage imageNamed:@"dAPP-bj"];
    }
    return _bgImageView;
}

-(UIImageView *)titleImageView{
    if (!_titleImageView) {
        _titleImageView = [[UIImageView alloc]init];
        _titleImageView.image = [UIImage imageNamed:@"downAPP"];
    }
    return _titleImageView;
}
-(UIButton *)deleteButton{
    if (!_deleteButton) {
        _deleteButton = [[UIButton alloc]init];
        [_deleteButton setImage:[UIImage imageNamed:@"bbyx_guangbi_normal"] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(clickDeleteButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}

-(UIImageView *)qrcodeImageView{
    if (_qrcodeImageView == nil) {
        _qrcodeImageView = [[UIImageView alloc]init];
        _qrcodeImageView.image = [UIImage imageNamed:[CCTool getAppIconName]];
    }
    return _qrcodeImageView;
}

-(UILabel *)explanationLabel{
    if (_explanationLabel == nil) {
        _explanationLabel = [[UILabel alloc]init];
        _explanationLabel.font = [UIFont systemFontOfSize:16];
        _explanationLabel.textColor = [UIColor whiteColor];
        _explanationLabel.text = @"长按识别二维码";
    }
    return _explanationLabel;
}


-(void)getData{
    [CCView BSMBProgressHUD_bufferAndTextWithView:self andText:nil];
    [CCMineManage MineAppDownloadCompletion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self andText:@"网络错误，请稍后再试！"];
            __block typeof(self) weakSelf = self;
            dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5* NSEC_PER_SEC));
            dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                [weakSelf clickDeleteButton];
            });
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            if ([error isEqualToString:@"0"]) {
                NSDictionary *dic = [resultDictionary objectForKey:@"data"];
                if (![dic isKindOfClass:[NSNull class]]) {
                    NSString *imagePath = [dic objectForKey:@"img"];
                    [self selfAddsubViewWithImagePath:imagePath];
                }
            }else{
                NSString *msg = [resultDictionary objectForKey:@"msg"];
                [CCView BSMBProgressHUD_onlyTextWithView:self andText:msg];
                __block typeof(self) weakSelf = self;
                dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5* NSEC_PER_SEC));
                dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                    [weakSelf clickDeleteButton];
                });
            }
        }
    }];
}

-(void)selfAddsubViewWithImagePath:(NSString *)imagePath{
    [self.bgImageView addSubview:self.qrcodeImageView];
    [self.qrcodeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgImageView.mas_top).offset(30);
        make.centerX.equalTo(self);
        make.width.height.equalTo(@(MCScreenWidth/3));
    }];
    
    [self.qrcodeImageView setImageURL:[NSURL URLWithString:imagePath]];
    [self addSubview:self.explanationLabel];
    [self.explanationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.qrcodeImageView.mas_bottom).offset(20);
    }];
}


-(void)clickDeleteButton{
    [self removeFromSuperview];
}

@end
