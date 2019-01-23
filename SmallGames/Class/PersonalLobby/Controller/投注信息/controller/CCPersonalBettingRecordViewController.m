//
//  CCPersonalBettingRecordViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/21.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalBettingRecordViewController.h"
#import "CCPersonalBettingRecordHeaderView.h"
#import "CCUnsettledBetViewController.h"
#import "CCBettingTodayViewController.h"

@interface CCPersonalBettingRecordViewController (){
    UIViewController* currentVC;
    UIView *contentView;
    
    CCUnsettledBetViewController *unsettledBetVC;
    CCBettingTodayViewController *bettingTodayVC;
}
@property(nonatomic,strong)CCPersonalBettingRecordHeaderView *bettingRecordHeaderView;

@end

@implementation CCPersonalBettingRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initView{
    [super initView];
    self.title = @"投注信息";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = self.customLeftItem;
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    
    [self.view addSubview:self.bettingRecordHeaderView];
    [self.bettingRecordHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.equalTo(@65);
    }];
    
    contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 65, self.view.width, self.view.height-65)];
    [self.backgroundImageView addSubview:contentView];
    [self addSubControllers];
}

-(CCPersonalBettingRecordHeaderView *)bettingRecordHeaderView{
    if (!_bettingRecordHeaderView) {
        _bettingRecordHeaderView = [[CCPersonalBettingRecordHeaderView alloc]init];
        
        __block typeof(self) weakSelf = self;
        _bettingRecordHeaderView.unsettledBetBtn = ^{
            [weakSelf toggleViewControllerToUnsettledBetVC];
        };
        
        _bettingRecordHeaderView.bettingTodayBtn = ^{
            [weakSelf toggleViewControllerToBettingTodayVC];
        };
    }
    return _bettingRecordHeaderView;
}


-(void)addSubControllers{
    //未结算投注
    unsettledBetVC = [[CCUnsettledBetViewController alloc] init];
    unsettledBetVC.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:unsettledBetVC];
    
    //今日投注
    bettingTodayVC = [[CCBettingTodayViewController alloc] init];
    bettingTodayVC.view.backgroundColor = [UIColor clearColor];
    [self addChildViewController:bettingTodayVC];
    
    [self fitFrameForChildViewController:unsettledBetVC];
    [self.backgroundImageView addSubview:unsettledBetVC.view];
    currentVC = unsettledBetVC;
}

- (void)fitFrameForChildViewController:(UIViewController *)chileViewController{
    CGRect frame = contentView.frame;
    frame.origin.y = 0;
    chileViewController.view.frame = frame;
}

-(void)toggleViewControllerToUnsettledBetVC{
    if (currentVC == unsettledBetVC) {
        return ;
    }
    [self fitFrameForChildViewController:unsettledBetVC];
    [self transitionFromOldViewController:currentVC toNewViewController:unsettledBetVC];
}

-(void)toggleViewControllerToBettingTodayVC{
    if (currentVC == bettingTodayVC) {
        return ;
    }
    [self fitFrameForChildViewController:bettingTodayVC];
    [self transitionFromOldViewController:currentVC toNewViewController:bettingTodayVC];
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
