//
//  CCPersonalAccountHistoryDayDetailsViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/24.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalAccountHistoryDayDetailsViewController.h"
#import "CCPersonalAccountHistoryDayDetailsCell.h"
#import "CCPersonalAccountHistoryDayDetailsHeaderView.h"
#import "CCHistoryDayDetailsModel.h"

@interface CCPersonalAccountHistoryDayDetailsViewController ()
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)CCPersonalAccountHistoryDayDetailsHeaderView *accountHistoryDayDetailsHeaderView;

@property(nonatomic,strong)CCPersonalAccountHistoryDayDetailsHeaderView *footView_0;
@property(nonatomic,strong)CCPersonalAccountHistoryDayDetailsHeaderView *footView_1;

@end

@implementation CCPersonalAccountHistoryDayDetailsViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initView{
    [super initView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = self.customLeftItem;
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[CCPersonalAccountHistoryDayDetailsCell class] forCellReuseIdentifier:@"cell"];
    [self.backgroundImageView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.top.equalTo(self.backgroundImageView);
    }];
}

-(CCPersonalAccountHistoryDayDetailsHeaderView *)accountHistoryDayDetailsHeaderView{
    if(!_accountHistoryDayDetailsHeaderView){
        _accountHistoryDayDetailsHeaderView = [[CCPersonalAccountHistoryDayDetailsHeaderView alloc]init];
        _accountHistoryDayDetailsHeaderView.backgroundColor = [UIColor whiteColor];
    }
    return _accountHistoryDayDetailsHeaderView;
}

-(CCPersonalAccountHistoryDayDetailsHeaderView *)footView_0{
    if(!_footView_0){
        _footView_0 = [[CCPersonalAccountHistoryDayDetailsHeaderView alloc]init];
        _footView_0.backgroundColor = MCUIColorFromRGB(0xDDEAF5);
        _footView_0.timeLabel.text = @"小计";
        _footView_0.periodLabel.hidden = YES;
        _footView_0.playLabel.hidden = YES;
        _footView_0.statusLabel.hidden = YES;
        _footView_0.lineView_0.hidden = YES;
        _footView_0.lineView_1.hidden = YES;
        _footView_0.lineView_2.hidden = YES;
        _footView_0.lineView_3.hidden = YES;
        _footView_0.lineView_4.hidden = YES;
    }
    return _footView_0;
}

-(CCPersonalAccountHistoryDayDetailsHeaderView *)footView_1{
    if(!_footView_1){
        _footView_1 = [[CCPersonalAccountHistoryDayDetailsHeaderView alloc]init];
        _footView_1.backgroundColor = MCUIColorFromRGB(0xDDEAF5);
        _footView_1.timeLabel.text = @"总计";
        _footView_1.periodLabel.hidden = YES;
        _footView_1.playLabel.hidden = YES;
        _footView_1.statusLabel.hidden = YES;
        _footView_1.lineView_0.hidden = YES;
        _footView_1.lineView_1.hidden = YES;
        _footView_1.lineView_2.hidden = YES;
        _footView_1.lineView_3.hidden = YES;
        _footView_1.lineView_4.hidden = YES;
    }
    return _footView_1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CCPersonalAccountHistoryDayDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    
    cell.model = [_dataArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    [sectionHeaderView addSubview:self.accountHistoryDayDetailsHeaderView];
    [self.accountHistoryDayDetailsHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sectionHeaderView);
    }];
    return sectionHeaderView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *sectionFootView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 70)];
    [sectionFootView addSubview:self.footView_0];
    [self.footView_0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(sectionFootView);
        make.height.equalTo(@35);
    }];
    
    [sectionFootView addSubview:self.footView_1];
    [self.footView_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(sectionFootView);
        make.height.equalTo(@35);
    }];
    
    return sectionFootView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 70;
}


-(void)setModel:(CCHistoryModel *)model{
    _model = model;
    [self initData];
}

-(void)initData{
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view andText:nil];
    [CCMineManage MineBetRecordDetailsWithGettime:_model.time andType:_model.type completion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
            [self showEmptyView];
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            if ([error isEqualToString:@"0"]) {
                NSDictionary *dic = [resultDictionary objectForKey:@"data"];
                if (![dic isKindOfClass:[NSNull class]]) {
                    NSArray *array  = [dic objectForKey:@"list"];
                    if (![array isKindOfClass:[NSNull class]]) {
                        for (int i = 0 ; i < array.count; i++) {
                            CCHistoryDayDetailsModel *model = [CCHistoryDayDetailsModel modelWithDictionary:[array objectAtIndex:i]];
                            [self.dataArray addObject:model];
                        }
                    }
                    
                }
                
                NSString *lsstring = [[resultDictionary objectForKey:@"data"] objectForKey:@"ls"];
                NSString *ykstring = [[resultDictionary objectForKey:@"data"] objectForKey:@"yk"];
                if ([lsstring isKindOfClass:[NSNull class]]) {
                    self.footView_0.amountLabel.text = @"0";
                    self.footView_1.amountLabel.text = @"0";
                }else{
                    self.footView_0.amountLabel.text = [NSString stringWithFormat:@"%@",lsstring];
                    self.footView_1.amountLabel.text = [NSString stringWithFormat:@"%@",lsstring];
                }
                
                if ([ykstring isKindOfClass:[NSNull class]]) {
                    self.footView_0.profitLossLabel.text = @"0";
                    self.footView_1.profitLossLabel.text = @"0";
                }else{
                    self.footView_0.profitLossLabel.text = [NSString stringWithFormat:@"%.2f",[ykstring floatValue]];
                    self.footView_1.profitLossLabel.text = [NSString stringWithFormat:@"%.2f",[ykstring floatValue]];
                }
                
                [self.tableView reloadData];
//                if (self.dataArray.count == 0) {
//                    [self showEmptyView];
//                }
            }else{
                NSString *msg = [resultDictionary objectForKey:@"msg"];
                [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:msg];
                [self showEmptyView];
            }
        }
    }];
}

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
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
