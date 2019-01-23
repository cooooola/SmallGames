//
//  CCPersonalCommonProblemViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/21.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalCommonProblemViewController.h"
#import "CCPersonalCommonProblemCell.h"
#import "CCCommonProblemModel.h"

@interface CCPersonalCommonProblemViewController ()
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation CCPersonalCommonProblemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
}

-(void)initView{
    self.title = @"常见问题";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = self.customLeftItem;
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);

    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.tableView registerClass:[CCPersonalCommonProblemCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CCPersonalCommonProblemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    cell.commonProblemModel = [self.dataArray objectAtIndex:indexPath.row];
    __block typeof(self) weakSelf = self;
    cell.returnButtonOpenStatus = ^(BOOL buttonOpenStatus) {
        CCCommonProblemModel *model = [weakSelf.dataArray objectAtIndex:indexPath.row];
        model.isOpen = buttonOpenStatus;
        [weakSelf.dataArray replaceObjectAtIndex:indexPath.row withObject:model];
        [weakSelf.tableView reloadData];
    };
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CCCommonProblemModel *model = [self.dataArray objectAtIndex:indexPath.row];
    if (model.isOpen) {
        return [model returnCellHight];
    }else{
        return 50;
    }
}

-(void)initData{
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view andText:@"正在获取数据"];
    [CCMineManage MineCommonProblemCompletion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            if ([error isEqualToString:@"0"]) {
                NSDictionary *dataDic = [resultDictionary objectForKey:@"data"];
                if (![dataDic isKindOfClass:[NSNull class]]) {
                    for (int i = 1; i <= dataDic.count; i++) {
                        NSDictionary *dic = [dataDic objectForKey:[NSString stringWithFormat:@"%d",i]];
                        CCCommonProblemModel *model = [CCCommonProblemModel modelWithDictionary:dic];
                        model.isOpen = NO;
                        [self.dataArray addObject:model];
                    }
                }
                [self.tableView reloadData];
            }else{
                NSString *msg = [resultDictionary objectForKey:@"msg"];
                self.isShowEmptyView = YES;
                [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:msg];
            }
        }
    }];
}

-(NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
