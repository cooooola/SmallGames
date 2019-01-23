//
//  CCPersonalOfflinePersonalViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/23.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalOfflinePersonalViewController.h"
#import "CCPersonalSectionView.h"
#import "CCPersonalFootSectionView.h"
#import "CCPersonalOfflinePersonalCell.h"

@interface CCPersonalOfflinePersonalViewController ()
@property(nonatomic,strong)CCPersonalSectionView *personalSectionView;
@property(nonatomic,strong)CCPersonalFootSectionView *personalFootSectionView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation CCPersonalOfflinePersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initView{
    [super initView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"会员名";
    self.navigationItem.leftBarButtonItem = self.customLeftItem;
    self.dataArray = [NSMutableArray arrayWithObjects:@"登录密码",@"登录密码",@"登录密码",@"登录密码",@"登录密码", nil];
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[CCPersonalOfflinePersonalCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.left.bottom.equalTo(self.view);
    }];
}

-(CCPersonalSectionView *)personalSectionView{
    if (!_personalSectionView) {
        _personalSectionView = [[CCPersonalSectionView alloc]init];
        _personalSectionView.backgroundColor = [UIColor whiteColor];
    }
    return _personalSectionView;
}

-(CCPersonalFootSectionView *)personalFootSectionView{
    if (!_personalFootSectionView) {
        _personalFootSectionView = [[CCPersonalFootSectionView alloc]init];
        _personalFootSectionView.backgroundColor = MCUIColorFromRGB(0xDDEAF5);
    }
    return _personalFootSectionView;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CCPersonalOfflinePersonalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    [sectionHeaderView addSubview:self.personalSectionView];
    [self.personalSectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sectionHeaderView);
    }];
    return sectionHeaderView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *sectionFootView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    [sectionFootView addSubview:self.personalFootSectionView];
    [self.personalFootSectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sectionFootView);
    }];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
