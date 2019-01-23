//
//  CCGameBeijingRacingAnimationViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/27.
//  Copyright © 2018年 hello. All rights reserved.
//

static NSString *urlstring = @"https://kj.kai861.com/view/video/PK10/video.html?10001?1682013.cn";
//static NSString *urlstring = @"https://www.1396j.com/pk10/shipin?mode=iframe";

#import "CCGameBeijingRacingAnimationViewController.h"
#import  <AVFoundation/AVFoundation.h>


@interface CCGameBeijingRacingAnimationViewController ()<UIWebViewDelegate>{
    BOOL isLoadingFinished;
}
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation CCGameBeijingRacingAnimationViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self initView];
    
    self.navigationController.navigationBar.hidden = YES;
    NSURL *url = [NSURL URLWithString:urlstring];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.webView stopLoading];
    [self.webView removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(soundStatus:) name:@"SoundStatus" object:nil];
}

-(void)setSoundState:(BOOL)soundState{
    _soundState = soundState;
}

- (void)soundStatus:(NSNotification *)notification{
    NSDictionary * infoDic = [notification object];
    NSString *soundStatusString = [infoDic objectForKey:@"SoundStatus"];
    AVAudioSession *s = [AVAudioSession sharedInstance];
    if ([soundStatusString isEqualToString:@"1"]) {
       if(s !=nil)[s setActive:YES error:nil];
    }else{
        if(s !=nil)[s setActive:NO error:nil];
    }
}

-(void)initView{
    [super initView];
    self.backgroundImageView.frame = CGRectMake(0,MCTopHeight, self.view.width,kAdapterWith(240));
    self.backgroundImageView.image = [UIImage imageNamed:@"beijingsc_bg"];
    [self.backgroundImageView addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.backgroundImageView);
    }];
}


-(UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]init];
        NSURL *url = [NSURL URLWithString:urlstring];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        _webView.backgroundColor = [UIColor clearColor];
        _webView.opaque = NO;
        _webView.delegate = self;
        _webView.userInteractionEnabled = NO;
        isLoadingFinished = NO;
        [_webView setScalesPageToFit:YES];
        [_webView loadRequest:request];
        [_webView setMediaPlaybackRequiresUserAction:NO];
    }
    return _webView;
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    if(isLoadingFinished){
        [self.webView setHidden:NO];
        return;
    }
    NSURL *url = [NSURL URLWithString:urlstring];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    isLoadingFinished = YES;
}

- (NSString *)htmlAdjustWithPageWidth:(CGFloat )pageWidth html:(NSString *)html webView:(UIWebView *)webView{
    NSMutableString *str = [NSMutableString stringWithString:html];
    CGFloat initialScale = webView.frame.size.width/pageWidth;
    NSString *stringForReplace = [NSString stringWithFormat:@"<meta name=\"viewport\" content=\" initial-scale=%f, minimum-scale=0.1, maximum-scale=2.0, user-scalable=yes\"></head>",initialScale];
    NSRange range =  NSMakeRange(0, str.length);
    [str replaceOccurrencesOfString:@"</head>" withString:stringForReplace options:NSLiteralSearch range:range];
    return str;
}

-(void)refreshInterface{
    NSURL *url = [NSURL URLWithString:urlstring];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
