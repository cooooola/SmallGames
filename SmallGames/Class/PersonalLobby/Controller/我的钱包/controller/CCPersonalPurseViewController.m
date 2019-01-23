//
//  CCPersonalPurseViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/21.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalPurseViewController.h"
#import "CCPersonalPurseHeaderView.h"
#import "CCPersonalPurseCell.h"
#import "CCPersonalPurseScoreViewController.h"
#import "CCPersonalPurseModel.h"

@interface CCPersonalPurseViewController ()
@property(nonatomic,strong)CCPersonalPurseHeaderView *personalPurseHeaderView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation CCPersonalPurseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initView{
    [super initView];
    self.title = @"我的钱包";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = self.customLeftItem;
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    
    [self.view addSubview:self.personalPurseHeaderView];
    [self.personalPurseHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@150);
    }];
    


    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[CCPersonalPurseCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.personalPurseHeaderView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-15);
    }];
    
    self.tableView.tableHeaderView = [self returnTableViewHeaderViewWithFrame:CGRectMake(0, 150, self.view.width, 180)];
    [self initData];
}

-(CCPersonalPurseHeaderView *)personalPurseHeaderView{
    if (!_personalPurseHeaderView) {
        _personalPurseHeaderView = [[CCPersonalPurseHeaderView alloc]init];
        NSString *umoney = [NSString stringWithFormat:@"%@",[AppDelegate sharedApplicationDelegate].userInfoModel.umoney];
        if (umoney.length == 0 || [umoney isEqualToString:@"<null>"]||[umoney isEqual:nil]||[umoney isKindOfClass:[NSNull class]]) {
            _personalPurseHeaderView.purseShowString = @"0";
        }else{
            _personalPurseHeaderView.purseShowString = umoney;
        }
        
    }
    return _personalPurseHeaderView;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CCPersonalPurseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    cell.personalPurseModel = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    sectionHeaderView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((self.view.width-100)/2, 0, 100, 20)];
    titleLabel.text = @"今日上下分记录";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = MCUIColorFromRGB(0x666666);
    titleLabel.font = [UIFont systemFontOfSize:12];
    [sectionHeaderView addSubview:titleLabel];
    
    UIView *linelift = [[UIView alloc]initWithFrame:CGRectMake(15, 9.9, titleLabel.left-20, 1)];
    [sectionHeaderView addSubview:linelift];
    
    UIView *lineright = [[UIView alloc]initWithFrame:CGRectMake(titleLabel.right+5, 9.9, linelift.width, 1)];
    [sectionHeaderView addSubview:lineright];
    
    [CCTool drawLineOfDashByCAShapeLayer:linelift lineLength:3 lineSpacing:3 lineColor:MCUIColorFromRGB(0xBFBFBF)];
    [CCTool drawLineOfDashByCAShapeLayer:lineright lineLength:3 lineSpacing:3 lineColor:MCUIColorFromRGB(0xBFBFBF)];
    
    return sectionHeaderView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}





-(UIView *)returnTableViewHeaderViewWithFrame:(CGRect)frame{
    UIView *headerView = [[UIView alloc]initWithFrame:frame];
    UIButton *upperScoreButton = [self addButtonWithColor:MCUIColorFromRGB(0x64A0D7) andTitile:@"上分"];
    upperScoreButton.frame = CGRectMake(60, 30,frame.size.width-120, 50);
    [upperScoreButton addTarget:self action:@selector(clickUpperScoreButton) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:upperScoreButton];
    
    UIButton *subordinateButton = [self addButtonWithColor:MCUIColorFromRGB(0xbbbbbb) andTitile:@"下分"];
    subordinateButton.frame = CGRectMake(60, 100,frame.size.width-120, 50);
    [subordinateButton addTarget:self action:@selector(clickSubordinateButton) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:subordinateButton];
    
    return headerView;
}

- (UIButton *)addButtonWithColor:(UIColor *)bcolor andTitile:(NSString *)titile {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 25;
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    button.backgroundColor = bcolor;
    [button setTitle:titile forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    return button;
}

//上分
-(void)clickUpperScoreButton{
    CCPersonalPurseScoreViewController *psvc = [[CCPersonalPurseScoreViewController alloc]init];
    psvc.purseScoreType = PurseScoreTypeUpper;
    [self.navigationController pushViewController:psvc animated:YES];
}

//下分
-(void)clickSubordinateButton{
    CCPersonalPurseScoreViewController *psvc = [[CCPersonalPurseScoreViewController alloc]init];
    psvc.purseScoreType = PurseScoreTypeSubordinate;
    [self.navigationController pushViewController:psvc animated:YES];
}


-(void)initData{
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view andText:nil];
    [CCMineManage MineUpperLowerPointsWithPurseScoreType:nil completion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
            [self showEmptyView];
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            if ([error isEqualToString:@"0"]) {
                NSDictionary *dic = [resultDictionary objectForKey:@"data"];
                if (![dic isKindOfClass:[NSNull class]]) {
                    NSArray *array = [dic objectForKey:@"data"];
                    for (int i = 0 ; i < array.count; i++) {
                        CCPersonalPurseModel *model = [CCPersonalPurseModel modelWithDictionary:[array objectAtIndex:i]];
                        [self.dataArray addObject:model];
                    }
                }
                [self.tableView reloadData];
                if (self.dataArray.count == 0) {
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

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(void)showEmptyView{
    [self.view addSubview:self.emptyView];
    [self.emptyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.tableView).offset(180);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
