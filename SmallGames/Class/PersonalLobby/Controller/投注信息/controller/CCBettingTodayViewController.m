//
//  CCBettingTodayViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/23.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCBettingTodayViewController.h"
#import "CCPersonalBettingRecordCell.h"
#import "CCUnsettledBetSceionView.h"
#import "CCPersonalBettingRecordModel.h"

@interface CCBettingTodayViewController ()
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)CCUnsettledBetSceionView *unsettledBetSceionView;
@end

@implementation CCBettingTodayViewController

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
    [self.tableView registerClass:[CCPersonalBettingRecordCell class] forCellReuseIdentifier:@"cell"];
    [self.backgroundImageView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.top.equalTo(self.backgroundImageView).offset(65);
    }];
    
    [self initData];
}

-(CCUnsettledBetSceionView *)unsettledBetSceionView{
    if(!_unsettledBetSceionView){
        _unsettledBetSceionView = [[CCUnsettledBetSceionView alloc]init];
        _unsettledBetSceionView.backgroundColor = [UIColor whiteColor];
        _unsettledBetSceionView.sceionTitle = @"结果";
    }
    return _unsettledBetSceionView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CCPersonalBettingRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    if(indexPath.row %2 == 0){
        cell.backgroundColor = MCUIColorFromRGB(0xEEF4F9);
    }else{
        cell.backgroundColor = MCUIColorFromRGB(0xF7FBFF);
    }
    cell.personalBettingRecordModel = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 35;
}

-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    [sectionHeaderView addSubview:self.unsettledBetSceionView];
    [self.unsettledBetSceionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sectionHeaderView);
    }];
    return sectionHeaderView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}

#pragma 获取数据
-(void)initData{
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view andText:nil];
    [CCMineManage MineBettingInformationWithOrderType:@"jinri" completion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
            [self viewEmpty];
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            if ([error isEqualToString:@"0"]) {
                NSDictionary *dic = [resultDictionary objectForKey:@"data"];
                if (![dic isKindOfClass:[NSNull class]]) {
                    NSArray *array = [dic objectForKey:@"data"];
                    for (int i = 0;i <array.count ; i++) {
                        CCPersonalBettingRecordModel *model = [CCPersonalBettingRecordModel modelWithDictionary:[array objectAtIndex:i]];
                        [self.dataArray addObject:model];
                    }
                }
                [self.tableView reloadData];
                if (self.dataArray.count == 0) {
                    [self viewEmpty];
                }
            }else{
                NSString *msg = [resultDictionary objectForKey:@"msg"];
                [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:msg];
                [self viewEmpty];
            }
        }
    }];
}

-(void)viewEmpty{
    [self.view addSubview:self.emptyView];
    [self.emptyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.tableView);
    }];
}

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
