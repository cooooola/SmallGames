//
//  CCGameLuckyAirshipTrendViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/27.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameLuckyAirshipTrendViewController.h"
#import "CCGameBeijingRacingTrendCell.h"
#import "CCGameBeijingRacingTrendHeaderView.h"
#import "CCGameTrendModel.h"

@interface CCGameLuckyAirshipTrendViewController()
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)CCGameBeijingRacingTrendHeaderView *beijingRacingTrendHeaderView;
@end

@implementation CCGameLuckyAirshipTrendViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
}

-(void)initView{
    [super initView];
    self.navigationItem.leftBarButtonItem = self.customLeftItem;
    self.backgroundImageView.frame = CGRectMake(0, MCTopHeight, self.view.width,kAdapterWith(240));
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[CCGameBeijingRacingTrendCell class] forCellReuseIdentifier:@"cell"];
    [self.backgroundImageView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.left.right.equalTo(self.backgroundImageView);
    }];
}

-(CCGameBeijingRacingTrendHeaderView *)beijingRacingTrendHeaderView{
    if (!_beijingRacingTrendHeaderView) {
        _beijingRacingTrendHeaderView = [[CCGameBeijingRacingTrendHeaderView alloc]init];
    }
    return _beijingRacingTrendHeaderView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CCGameBeijingRacingTrendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    if(indexPath.row %2 == 0){
        cell.backgroundColor = [UIColor whiteColor];
    }else{
        cell.backgroundColor = MCUIColorFromRGB(0xF7FBFF);
    }
    cell.gameTrendModel = [self.dataArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 25;
}

-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40.5)];
    [sectionHeaderView addSubview:self.beijingRacingTrendHeaderView];
    [self.beijingRacingTrendHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sectionHeaderView);
    }];
    return sectionHeaderView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40.5;
}

-(void)initData{
    [self.emptyView removeFromSuperview];
    if (self.dataArray.count == 0) {
        [CCView BSMBProgressHUD_bufferAndTextWithView:self.tableView andText:nil];
    }
    
    [CCMineManage MineTrendWithGameType:GameTypeLuckyAirship completion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.tableView];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.tableView andText:@"未获取到走势信息，请刷新！"];
            [self showEmptyView];
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            NSString *msg = [resultDictionary objectForKey:@"msg"];
            if ([error isEqualToString:@"0"]) {
                [self.dataArray removeAllObjects];
                NSDictionary *dic = [resultDictionary objectForKey:@"data"];
                if (![dic isKindOfClass:[NSNull class]]) {
                    NSArray *arr = [dic objectForKey:@"data"];
                    for (int i = 0; i < arr.count; i++) {
                        CCGameTrendModel *model = [CCGameTrendModel modelWithDictionary:[arr objectAtIndex:i]];
                        [self.dataArray addObject:model];
                    }
                }
                [self.tableView reloadData];
                if (self.dataArray.count == 0) {
                    [self showEmptyView];
                }
            }else{
                [CCView BSMBProgressHUD_onlyTextWithView:self.tableView andText:msg];
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
