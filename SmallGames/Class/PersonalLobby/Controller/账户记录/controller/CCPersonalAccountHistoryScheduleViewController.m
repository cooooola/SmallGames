//
//  CCPersonalAccountHistoryScheduleViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/24.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalAccountHistoryScheduleViewController.h"
#import "CCPersonalAccountHistoryScheduleHeaderCell.h"
#import "CCPersonalAccountHistoryScheduleHeaderView.h"

@interface CCPersonalAccountHistoryScheduleViewController ()
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)CCPersonalAccountHistoryScheduleHeaderView *accountHistoryScheduleHeaderView;
@property(nonatomic,strong)CCPersonalAccountHistoryScheduleHeaderView *footView_0;
@property(nonatomic,strong)CCPersonalAccountHistoryScheduleHeaderView *footView_1;

@end

@implementation CCPersonalAccountHistoryScheduleViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initView{
    [super initView];
    self.title = @"期数查看";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = self.customLeftItem;
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    
    self.dataArray = [NSMutableArray arrayWithObjects:@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1", nil];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.tableView registerClass:[CCPersonalAccountHistoryScheduleHeaderCell class] forCellReuseIdentifier:@"cell"];
    [self.backgroundImageView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.backgroundImageView);
        make.top.equalTo(self.backgroundImageView);
    }];
}

-(CCPersonalAccountHistoryScheduleHeaderView *)accountHistoryScheduleHeaderView{
    if(!_accountHistoryScheduleHeaderView){
        _accountHistoryScheduleHeaderView = [[CCPersonalAccountHistoryScheduleHeaderView alloc]init];
        _accountHistoryScheduleHeaderView.backgroundColor = [UIColor whiteColor];
    }
    return _accountHistoryScheduleHeaderView;
}

-(CCPersonalAccountHistoryScheduleHeaderView *)footView_0{
    if(!_footView_0){
        _footView_0 = [[CCPersonalAccountHistoryScheduleHeaderView alloc]init];
        _footView_0.backgroundColor = MCUIColorFromRGB(0xDDEAF5);
        _footView_0.timeLabel.text = @"小计";
        _footView_0.periodLabel.hidden = YES;
    }
    return _footView_0;
}

-(CCPersonalAccountHistoryScheduleHeaderView *)footView_1{
    if(!_footView_1){
        _footView_1 = [[CCPersonalAccountHistoryScheduleHeaderView alloc]init];
        _footView_1.backgroundColor = MCUIColorFromRGB(0xDDEAF5);
        _footView_1.timeLabel.text = @"总计";
        _footView_1.periodLabel.hidden = YES;
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
    CCPersonalAccountHistoryScheduleHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;

    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    [sectionHeaderView addSubview:self.accountHistoryScheduleHeaderView];
    [self.accountHistoryScheduleHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
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




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
