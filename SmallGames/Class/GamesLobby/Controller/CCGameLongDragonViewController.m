//
//  CCGameLongDragonViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/26.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameLongDragonViewController.h"
#import "CCGameLongDragonCell.h"
#import "CCGameLongDragonHeaderView.h"
#import "CCLongDragonModel.h"

@interface CCGameLongDragonViewController ()
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)CCGameLongDragonHeaderView *gameLongDragonHeaderView;
@end

@implementation CCGameLongDragonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self getData];
}

-(void)initView{
    [super initView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"长龙";
    self.navigationItem.leftBarButtonItem = self.customLeftItem;
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.tableView registerClass:[CCGameLongDragonCell class] forCellReuseIdentifier:@"cell"];
    [self.backgroundImageView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.backgroundImageView);
    }];
}

-(CCGameLongDragonHeaderView *)gameLongDragonHeaderView{
    if (!_gameLongDragonHeaderView) {
        _gameLongDragonHeaderView = [[CCGameLongDragonHeaderView alloc]init];
        _gameLongDragonHeaderView.backgroundColor = [UIColor whiteColor];
    }
    return _gameLongDragonHeaderView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CCGameLongDragonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.longDragonModel = [self.dataArray objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    if(indexPath.row %2 == 0){
        cell.backgroundColor = MCUIColorFromRGB(0xEEF4F9);
    }else{
        cell.backgroundColor = MCUIColorFromRGB(0xF7FBFF);
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 35;
}

-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    [sectionHeaderView addSubview:self.gameLongDragonHeaderView];
    [self.gameLongDragonHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sectionHeaderView);
    }];
    return sectionHeaderView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}


-(void)getData{
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.tableView andText:nil];
    [CCMineManage MineLongDragonCompletion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.tableView];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.tableView andText:@"未获取到走势信息，请刷新！"];
            [self showEmptyView];
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            NSString *msg = [resultDictionary objectForKey:@"msg"];
            if ([error isEqualToString:@"0"]) {
//                [self.dataArray removeAllObjects];
//                NSDictionary *dic = [resultDictionary objectForKey:@"data"];
                if(self.gameType == GameTypeBeijingRacing){
//                    NSString * string = [dic objectForKey:@"pk10"];
//                    NSMutableString *mString = [NSMutableString stringWithString:string];
//                    [mString deleteCharactersInRange:NSMakeRange(0, 1)];
//                    [mString deleteCharactersInRange:NSMakeRange(mString.length-1, 1)];
//                    dataarray = [mString componentsSeparatedByString:@","];
                    CCLongDragonModel *model = [[CCLongDragonModel alloc]init];
                    model.index = @"冠军 - 虎";
                    model.num = @"5";
                    
                    CCLongDragonModel *model_1 = [[CCLongDragonModel alloc]init];
                    model_1.index = @"冠军 - 小";
                    model_1.num = @"4";
                    
                    CCLongDragonModel *model_2 = [[CCLongDragonModel alloc]init];
                    model_2.index = @"冠亚军和 - 单";
                    model_2.num = @"4";
                    
                    CCLongDragonModel *model_3 = [[CCLongDragonModel alloc]init];
                    model_3.index = @"亚军 - 虎";
                    model_3.num = @"3";
                    
                    CCLongDragonModel *model_4 = [[CCLongDragonModel alloc]init];
                    model_4.index = @"第八名 - 大";
                    model_4.num = @"3";
                    
                    CCLongDragonModel *model_5 = [[CCLongDragonModel alloc]init];
                    model_5.index = @"第九名 - 大";
                    model_5.num = @"3";
                    
                    CCLongDragonModel *model_6 = [[CCLongDragonModel alloc]init];
                    model_6.index = @"冠亚军和 - 小";
                    model_6.num = @"3";
                    
                    CCLongDragonModel *model_7 = [[CCLongDragonModel alloc]init];
                    model_7.index = @"第三名 - 大";
                    model_7.num = @"3";
                    
                    CCLongDragonModel *model_8 = [[CCLongDragonModel alloc]init];
                    model_8.index = @"第五名 - 小";
                    model_8.num = @"2";
                    
                    CCLongDragonModel *model_9 = [[CCLongDragonModel alloc]init];
                    model_9.index = @"第三名 - 大";
                    model_9.num = @"3";
                    
                    self.dataArray = [NSMutableArray arrayWithObjects:model,model_1,model_2,model_3,model_4,model_5,model_6,model_7,model_8,model_9, nil];
                  
                }else if(self.gameType == GameTypeChongqingTimeColor){
//                    NSString * string = [dic objectForKey:@"cqssc"];
//                    NSMutableString *mString = [NSMutableString stringWithString:string];
//                    [mString deleteCharactersInRange:NSMakeRange(0, 1)];
//                    [mString deleteCharactersInRange:NSMakeRange(mString.length-1, 1)];
//                    dataarray = [mString componentsSeparatedByString:@","];
                    CCLongDragonModel *model = [[CCLongDragonModel alloc]init];
                    model.index = @"亚军 - 龙";
                    model.num = @"4";
                    
                    CCLongDragonModel *model_1 = [[CCLongDragonModel alloc]init];
                    model_1.index = @"亚军 - 大";
                    model_1.num = @"4";
                    
                    CCLongDragonModel *model_2 = [[CCLongDragonModel alloc]init];
                    model_2.index = @"冠军 - 双";
                    model_2.num = @"2";
                    
                    CCLongDragonModel *model_3 = [[CCLongDragonModel alloc]init];
                    model_3.index = @"第三名 - 单";
                    model_3.num = @"2";
                    
                    CCLongDragonModel *model_4 = [[CCLongDragonModel alloc]init];
                    model_4.index = @"第四名 - 龙";
                    model_4.num = @"2";
                    
                    CCLongDragonModel *model_5 = [[CCLongDragonModel alloc]init];
                    model_5.index = @"第四名 - 双";
                    model_5.num = @"2";
                    
                    CCLongDragonModel *model_6 = [[CCLongDragonModel alloc]init];
                    model_6.index = @"第四名 - 大";
                    model_6.num = @"2";
                    
                    CCLongDragonModel *model_7 = [[CCLongDragonModel alloc]init];
                    model_7.index = @"第五名 - 虎";
                    model_7.num = @"2";
                    
                    CCLongDragonModel *model_8 = [[CCLongDragonModel alloc]init];
                    model_8.index = @"第五名 - 单";
                    model_8.num = @"2";
                    
                    CCLongDragonModel *model_9 = [[CCLongDragonModel alloc]init];
                    model_9.index = @"第五名 - 小";
                    model_9.num = @"2";
                    
                    CCLongDragonModel *model_10 = [[CCLongDragonModel alloc]init];
                    model_10.index = @"第七名 - 小";
                    model_10.num = @"2";
                    
                    CCLongDragonModel *model_11 = [[CCLongDragonModel alloc]init];
                    model_11.index = @"第八名 - 大";
                    model_11.num = @"2";
                    
                    CCLongDragonModel *model_12 = [[CCLongDragonModel alloc]init];
                    model_12.index = @"第九名 - 小";
                    model_12.num = @"2";
                    
                    self.dataArray = [NSMutableArray arrayWithObjects:model,model_1,model_2,model_3,model_4,model_5,model_6,model_7,model_8,model_9,model_10,model_11,model_12, nil];
                }else if(self.gameType == GameTypeLuckyAirship){
//                    NSString * string = [dic objectForKey:@"xyft"];
//                    NSMutableString *mString = [NSMutableString stringWithString:string];
//                    [mString deleteCharactersInRange:NSMakeRange(0, 1)];
//                    [mString deleteCharactersInRange:NSMakeRange(mString.length-1, 1)];
//                    dataarray = [mString componentsSeparatedByString:@","];
                }
                
//                if (![dataarray isKindOfClass:[NSNull class]]) {
//                    for (int i = 0; i < dataarray.count; i++) {
//                        CCLongDragonModel *model = [CCLongDragonModel modelWithDictionary:[dataarray objectAtIndex:i]];
//                        [self.dataArray addObject:model];
//                    }
//                }
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
