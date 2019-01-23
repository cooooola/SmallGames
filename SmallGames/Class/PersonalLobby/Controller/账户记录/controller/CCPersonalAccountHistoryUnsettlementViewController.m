//
//  CCPersonalAccountHistoryUnsettlementViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/24.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalAccountHistoryUnsettlementViewController.h"
#import "CCPersonalAccountHistoryCell.h"
#import "CCPersonalAccountHistorySectionView.h"
#import "CCPersonalAccountHistoryDayDetailsViewController.h"
#import "CCPersonalAccountHistoryScheduleViewController.h"
#import "CCPersonalAccountHistoryModel.h"
#import "CCHistoryModel.h"

@interface CCPersonalAccountHistoryUnsettlementViewController ()
@property(nonatomic,strong)CCPersonalAccountHistoryModel *personalAccountHistoryModel;
@property(nonatomic,strong)CCPersonalAccountHistorySectionView *accountHistorySectionView;
@property(nonatomic,strong)CCPersonalAccountHistorySectionView *accountHistorySectionFootView;

@end

@implementation CCPersonalAccountHistoryUnsettlementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setBetTime:(NSString *)betTime{
    _betTime = betTime;
    [self initData];
}

-(void)initView{
    [super initView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = self.customLeftItem;
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.tableView registerClass:[CCPersonalAccountHistoryCell class] forCellReuseIdentifier:@"cell"];
    [self.backgroundImageView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.backgroundImageView);
        make.top.equalTo(self.backgroundImageView).offset(55);
    }];
}

-(CCPersonalAccountHistorySectionView *)accountHistorySectionView{
    if(!_accountHistorySectionView){
        _accountHistorySectionView = [[CCPersonalAccountHistorySectionView alloc]init];
        _accountHistorySectionView.backgroundColor = [UIColor whiteColor];
    }
    return _accountHistorySectionView;
}

-(CCPersonalAccountHistorySectionView *)accountHistorySectionFootView{
    if(!_accountHistorySectionFootView){
        _accountHistorySectionFootView = [[CCPersonalAccountHistorySectionView alloc]init];
        _accountHistorySectionFootView.backgroundColor = MCUIColorFromRGB(0xDDEAF5);
        _accountHistorySectionFootView.timeLabel.text = @"本周合计";
        _accountHistorySectionFootView.lotteryTypeLabel.hidden = YES;
        _accountHistorySectionFootView.viewLabel.hidden = YES;
        
    }
    return _accountHistorySectionFootView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CCPersonalAccountHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    cell.backgroundColor = MCUIColorFromRGB(0xEEF4F9);
    __block typeof(self) weakSelf = self;
    
    CCHistoryModel *model = [[CCHistoryModel alloc]init];
    switch (indexPath.row) {
            case 0:{
                model.name = @"北京赛车";
                model.time = weakSelf.betTime;
                model.zhushu = weakSelf.personalAccountHistoryModel.this_day_pk10_l;
                model.jinge = weakSelf.personalAccountHistoryModel.this_day_pk10_c;
                model.yingkui = @"-";
                model.type = @"4";
            }break;
            case 1:{
                model.name = @"幸运飞艇";
                model.time = weakSelf.betTime;
                model.zhushu = weakSelf.personalAccountHistoryModel.this_day_xyft_l;
                model.jinge = weakSelf.personalAccountHistoryModel.this_day_xyft_c;
                model.yingkui = @"-";
                model.type = @"5";
            }break;
            case 2:{
                model.name = @"时时彩";
                model.time = weakSelf.betTime;
                model.zhushu = weakSelf.personalAccountHistoryModel.this_day_ssc_l;
                model.jinge = weakSelf.personalAccountHistoryModel.this_day_ssc_c;
                model.yingkui = @"-";
                model.type = @"6";
            }break;
        default:break;
    }
    
    cell.model = model;
    
    cell.clickPeriodBtn = ^(CCHistoryModel *model) {
//        CCPersonalAccountHistoryScheduleViewController *ahsvc = [[CCPersonalAccountHistoryScheduleViewController alloc]init];
//        ahsvc.model = model;
//        [weakSelf.navigationController pushViewController:ahsvc animated:YES];
        
        CCPersonalAccountHistoryDayDetailsViewController *ddvc = [[CCPersonalAccountHistoryDayDetailsViewController alloc]init];
        ddvc.title = @"期数查看";
        ddvc.model = model;
        [weakSelf.navigationController pushViewController:ddvc animated:YES];
    };
    
    cell.clickDayDetailsBtn = ^(CCHistoryModel *model) {
        CCPersonalAccountHistoryDayDetailsViewController *ddvc = [[CCPersonalAccountHistoryDayDetailsViewController alloc]init];
        ddvc.title = @"当天明细";
        ddvc.model = model;
        [weakSelf.navigationController pushViewController:ddvc animated:YES];
    };
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    [sectionHeaderView addSubview:self.accountHistorySectionView];
    [self.accountHistorySectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sectionHeaderView);
    }];
    return sectionHeaderView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *sectionFootView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    [sectionFootView addSubview:self.accountHistorySectionFootView];
    [self.accountHistorySectionFootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(sectionFootView);
    }];
    
    return sectionFootView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 35;
}

-(void)initData{
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view andText:nil];
    [CCMineManage MineBetRecordDetailsUnsettlementWithGettime:_betTime completion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
            [self showEmptyView];
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            if ([error isEqualToString:@"0"]) {
                NSDictionary *dic = [resultDictionary objectForKey:@"data"];
                self.personalAccountHistoryModel = [CCPersonalAccountHistoryModel modelWithDictionary:dic];
                
                [self.tableView reloadData];
                
                if (!self.personalAccountHistoryModel) {
                    [self showEmptyView];
                }
            }else{
                NSString *msg = [resultDictionary objectForKey:@"msg"];
                [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:msg];
                [self showEmptyView];
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

-(void)setPersonalAccountHistoryModel:(CCPersonalAccountHistoryModel *)personalAccountHistoryModel{
    _personalAccountHistoryModel = personalAccountHistoryModel;
    CCHistoryModel *historyModel = [[CCHistoryModel alloc]init];
    
    historyModel.zhushu = personalAccountHistoryModel.this_day_all_c;
    historyModel.jinge = personalAccountHistoryModel.this_day_all_l;
    historyModel.yingkui = @"-";
    
    self.accountHistorySectionFootView.model = historyModel;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

