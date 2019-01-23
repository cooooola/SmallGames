//
//  CCGameDocumentaryViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/27.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameDocumentaryViewController.h"
#import "CCGameDocumentaryHeaderView.h"
#import "CCGameDocumentarySectionView.h"
#import "CCGameDocumentaryCell.h"
#import "CCGameDocumentaryRuleView.h"
#import "CCGameModifyOddsView.h"
#import "CCGameDocumentaryModel.h"

@interface CCGameDocumentaryViewController ()
@property(nonatomic,strong)CCGameDocumentaryHeaderView *gameDocumentaryHeaderView;
@property(nonatomic,strong)CCGameDocumentarySectionView *gameDocumentarySectionView;
@property(nonatomic,strong)CCGameDocumentaryRuleView *gameDocumentaryRuleView;
@property(nonatomic,strong)CCGameModifyOddsView *gameModifyOddsView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation CCGameDocumentaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initView{
    [super initView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"跟单";
    self.navigationItem.leftBarButtonItem = self.customLeftItem;
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    [CCView BSBarButtonItem_text_who:self.navigationItem size:CGSizeMake(60, 44) target:self selected:@selector(clickRule) textColor:[UIColor whiteColor] font:13 andText:@"规则" isLeft:YES];
    
    [self.backgroundImageView addSubview:self.gameDocumentaryHeaderView];
    [self.gameDocumentaryHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.backgroundImageView);
        make.height.equalTo(@40);
    }];

    
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[CCGameDocumentaryCell class] forCellReuseIdentifier:@"cell"];
    [self.backgroundImageView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.backgroundImageView);
        make.top.equalTo(self.gameDocumentaryHeaderView.mas_bottom);
    }];
    
    [self initData];

}

-(CCGameDocumentaryHeaderView *)gameDocumentaryHeaderView{
    if (!_gameDocumentaryHeaderView) {
        _gameDocumentaryHeaderView = [[CCGameDocumentaryHeaderView alloc]init];
        _gameDocumentaryHeaderView.backgroundColor = [UIColor whiteColor];
        __block typeof(self)  weakSelf = self;
        
        _gameDocumentaryHeaderView.clickStatusSwitchBtn = ^(BOOL status) {
            [weakSelf suspendOrder];
        };
        _gameDocumentaryHeaderView.clickModifyOddsBtn = ^{
            [weakSelf modifyMagnification];
        };
    }
    return _gameDocumentaryHeaderView;
}



-(CCGameDocumentarySectionView *)gameDocumentarySectionView{
    if (!_gameDocumentarySectionView) {
        _gameDocumentarySectionView = [[CCGameDocumentarySectionView alloc]init];
        _gameDocumentaryHeaderView.backgroundColor = [UIColor whiteColor];
    }
    return _gameDocumentarySectionView;
}

-(CCGameModifyOddsView *)gameModifyOddsView{
    if (!_gameModifyOddsView) {
        _gameModifyOddsView = [[CCGameModifyOddsView alloc]init];
        __block typeof(self) weakself = self;
        _gameModifyOddsView.clickConfirmButtonBtn = ^(NSString *magnification) {
            [weakself modifyMagnificationWithMagnification:magnification];
        };
    }
    return _gameModifyOddsView;
}

-(CCGameDocumentaryRuleView *)gameDocumentaryRuleView{
    if (!_gameDocumentaryRuleView) {
        _gameDocumentaryRuleView = [[CCGameDocumentaryRuleView alloc]init];
    }
    return _gameDocumentaryRuleView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CCGameDocumentaryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    cell.gameDocumentaryModel = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    sectionHeaderView.backgroundColor = [UIColor whiteColor];
    [sectionHeaderView addSubview:self.gameDocumentarySectionView];
    [self.gameDocumentarySectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sectionHeaderView);
    }];
    return sectionHeaderView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}

-(void)clickRule{
    [self.view.window addSubview:self.gameDocumentaryRuleView];
    [self.gameDocumentaryRuleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view.window);
    }];
}

-(void)initData{
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view andText:nil];
    [CCMineManage MineDocumentsListWithGameType:self.gameType completion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
            [self showEmptyView];
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            if ([error isEqualToString:@"0"]) {
                NSArray *array  = [resultDictionary objectForKey:@"data"];
                if (![array isKindOfClass:[NSNull class]]) {
                    for (int i = 0 ; i < array.count; i++) {
                        CCGameDocumentaryModel *model = [CCGameDocumentaryModel modelWithDictionary:[array objectAtIndex:i]];
                        [self.dataArray addObject:model];
                    }
                }
                [self.tableView reloadData];
                if (self.dataArray.count == 0) {
                    [self showEmptyView];
                }else{
                    CCGameDocumentaryModel *model = [self.dataArray objectAtIndex:0];
                    self.gameDocumentaryHeaderView.gameDocumentaryModel = model;
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
        make.edges.equalTo(self.tableView);
    }];
}


#pragma 修改倍率

-(void)modifyMagnification{
    if (self.dataArray.count == 0) {
        [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"当前没有可操修的跟单！"];
    }else{
        CCGameDocumentaryModel *model = [self.dataArray objectAtIndex:0];
        self.gameModifyOddsView.gameDocumentaryModel = model;
        [self.view.window addSubview:self.gameModifyOddsView];
        [self.gameModifyOddsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view.window);
        }];
    }
}

-(void)modifyMagnificationWithMagnification:(NSString *)magnification{
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view.window andText:@"正在修改，请稍候..."];
    CCGameDocumentaryModel *model = [self.dataArray objectAtIndex:0];
    [CCMineManage MineModifyOrderWithGendanId:model.b_show_id andCaozuo:1 andOdds:magnification completion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view.window];
        [self.gameModifyOddsView removeFromSuperview];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            NSString *msg = [resultDictionary objectForKey:@"msg"];
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:msg];
            if ([error isEqualToString:@"0"]) {
                [self initData];
            }
        }
    }];
}

#pragma 暂停跟单
-(void)suspendOrder{
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view.window andText:@"正在暂停跟单，请稍候..."];
    CCGameDocumentaryModel *model = [self.dataArray objectAtIndex:0];
    [CCMineManage MineModifyOrderWithGendanId:model.b_show_id andCaozuo:2 andOdds:nil completion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view.window];
        [self.gameModifyOddsView removeFromSuperview];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            NSString *msg = [resultDictionary objectForKey:@"msg"];
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:msg];
            if ([error isEqualToString:@"0"]) {
                [self initData];
            }
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
