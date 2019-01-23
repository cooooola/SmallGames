//
//  CCPersonalAccountHistoryViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/24.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalAccountHistoryViewController.h"
#import "CCPersonalAccountHistoryHeaderView.h"
#import "CCPersonalAccountHistorySettledViewController.h"
#import "CCPersonalAccountHistoryUnsettlementViewController.h"
@interface CCPersonalAccountHistoryViewController (){
    UIViewController* currentVC;
    UIView *contentView;
    
    CCPersonalAccountHistorySettledViewController *settledVC;
    CCPersonalAccountHistoryUnsettlementViewController *unsettlementVC;
}
@property(nonatomic,strong)CCPersonalAccountHistoryHeaderView *personalAccountHistoryHeaderView;
@end

@implementation CCPersonalAccountHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setBetTime:(NSString *)betTime{
    _betTime = betTime;
    settledVC.betTime = betTime;
    unsettlementVC.betTime = betTime;
}

-(void)initView{
    [super initView];
    self.title = @"账户历史";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = self.customLeftItem;
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    
    [self.view addSubview:self.personalAccountHistoryHeaderView];
    [self.personalAccountHistoryHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.equalTo(@55);
    }];
    
    contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 55, self.view.width, self.view.height-55)];
    [self.backgroundImageView addSubview:contentView];
    [self addSubControllers];
}



-(CCPersonalAccountHistoryHeaderView *)personalAccountHistoryHeaderView{
    if(!_personalAccountHistoryHeaderView){
        _personalAccountHistoryHeaderView = [[CCPersonalAccountHistoryHeaderView alloc]init];
        __block typeof(self) weakSelf = self;
        _personalAccountHistoryHeaderView.clickSettledBtn = ^{
            [weakSelf toggleViewControllerToSettledVC];
        };
        _personalAccountHistoryHeaderView.clickUnsettlementButton = ^{
            [weakSelf toggleViewControllerToUnsettlementVC];
        };
    }
    return _personalAccountHistoryHeaderView;
}


-(void)addSubControllers{
    settledVC = [[CCPersonalAccountHistorySettledViewController alloc] init];
    settledVC.view.backgroundColor = [UIColor redColor];
    settledVC.betTime = _betTime;
    [self addChildViewController:settledVC];
    
    unsettlementVC = [[CCPersonalAccountHistoryUnsettlementViewController alloc] init];
    unsettlementVC.view.backgroundColor = [UIColor clearColor];
    unsettlementVC.betTime = _betTime;
    [self addChildViewController:unsettlementVC];
    
    [self fitFrameForChildViewController:settledVC];
    [self.backgroundImageView addSubview:settledVC.view];
    currentVC = settledVC;
}

- (void)fitFrameForChildViewController:(UIViewController *)chileViewController{
    CGRect frame = contentView.frame;
    frame.origin.y = 0;
    chileViewController.view.frame = frame;
}

-(void)toggleViewControllerToSettledVC{
    if (currentVC == settledVC) {
        return ;
    }
    [self fitFrameForChildViewController:settledVC];
    [self transitionFromOldViewController:currentVC toNewViewController:settledVC];
}

-(void)toggleViewControllerToUnsettlementVC{
    if (currentVC == unsettlementVC) {
        return ;
    }
    [self fitFrameForChildViewController:unsettlementVC];
    [self transitionFromOldViewController:currentVC toNewViewController:unsettlementVC];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
