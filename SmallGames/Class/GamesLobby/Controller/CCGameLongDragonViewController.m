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

@interface CCGameLongDragonViewController ()
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)CCGameLongDragonHeaderView *gameLongDragonHeaderView;
@end

@implementation CCGameLongDragonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initView{
    [super initView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"长龙";
    self.navigationItem.leftBarButtonItem = self.customLeftItem;
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    
    self.dataArray = [NSMutableArray arrayWithObjects:@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1", nil];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
