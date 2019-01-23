//
//  CCGameChongqingTimeColorAnimationViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/27.
//  Copyright © 2018年 hello. All rights reserved.
//

static NSString *urlstring = @"https://kj.kai861.com/view/video/SSC/index.html?10002?1682013.cn";

#import "CCGameChongqingTimeColorAnimationViewController.h"
#import "SlotMachineView.h"
@interface CCGameChongqingTimeColorAnimationViewController ()<UIWebViewDelegate>{
    BOOL isLoadingFinished;
}
@property(nonatomic,strong)UIWebView *webView;
//@property(nonatomic,strong)SlotMachineView *slotMachineView;

@end

@implementation CCGameChongqingTimeColorAnimationViewController

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


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    _slotMachineView.isWillDisappear = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//-(void)initView{
//    [super initView];
//    self.backgroundImageView.frame = CGRectMake(0,MCTopHeight, self.view.width,kAdapterWith(240));
//    self.backgroundImageView.image = [UIImage imageNamed:@"chongqingssc_bg"];
//    self.slotMachineView = [[SlotMachineView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, kAdapterWith(240)) initialNumbers:nil];
//    [self.backgroundImageView addSubview:self.slotMachineView];
//}


-(void)initView{
    [super initView];
    self.backgroundImageView.frame = CGRectMake(0,MCTopHeight, self.view.width,kAdapterWith(240));
    self.backgroundImageView.image = [UIImage imageNamed:@"chongqingssc_bg"];
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
        //        _webView.hidden = YES;
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
    [self.webView reload];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
