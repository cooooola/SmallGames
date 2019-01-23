//
//  CCPersonalOfflineViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/21.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalOfflineViewController.h"
#import "CCOfflineHeaderView.h"
#import "CCOfflineSectionHeaderView.h"
#import "CCPersonalOfflineCell.h"
#import "CCPersonalOfflinePersonalViewController.h"
#import "CCOfflineModel.h"
#import "CCOfflineBoonModel.h"

@interface CCPersonalOfflineViewController ()
@property(nonatomic,strong)CCOfflineSectionHeaderView *offlineSectionHeaderView;
@property(nonatomic,strong)CCOfflineHeaderView *offlineHeaderView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)CCOfflineBoonModel *offlineBoonModel;


@end

@implementation CCPersonalOfflineViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initView{
    [super initView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的下线";
    self.navigationItem.leftBarButtonItem = self.customLeftItem;
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    
    [self.view addSubview:self.offlineHeaderView];
    [self.offlineHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.equalTo(@110);
        make.top.equalTo(self.view).offset(10);
    }];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[CCPersonalOfflineCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.equalTo(self.view);
        make.top.equalTo(self.offlineHeaderView.mas_bottom);
    }];
    
    [self initData];
}

-(CCOfflineHeaderView *)offlineHeaderView{
    if (!_offlineHeaderView) {
        _offlineHeaderView = [[CCOfflineHeaderView alloc]init];
        __block typeof(self) weakSelf = self;
        _offlineHeaderView.clickShowLastWeekBtn = ^(BOOL isLastWeek) {
            weakSelf.offlineBoonModel.isLastWeek = isLastWeek;
            weakSelf.offlineHeaderView.offlineBoonModel = weakSelf.offlineBoonModel;
            [weakSelf.tableView reloadData];
        };
        _offlineHeaderView.clickReceiveBtn = ^{
            [weakSelf GettingBenefits];
        };
    }
    return _offlineHeaderView;
}

-(CCOfflineSectionHeaderView *)offlineSectionHeaderView{
    if (!_offlineSectionHeaderView) {
        _offlineSectionHeaderView = [[CCOfflineSectionHeaderView alloc]init];
    }
    return _offlineSectionHeaderView;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.offlineBoonModel.isLastWeek) {
        return self.offlineBoonModel.last_week_data.count;
    }else{
        return self.offlineBoonModel.this_week_data.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CCPersonalOfflineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    if (self.offlineBoonModel.isLastWeek) {
      cell.model = [self.offlineBoonModel.last_week_data objectAtIndex:indexPath.row];
    }else{
      cell.model = [self.offlineBoonModel.this_week_data objectAtIndex:indexPath.row];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    [sectionHeaderView addSubview:self.offlineSectionHeaderView];
    [self.offlineSectionHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sectionHeaderView);
    }];
    return sectionHeaderView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    CCPersonalOfflinePersonalViewController *vc = [[CCPersonalOfflinePersonalViewController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
}

-(void)initData{
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view andText:nil];
    [CCMineManage MineGetOfflineCenterCompletion:^(id resultDictionary, NSError *error) {
        __block typeof(self) weakSelf = self;
        [CCView BSMBProgressHUD_hideWith:self.view];
        if (!error) {
            NSDictionary *dic = [resultDictionary objectForKey:@"data"];
            self.offlineBoonModel = [CCOfflineBoonModel modelWithDictionary:dic];
            self.offlineBoonModel.isLastWeek = NO;
            self.offlineHeaderView.offlineBoonModel = self.offlineBoonModel;
            [self.tableView reloadData];
            if (self.offlineBoonModel.data.count == 0) {
                [self showEmptyView];
            }
        }
    }];
}

-(void)GettingBenefits{
    if ([self.offlineBoonModel.dl_fanshui isEqualToString:@"0"]) {
        [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"当前没有可领取的福利！"];
        return;
    }
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view andText:@"正在获取福利，请稍候！"];
    [CCMineManage MineReceivingBenefitsWithMoney:self.offlineBoonModel.dl_fanshui completion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            NSString *msg = [resultDictionary objectForKey:@"msg"];
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:msg];
            if ([error isEqualToString:@"0"]) {
                [self initData];
            }
        }
    }];
}

-(void)showEmptyView{
    [self.view addSubview:self.emptyView];
    [self.emptyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.tableView);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
