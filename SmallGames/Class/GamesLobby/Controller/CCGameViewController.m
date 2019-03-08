//
//  CCGameViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/26.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameViewController.h"
#import "CCGameHeaerView.h"
#import "CCGameUserActionView.h"
#import "CCSwitchGameView.h"
#import "CCGameLongDragonViewController.h"
#import "CCGameDocumentaryViewController.h"
#import "CCGameBeijingRacingAnimationViewController.h"
#import "CCGameChongqingTimeColorAnimationViewController.h"
#import "CCGameLuckyAirshipAnimationViewController.h"

#import "CCGameBeijingRacingTrendViewController.h"
#import "CCGameChongqingTimeColorTrendViewController.h"
#import "CCGameLuckyAirshipTrendViewController.h"
#import "CCGameEntryInformationView.h"
#import "CCGameChatViewController.h"
#import "CCSendMessageModel.h"

@interface CCGameViewController (){
    UIViewController* currentVC;
    UIView *contentView;
    UIView *chatView;
    
    CCGameBeijingRacingAnimationViewController *beijingRacingAnimationVC;
    CCGameChongqingTimeColorAnimationViewController *chongqingTimeColorAnimationVC;
    CCGameLuckyAirshipAnimationViewController *luckyAirshipAnimationVC;
    
    CCGameBeijingRacingTrendViewController *beijingRacingTrendViewController;
    CCGameChongqingTimeColorTrendViewController *chongqingTimeColorTrendViewController;
    CCGameLuckyAirshipTrendViewController *luckyAirshipTrendViewController;
    
    CCGameChatViewController *gameChatViewController;
}
@property(nonatomic,strong)CCGameHeaerView *gameHeaerView;
@property(nonatomic,strong)CCGameUserActionView *gameUserActionView;
@property(nonatomic,strong)CCSwitchGameView *switchGameView;
@property(nonatomic,strong)CCGameEntryInformationView *gameEntryInformationView;
@property(nonatomic,assign)BOOL isAnimationORTrend;
@end

@implementation CCGameViewController

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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshTrend) name:@"newterm" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willEnterForeground) name:@"WillEnterForeground" object:nil];
}

-(void)initView{
    [super initView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = self.customLeftItem;
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    
    _isAnimationORTrend = YES;
    
    [self.view addSubview:self.gameHeaerView];
    [self.gameHeaerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@MCTopHeight);
    }];
    
    contentView = [[UIView alloc]initWithFrame:CGRectMake(0,MCTopHeight, self.view.width,kAdapterWith(240))];
    [self.backgroundImageView addSubview:contentView];
    
    
    chatView = [[UIView alloc]initWithFrame:CGRectMake(0, MCTopHeight+kAdapterWith(240)+40, self.view.width, MCScreenHeight-MCTopHeight-kAdapterWith(240)-84)];
    chatView.backgroundColor = [UIColor redColor];
    [self.backgroundImageView addSubview:chatView];
    
    [self addSubControllers];
    
    
    [self.view addSubview:self.gameUserActionView];
    [self.gameUserActionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self->contentView.mas_bottom);
        make.height.equalTo(@40);
    }];
    
    [self.backgroundImageView addSubview:self.gameEntryInformationView];
    [self.gameEntryInformationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.backgroundImageView);
        make.height.equalTo(@44);
    }];
}

-(void)addSubControllers{
    //北京赛车动画
    beijingRacingAnimationVC = [[CCGameBeijingRacingAnimationViewController alloc] init];
    [self addChildViewController:beijingRacingAnimationVC];
    
    //重庆时时彩动画
    chongqingTimeColorAnimationVC = [[CCGameChongqingTimeColorAnimationViewController alloc] init];
    [self addChildViewController:chongqingTimeColorAnimationVC];
    
    //幸运飞艇动画
    luckyAirshipAnimationVC = [[CCGameLuckyAirshipAnimationViewController alloc]init];
    [self addChildViewController:luckyAirshipAnimationVC];
    
    
    //北京赛车走势
    beijingRacingTrendViewController = [[CCGameBeijingRacingTrendViewController alloc] init];
    [self addChildViewController:beijingRacingTrendViewController];
    
    //重庆时时彩走势
    chongqingTimeColorTrendViewController = [[CCGameChongqingTimeColorTrendViewController alloc] init];
    [self addChildViewController:chongqingTimeColorTrendViewController];
    
    //幸运飞艇走势
    luckyAirshipTrendViewController = [[CCGameLuckyAirshipTrendViewController alloc]init];
    [self addChildViewController:luckyAirshipTrendViewController];
    
    
    
    [self fitFrameForChildViewController:beijingRacingAnimationVC];
    [self.backgroundImageView addSubview:beijingRacingAnimationVC.view];
    currentVC = beijingRacingAnimationVC;
    
    
    
    gameChatViewController = [[CCGameChatViewController alloc]init];
    __block typeof(self) weakSelf = self;
    gameChatViewController.returningNumber = ^(NSString *peopleNumber) {
        weakSelf.gameHeaerView.peopleNumber = peopleNumber;
    };
    [self addChildViewController:gameChatViewController];
    
    [self addFrameForChildViewController:gameChatViewController];
    [self.backgroundImageView addSubview:gameChatViewController.view];
    
    self.gameType = _gameType;
    
}

- (void)fitFrameForChildViewController:(UIViewController *)chileViewController{
    CGRect frame = contentView.frame;
    frame.origin.y = 0;
    chileViewController.view.frame = frame;
}

-(void)addFrameForChildViewController:(UIViewController *)chileViewController{
    CGRect frame = chatView.frame;
//    frame.origin.y = 0;
    chileViewController.view.frame = frame;
}


-(void)toggleViewControllerToBeijingRacingAnimationVC{//北京赛车动画
    if (currentVC == beijingRacingAnimationVC) {
        return ;
    }
    [self fitFrameForChildViewController:beijingRacingAnimationVC];
    [self transitionFromOldViewController:currentVC toNewViewController:beijingRacingAnimationVC];
}

-(void)toggleViewControllerToChongqingTimeColorAnimationVC{//重庆时时彩动画
    if (currentVC == chongqingTimeColorAnimationVC) {
        return ;
    }
    [self fitFrameForChildViewController:chongqingTimeColorAnimationVC];
    [self transitionFromOldViewController:currentVC toNewViewController:chongqingTimeColorAnimationVC];
}

-(void)toggleViewControllerToLuckyAirshipAnimationVC{//幸运飞艇动画
    if (currentVC == luckyAirshipAnimationVC) {
        return ;
    }
    [self fitFrameForChildViewController:luckyAirshipAnimationVC];
    [self transitionFromOldViewController:currentVC toNewViewController:luckyAirshipAnimationVC];
}



-(void)toggleViewControllerToBeijingRacingTrendViewController{//北京赛车走势
    if (currentVC == beijingRacingTrendViewController) {
        return ;
    }
    [self fitFrameForChildViewController:beijingRacingTrendViewController];
    [self transitionFromOldViewController:currentVC toNewViewController:beijingRacingTrendViewController];
}

-(void)toggleViewControllerToChongqingTimeColorTrendViewController{//重庆时时彩走势
    if (currentVC == chongqingTimeColorTrendViewController) {
        return ;
    }
    [self fitFrameForChildViewController:chongqingTimeColorTrendViewController];
    [self transitionFromOldViewController:currentVC toNewViewController:chongqingTimeColorTrendViewController];
}

-(void)toggleViewControllerToLuckyAirshipTrendViewController{//幸运飞艇走势
    if (currentVC == luckyAirshipTrendViewController) {
        return ;
    }
    [self fitFrameForChildViewController:luckyAirshipTrendViewController];
    [self transitionFromOldViewController:currentVC toNewViewController:luckyAirshipTrendViewController];
}




//转换子视图控制器
- (void)transitionFromOldViewController:(UIViewController *)oldViewController toNewViewController:(UIViewController *)newViewController{
    [self transitionFromViewController:oldViewController toViewController:newViewController duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        if (finished) {
            [newViewController didMoveToParentViewController:self];
            self->currentVC = (UIViewController*)newViewController;
        }else{
            self->currentVC = (UIViewController*)oldViewController;
        }
    }];
}

-(CCGameHeaerView *)gameHeaerView{
    if(!_gameHeaerView){
        _gameHeaerView = [[CCGameHeaerView alloc]init];
        _gameHeaerView.backgroundColor = MCUIColorMain;
        _gameHeaerView.gameType = self.gameType;
        __block typeof(self) weakSelf = self;
        _gameHeaerView.clickClickSoundBtn = ^(BOOL soundStatus) {
            NSString *soundStatusString;
            if (soundStatus) {
                soundStatusString = @"1";
            }else{
                soundStatusString = @"0";
            }
            [[NSNotificationCenter defaultCenter] postNotificationName:@"SoundStatus" object:@{@"SoundStatus":soundStatusString}];
        };
        _gameHeaerView.clickCustomLeftBtn = ^{
            [weakSelf pushToServiceController];
        };
    }
    return _gameHeaerView;
}

-(CCGameUserActionView *)gameUserActionView{
    if (!_gameUserActionView) {
        _gameUserActionView = [[CCGameUserActionView alloc]init];
        _gameUserActionView.gameType = self.gameType;
        _gameUserActionView.backgroundColor = MCUIColorFromRGB(0xF2F2F2);
        
        __block typeof(self) weakSelf = self;
        _gameUserActionView.clickGameTypeBtn = ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ExitKeyboard" object:nil];
            [weakSelf switchGame];
        };//游戏切换
        
        _gameUserActionView.clickLongDragonBtn = ^{
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"ExitKeyboard" object:nil];
//            [CCView BSMBProgressHUD_onlyTextWithView:weakSelf.view.window andText:@"功能完善中！"];
            CCGameLongDragonViewController *ldvc = [[CCGameLongDragonViewController alloc]init];
            ldvc.gameType = weakSelf.gameType;
            [weakSelf.navigationController pushViewController:ldvc animated:YES];
        };//长龙
        
        _gameUserActionView.clickRefreshBtn = ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ExitKeyboard" object:nil];
//            [weakSelf->gameChatViewController.chatWebSocketManager openSocket];
            [weakSelf refreshTrend];
            [weakSelf refreshDrawScreen];
        };//刷新
        
        _gameUserActionView.clickDocumentaryBtn = ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ExitKeyboard" object:nil];
            CCGameDocumentaryViewController *gdvc = [[CCGameDocumentaryViewController alloc]init];
            gdvc.gameType = weakSelf.gameType;
            [weakSelf.navigationController pushViewController:gdvc animated:YES];
        };//跟单
        
        _gameUserActionView.clickAnimationORTrend = ^(BOOL animationORTrend) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ExitKeyboard" object:nil];
            weakSelf.isAnimationORTrend = animationORTrend;
        };//动画走势切换
    }
    return _gameUserActionView;
}

-(CCSwitchGameView *)switchGameView{
    if (!_switchGameView) {
        _switchGameView = [[CCSwitchGameView alloc]init];
        __block typeof(self) weakSelf = self;
        _switchGameView.clickSwitchGameBtn = ^(GameType gameType) {
            weakSelf.gameType = gameType;
        };
    }
    return _switchGameView;
}

-(CCGameEntryInformationView *)gameEntryInformationView{
    if (!_gameEntryInformationView) {
        _gameEntryInformationView = [[CCGameEntryInformationView alloc]init];
        _gameEntryInformationView.backgroundColor = [UIColor whiteColor];
        __block typeof(self) weakself = self;
        _gameEntryInformationView.clickSendMessageBtn = ^(NSString *message, BOOL isBetting, NSString *BetGame) {
            CCSendMessageModel *model = [[CCSendMessageModel alloc]init];
            model.message = message;
            model.isBetting = isBetting;
            model.betGame = BetGame;
            weakself->gameChatViewController.sendMessageModel = model;
        };
    }
    return _gameEntryInformationView;
}


-(void)switchGame{
    [self.view.window addSubview:self.switchGameView];
    [self.switchGameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view.window);
    }];
}

-(void)setGameType:(GameType)gameType{
    _gameType = gameType;
    self.gameHeaerView.gameType = gameType;
    self.gameUserActionView.gameType = gameType;
    self.gameEntryInformationView.gameType = gameType;
    
    if (_isAnimationORTrend) {
        if (gameType == GameTypeBeijingRacing) {
            [self toggleViewControllerToBeijingRacingAnimationVC];
        }else if(gameType == GameTypeChongqingTimeColor){
            [self toggleViewControllerToChongqingTimeColorAnimationVC];
        }else if(gameType == GameTypeLuckyAirship){
            [self toggleViewControllerToLuckyAirshipAnimationVC];
        }
    }else{
        if (gameType == GameTypeBeijingRacing) {
            [self toggleViewControllerToBeijingRacingTrendViewController];
        }else if(gameType == GameTypeChongqingTimeColor){
            [self toggleViewControllerToChongqingTimeColorTrendViewController];
        }else if(gameType == GameTypeLuckyAirship){
            [self toggleViewControllerToLuckyAirshipTrendViewController];
        }
    }
    
    gameChatViewController.gameType = gameType;
}

-(void)setIsAnimationORTrend:(BOOL)isAnimationORTrend{
    _isAnimationORTrend = isAnimationORTrend;
    
    self.gameType = _gameType;
}




-(void)pushToServiceController{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma 刷新开奖画面
-(void)refreshDrawScreen{
    if (_gameType == GameTypeBeijingRacing) {
        [beijingRacingAnimationVC refreshInterface];
    }else if(_gameType == GameTypeChongqingTimeColor){
        [chongqingTimeColorAnimationVC refreshInterface];
    }else if(_gameType == GameTypeLuckyAirship){
        [luckyAirshipAnimationVC refreshInterface];
    }
}

#pragma 刷新走势
-(void)refreshTrend{
    if (_gameType == GameTypeBeijingRacing) {
        [beijingRacingTrendViewController initData];
    }else if(_gameType == GameTypeChongqingTimeColor){
        [chongqingTimeColorTrendViewController initData];
    }else if(_gameType == GameTypeLuckyAirship){
        [luckyAirshipTrendViewController initData];
    }
}

-(void)willEnterForeground{
    [self refreshDrawScreen];
    [self refreshTrend];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
