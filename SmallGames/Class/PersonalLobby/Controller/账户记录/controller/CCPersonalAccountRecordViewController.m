//
//  CCPersonalAccountRecordViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/21.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalAccountRecordViewController.h"
#import "CCPersonalAccountRecordCell.h"
#import "CCPersonalAccountRecordSectionHeaderView.h"
#import "CCPersonalAccountRecordSectionFootView.h"
#import "CCPersonalAccountHistoryViewController.h"
#import "CCPersonalAccountRecordModel.h"

@interface CCPersonalAccountRecordViewController ()
@property(nonatomic,strong)CCPersonalAccountRecordSectionHeaderView *accountRecordSectionHeaderView_0;
@property(nonatomic,strong)CCPersonalAccountRecordSectionHeaderView *accountRecordSectionHeaderView_1;
@property(nonatomic,strong)CCPersonalAccountRecordSectionFootView *accountRecordSectionFootView_0;
@property(nonatomic,strong)CCPersonalAccountRecordSectionFootView *accountRecordSectionFootView_1;
@property(nonatomic,strong)CCPersonalAccountRecordModel *personalAccountRecordModel;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation CCPersonalAccountRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initView{
    [super initView];
    self.title = @"账户记录";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = self.customLeftItem;
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[CCPersonalAccountRecordCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.left.bottom.equalTo(self.view);
    }];
    
    [self initData];
}

-(CCPersonalAccountRecordSectionHeaderView *)accountRecordSectionHeaderView_0{
    if (!_accountRecordSectionHeaderView_0) {
        _accountRecordSectionHeaderView_0 = [[CCPersonalAccountRecordSectionHeaderView alloc]init];
        _accountRecordSectionHeaderView_0.backgroundColor = [UIColor whiteColor];
    }
    return _accountRecordSectionHeaderView_0;
}

-(CCPersonalAccountRecordSectionHeaderView *)accountRecordSectionHeaderView_1{
    if (!_accountRecordSectionHeaderView_1) {
        _accountRecordSectionHeaderView_1 = [[CCPersonalAccountRecordSectionHeaderView alloc]init];
        _accountRecordSectionHeaderView_1.backgroundColor = [UIColor whiteColor];
    }
    return _accountRecordSectionHeaderView_1;
}

-(CCPersonalAccountRecordSectionFootView *)accountRecordSectionFootView_0{
    if (!_accountRecordSectionFootView_0) {
        _accountRecordSectionFootView_0 = [[CCPersonalAccountRecordSectionFootView alloc]init];
        _accountRecordSectionFootView_0.backgroundColor = MCUIColorFromRGB(0xDDEAF5);
        _accountRecordSectionFootView_0.viewTitleString = @"本周合计";
    }
    return _accountRecordSectionFootView_0;
}

-(CCPersonalAccountRecordSectionFootView *)accountRecordSectionFootView_1{
    if (!_accountRecordSectionFootView_1) {
        _accountRecordSectionFootView_1 = [[CCPersonalAccountRecordSectionFootView alloc]init];
        _accountRecordSectionFootView_1.backgroundColor = MCUIColorFromRGB(0xF6E1EA);
        _accountRecordSectionFootView_1.viewTitleString = @"上周合计";
    }
    return _accountRecordSectionFootView_1;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CCPersonalAccountRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    if (0 == indexPath.section) {
        cell.backgroundColor = MCUIColorFromRGB(0xEEF4F9);
        switch (indexPath.row) {
            case 0:{
                cell.timeString = self.personalAccountRecordModel.this_week_1day_date;
                cell.noteString = self.personalAccountRecordModel.this_week_1day_all_c;
                cell.amountString = self.personalAccountRecordModel.this_week_1day_all_money;
                cell.profitLossString = self.personalAccountRecordModel.this_week_1day_all_yk;
            }break;
            case 1:{
                cell.timeString = self.personalAccountRecordModel.this_week_2day_date;
                cell.noteString = self.personalAccountRecordModel.this_week_2day_all_c;
                cell.amountString = self.personalAccountRecordModel.this_week_2day_all_money;
                cell.profitLossString = self.personalAccountRecordModel.this_week_2day_all_yk;
            }break;
            case 2:{
                cell.timeString = self.personalAccountRecordModel.this_week_3day_date;
                cell.noteString = self.personalAccountRecordModel.this_week_3day_all_c;
                cell.amountString = self.personalAccountRecordModel.this_week_3day_all_money;
                cell.profitLossString = self.personalAccountRecordModel.this_week_3day_all_yk;
            }break;
            case 3:{
                cell.timeString = self.personalAccountRecordModel.this_week_4day_date;
                cell.noteString = self.personalAccountRecordModel.this_week_4day_all_c;
                cell.amountString = self.personalAccountRecordModel.this_week_4day_all_money;
                cell.profitLossString = self.personalAccountRecordModel.this_week_4day_all_yk;
            }break;
            case 4:{
                cell.timeString = self.personalAccountRecordModel.this_week_5day_date;
                cell.noteString = self.personalAccountRecordModel.this_week_5day_all_c;
                cell.amountString = self.personalAccountRecordModel.this_week_5day_all_money;
                cell.profitLossString = self.personalAccountRecordModel.this_week_5day_all_yk;
            }break;
            case 5:{
                cell.timeString = self.personalAccountRecordModel.this_week_6day_date;
                cell.noteString = self.personalAccountRecordModel.this_week_6day_all_c;
                cell.amountString = self.personalAccountRecordModel.this_week_6day_all_money;
                cell.profitLossString = self.personalAccountRecordModel.this_week_6day_all_yk;
            }break;
            case 6:{
                cell.timeString = self.personalAccountRecordModel.this_week_7day_date;
                cell.noteString = self.personalAccountRecordModel.this_week_7day_all_c;
                cell.amountString = self.personalAccountRecordModel.this_week_7day_all_money;
                cell.profitLossString = self.personalAccountRecordModel.this_week_7day_all_yk;
            }break;
            default:
                break;
        }
    }else{
        cell.backgroundColor = MCUIColorFromRGB(0xFCF1F6);
        switch (indexPath.row) {
            case 0:{
                cell.timeString = self.personalAccountRecordModel.last_week_1day_date;
                cell.noteString = self.personalAccountRecordModel.last_week_1day_all_c;
                cell.amountString = self.personalAccountRecordModel.last_week_1day_all_money;
                cell.profitLossString = self.personalAccountRecordModel.last_week_1day_all_yk;
            }break;
            case 1:{
                cell.timeString = self.personalAccountRecordModel.last_week_2day_date;
                cell.noteString = self.personalAccountRecordModel.last_week_2day_all_c;
                cell.amountString = self.personalAccountRecordModel.last_week_2day_all_money;
                cell.profitLossString = self.personalAccountRecordModel.last_week_2day_all_yk;
            }break;
            case 2:{
                cell.timeString = self.personalAccountRecordModel.last_week_3day_date;
                cell.noteString = self.personalAccountRecordModel.last_week_3day_all_c;
                cell.amountString = self.personalAccountRecordModel.last_week_3day_all_money;
                cell.profitLossString = self.personalAccountRecordModel.last_week_3day_all_yk;
            }break;
            case 3:{
                cell.timeString = self.personalAccountRecordModel.last_week_4day_date;
                cell.noteString = self.personalAccountRecordModel.last_week_4day_all_c;
                cell.amountString = self.personalAccountRecordModel.last_week_4day_all_money;
                cell.profitLossString = self.personalAccountRecordModel.last_week_4day_all_yk;
            }break;
            case 4:{
                cell.timeString = self.personalAccountRecordModel.last_week_5day_date;
                cell.noteString = self.personalAccountRecordModel.last_week_5day_all_c;
                cell.amountString = self.personalAccountRecordModel.last_week_5day_all_money;
                cell.profitLossString = self.personalAccountRecordModel.this_week_5day_all_yk;
            }break;
            case 5:{
                cell.timeString = self.personalAccountRecordModel.last_week_6day_date;
                cell.noteString = self.personalAccountRecordModel.last_week_6day_all_c;
                cell.amountString = self.personalAccountRecordModel.last_week_6day_all_money;
                cell.profitLossString = self.personalAccountRecordModel.last_week_6day_all_yk;
            }break;
            case 6:{
                cell.timeString = self.personalAccountRecordModel.last_week_7day_date;
                cell.noteString = self.personalAccountRecordModel.last_week_7day_all_c;
                cell.amountString = self.personalAccountRecordModel.last_week_7day_all_money;
                cell.profitLossString = self.personalAccountRecordModel.last_week_7day_all_yk;
            }break;
            default:
                break;
        }
    }
    
    cell.clickAccountHistory = ^(NSString *timestring) {
        CCPersonalAccountHistoryViewController *pahvc = [[CCPersonalAccountHistoryViewController alloc]init];
        pahvc.betTime = timestring;
        [self.navigationController pushViewController:pahvc animated:YES];
    };
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 45)];
    if (0 == section) {
        [sectionHeaderView addSubview:self.accountRecordSectionHeaderView_0];
        [self.accountRecordSectionHeaderView_0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(sectionHeaderView);
            make.height.equalTo(@35);
        }];
    }else{
        [sectionHeaderView addSubview:self.accountRecordSectionHeaderView_1];
        [self.accountRecordSectionHeaderView_1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(sectionHeaderView);
            make.height.equalTo(@35);
        }];
    }
    return sectionHeaderView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *sectionFootView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    
    
    if (section == 0) {
        [sectionFootView addSubview:self.accountRecordSectionFootView_0];
        [self.accountRecordSectionFootView_0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(sectionFootView);
        }];
    }else{
        [sectionFootView addSubview:self.accountRecordSectionFootView_1];
        [self.accountRecordSectionFootView_1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(sectionFootView);
        }];
    }
    return sectionFootView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 35;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    CCPasswordViewController *vc = [[CCPasswordViewController alloc]init];
    //    vc.viewTaye = @"2";
    //    [self.navigationController pushViewController:vc animated:YES];
}

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(void)initData{
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view andText:nil];
    [CCMineManage MineQueryAccountRecordCompletion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
            [self showEmptyView];
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            if ([error isEqualToString:@"0"]) {
                NSDictionary *dataDic = [resultDictionary objectForKey:@"data"];
                self.personalAccountRecordModel = [CCPersonalAccountRecordModel modelWithDictionary:dataDic];
                [self.tableView reloadData];
            }else{
                NSString *msg = [resultDictionary objectForKey:@"msg"];
                [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:msg];
                [self showEmptyView];
            }
        }
    }];
}

-(void)setPersonalAccountRecordModel:(CCPersonalAccountRecordModel *)personalAccountRecordModel{
    _personalAccountRecordModel = personalAccountRecordModel;
    int this_allNote = [personalAccountRecordModel.this_week_1day_all_c intValue] +
    [personalAccountRecordModel.this_week_2day_all_c intValue] +
    [personalAccountRecordModel.this_week_3day_all_c intValue] +
    [personalAccountRecordModel.this_week_4day_all_c intValue]+
    [personalAccountRecordModel.this_week_5day_all_c intValue]+
    [personalAccountRecordModel.this_week_6day_all_c intValue]+
    [personalAccountRecordModel.this_week_7day_all_c intValue];
    
    float this_allmoney = [personalAccountRecordModel.this_week_1day_all_money floatValue] +
    [personalAccountRecordModel.this_week_2day_all_money floatValue] +
    [personalAccountRecordModel.this_week_3day_all_money floatValue] +
    [personalAccountRecordModel.this_week_4day_all_money floatValue]+
    [personalAccountRecordModel.this_week_5day_all_money floatValue]+
    [personalAccountRecordModel.this_week_6day_all_money floatValue]+
    [personalAccountRecordModel.this_week_7day_all_money floatValue];
    
    float this_allyk = [personalAccountRecordModel.this_week_1day_all_yk floatValue] +
    [personalAccountRecordModel.this_week_2day_all_yk floatValue] +
    [personalAccountRecordModel.this_week_3day_all_yk floatValue] +
    [personalAccountRecordModel.this_week_4day_all_yk floatValue]+
    [personalAccountRecordModel.this_week_5day_all_yk floatValue]+
    [personalAccountRecordModel.this_week_6day_all_yk floatValue]+
    [personalAccountRecordModel.this_week_7day_all_yk floatValue];
    
    self.accountRecordSectionFootView_0.noteString = [NSString stringWithFormat:@"%d",this_allNote];
    self.accountRecordSectionFootView_0.moneyString = [NSString stringWithFormat:@"%.2f",this_allmoney];
    self.accountRecordSectionFootView_0.ykString = [NSString stringWithFormat:@"%.2f",this_allyk];
    
    
    int last_allNote = [personalAccountRecordModel.last_week_1day_all_c intValue] +
    [personalAccountRecordModel.last_week_2day_all_c intValue] +
    [personalAccountRecordModel.last_week_3day_all_c intValue] +
    [personalAccountRecordModel.last_week_4day_all_c intValue]+
    [personalAccountRecordModel.last_week_5day_all_c intValue]+
    [personalAccountRecordModel.last_week_6day_all_c intValue]+
    [personalAccountRecordModel.last_week_7day_all_c intValue];
    
    float last_allmoney = [personalAccountRecordModel.last_week_1day_all_money floatValue] +
    [personalAccountRecordModel.last_week_2day_all_money floatValue] +
    [personalAccountRecordModel.last_week_3day_all_money floatValue] +
    [personalAccountRecordModel.last_week_4day_all_money floatValue]+
    [personalAccountRecordModel.last_week_5day_all_money floatValue]+
    [personalAccountRecordModel.last_week_6day_all_money floatValue]+
    [personalAccountRecordModel.last_week_7day_all_money floatValue];
    
    float last_allyk = [personalAccountRecordModel.last_week_1day_all_yk floatValue] +
    [personalAccountRecordModel.last_week_2day_all_yk floatValue] +
    [personalAccountRecordModel.last_week_3day_all_yk floatValue] +
    [personalAccountRecordModel.last_week_4day_all_yk floatValue]+
    [personalAccountRecordModel.last_week_5day_all_yk floatValue]+
    [personalAccountRecordModel.last_week_6day_all_yk floatValue]+
    [personalAccountRecordModel.last_week_7day_all_yk floatValue];
    
    self.accountRecordSectionFootView_1.noteString = [NSString stringWithFormat:@"%d",last_allNote];
    self.accountRecordSectionFootView_1.moneyString = [NSString stringWithFormat:@"%.2f",last_allmoney];
    self.accountRecordSectionFootView_1.ykString = [NSString stringWithFormat:@"%.2f",last_allyk];
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
