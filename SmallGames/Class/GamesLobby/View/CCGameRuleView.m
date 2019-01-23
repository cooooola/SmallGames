//
//  CCGameRuleView.m
//  SmallGames
//
//  Created by hello on 2018/10/8.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameRuleView.h"
#import <WebKit/WebKit.h>
@interface CCGameRuleView()<UIWebViewDelegate,WKNavigationDelegate,WKUIDelegate>
@property(nonatomic,strong)UIImageView *bgImageView;
@property(nonatomic,strong)UIImageView *titleImageView;
@property(nonatomic,strong)UIButton *deleteButton;
@property(nonatomic,strong)WKWebView *webView;
@property(nonatomic,strong)UIScrollView *scrollView;

@end
@implementation CCGameRuleView

-(void)setGameType:(GameType)gameType{
    _gameType = gameType;
    [self getData];
}

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
    
    [self.bgImageView addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgImageView).offset(55);
        make.left.equalTo(self.bgImageView).offset(10);
        make.bottom.right.equalTo(self.bgImageView).offset(-10);
    }];
    
}

-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
        _bgImageView.userInteractionEnabled = YES;
        _bgImageView.image = [UIImage imageNamed:@"dl_bg"];
    }
    return _bgImageView;
}

-(UIImageView *)titleImageView{
    if (!_titleImageView) {
        _titleImageView = [[UIImageView alloc]init];
        _titleImageView.image = [UIImage imageNamed:@"guize-top"];
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

-(WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc]init];
        _webView.backgroundColor = [UIColor clearColor];
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
        _webView.scrollView.bounces = YES;
        _webView.scrollView.scrollEnabled = YES;
        _webView.opaque = NO;
    }
    return _webView;
}



-(void)getData{
    [CCView BSMBProgressHUD_bufferAndTextWithView:self andText:nil];
    [CCMineManage MineAcquisitionRuleWithGameType:self.gameType completion:^(id resultDictionary, NSError *error) {
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
                NSString *loadString = [[resultDictionary objectForKey:@"data"] objectForKey:@"rules"];
                if (![loadString isKindOfClass:[NSNull class]]) {
                    [self.webView loadHTMLString:loadString baseURL:nil];
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

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [ webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '300%'" completionHandler:nil];
}



-(void)clickDeleteButton{
    [self removeFromSuperview];
}

@end
