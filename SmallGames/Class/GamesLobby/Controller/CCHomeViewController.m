//
//  CCHomeViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/19.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCHomeViewController.h"
#import "CCGameFootView.h"
#import "CCPersonalHomeViewController.h"
#import "CCGameHomeViewController.h"
#import "CCNavigationController.h"
#import "CCCustomerServiceView.h"

@interface CCHomeViewController (){
    UIViewController* currentVC;
    UIView *contentView;
    
    CCPersonalHomeViewController *personalHomeVC;
    CCGameHomeViewController *gameHomeVC;
}
@property(nonatomic,strong)CCGameFootView *gameFootView;
@property(nonatomic,strong)CCCustomerServiceView *customerServiceView;//客服

@end

@implementation CCHomeViewController

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
    
    [self initView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toggleViewControllerToPersonalHomeVC) name:@"GoUserCenter" object:nil];
}

-(void)initView{
    [super initView];
    
    float contentViewH;
    if (IS_IPHONE_X) {
        contentViewH = 110;
    }else{
        contentViewH = 89;
    }
    
    contentView = [[UIView alloc]initWithFrame:CGRectMake(0,0, self.view.width, self.view.height-contentViewH)];
    [self.backgroundImageView addSubview:contentView];

    [self addSubControllers];
    
    [self.backgroundImageView addSubview:self.gameFootView];
    [self.gameFootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.equalTo(@(contentViewH));
    }];
}

-(void)addSubControllers{
    //游戏
    gameHomeVC = [[CCGameHomeViewController alloc] init];
    gameHomeVC.view.backgroundColor = [UIColor clearColor];
    [self addChildViewController:gameHomeVC];
    
    //个人中心
    personalHomeVC = [[CCPersonalHomeViewController alloc] init];
    personalHomeVC.view.backgroundColor = [UIColor clearColor];
    [self addChildViewController:personalHomeVC];
    
    [self fitFrameForChildViewController:gameHomeVC];
    [self.backgroundImageView addSubview:gameHomeVC.view];
    currentVC = gameHomeVC;
}

- (void)fitFrameForChildViewController:(UIViewController *)chileViewController{
    CGRect frame = contentView.frame;
    frame.origin.y = 0;
    chileViewController.view.frame = frame;
}

-(void)toggleViewControllerToGameHomeVC{//游戏
    if (currentVC == gameHomeVC) {
        return ;
    }
    [self fitFrameForChildViewController:gameHomeVC];
    [self transitionFromOldViewController:currentVC toNewViewController:gameHomeVC];
}

-(void)toggleViewControllerToPersonalHomeVC{//个人中心
    if (currentVC == personalHomeVC) {
        return ;
    }
    [self fitFrameForChildViewController:personalHomeVC];
    [self transitionFromOldViewController:currentVC toNewViewController:personalHomeVC];
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

-(CCGameFootView *)gameFootView{
    if (!_gameFootView) {
        _gameFootView = [[CCGameFootView alloc]init];
        __weak typeof(self) weakself = self;
        _gameFootView.clickPersonalHomeBtn = ^{
            [weakself toggleViewControllerToPersonalHomeVC];
        };
        _gameFootView.clickGameHomeBtn = ^{
            [weakself toggleViewControllerToGameHomeVC];
        };
        _gameFootView.clickCustomerServiceBtn = ^{
            [weakself showCustomerServiceView];
        };
    }
    
    return _gameFootView;
}

-(void)showCustomerServiceView{
    [self.view.window addSubview:self.customerServiceView];
    self.customerServiceView.viewType = ShowViewCustomerService;
    [self.customerServiceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view.window);
    }];
}

-(CCCustomerServiceView *)customerServiceView{
    if (!_customerServiceView) {
        _customerServiceView = [[CCCustomerServiceView alloc]init];
        _customerServiceView.viewType = ShowViewCustomerService;
    }
    return _customerServiceView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
