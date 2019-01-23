//
//  CCPersonalProfitViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/21.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalProfitViewController.h"
#import "CCPersonalScoreRecordingCell.h"
#import "CCPersonalPurseModel.h"


@interface CCPersonalProfitViewController ()
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)UILabel *messageLabel;
@property(nonatomic,strong)UIButton *messageButton;
@property(nonatomic,strong)NSString *scoreRecordingNumber;
@property(nonatomic,strong)NSString *timeString;


@end

@implementation CCPersonalProfitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initView{
    [super initView];
    self.title = @"今日盈亏";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = self.customLeftItem;
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);

    [self.view addSubview:self.headerView];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@40);
    }];
    
    [self.headerView addSubview:self.messageLabel];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerView).offset(15);
        make.top.bottom.equalTo(self.headerView);
    }];
    
    [self.headerView addSubview:self.messageButton];
    [self.messageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self.headerView);
        make.width.equalTo(@40);
    }];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[CCPersonalScoreRecordingCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom);
        make.bottom.right.left.equalTo(self.view);
    }];
    
    self.scoreRecordingNumber = [AppDelegate sharedApplicationDelegate].userInfoModel.yk;
    
    self.timeString = @"1";
}

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]init];
        _headerView.backgroundColor = self.backgroundImageView.backgroundColor;
    }
    return _headerView;
}

-(UILabel *)messageLabel{
    if (_messageLabel == nil) {
        _messageLabel = [[UILabel alloc]init];
        _messageLabel.font = [UIFont systemFontOfSize:14];
        _messageLabel.textColor = MCUIColorFromRGB(0x999999);
        _messageLabel.text = [NSString stringWithFormat:@"%@数:",self.title];
    }
    return _messageLabel;
}

-(UIButton *)messageButton{
    if (!_messageButton) {
        _messageButton = [[UIButton alloc]init];
        [_messageButton setImage:[UIImage imageNamed:@"CCPersonalProfitViewController_timeicon"] forState:UIControlStateNormal];
        [_messageButton addTarget:self action:@selector(clickMessageButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _messageButton;
}

-(void)setScoreRecordingNumber:(NSString *)scoreRecordingNumber{
    _scoreRecordingNumber = scoreRecordingNumber;
    self.messageLabel.text = [NSString stringWithFormat:@"今日盈亏：%@分",scoreRecordingNumber];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CCPersonalScoreRecordingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    cell.personalPurseModel = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

-(void)clickMessageButton{
    UIAlertController *controller=[UIAlertController alertControllerWithTitle:@"时间选择" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    __block typeof(self) weakSelf = self;
    UIAlertAction *alertAction_1 = [UIAlertAction actionWithTitle:@"当天" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        weakSelf.timeString = @"1";
    }];
    UIAlertAction *alertAction_2 = [UIAlertAction actionWithTitle:@"近一个星期" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        weakSelf.timeString = @"7";
    }];
    UIAlertAction *alertAction_3 = [UIAlertAction actionWithTitle:@"近一个月" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        weakSelf.timeString = @"30";
    }];
    UIAlertAction *alertAction_4 = [UIAlertAction actionWithTitle:@"近二个月" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        weakSelf.timeString = @"60";
    }];
    UIAlertAction *alertAction_5 = [UIAlertAction actionWithTitle:@"近三个月" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        weakSelf.timeString = @"90";
    }];
    UIAlertAction *alertAction_6 = [UIAlertAction actionWithTitle:@"近半年" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        weakSelf.timeString = @"180";
    }];
    UIAlertAction *alertAction_7 = [UIAlertAction actionWithTitle:@"近一年" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        weakSelf.timeString = @"365";
    }];
    
    UIAlertAction *deleteAlertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [controller addAction:alertAction_1];
    [controller addAction:alertAction_2];
    [controller addAction:alertAction_3];
    [controller addAction:alertAction_4];
    [controller addAction:alertAction_5];
    [controller addAction:alertAction_6];
    [controller addAction:alertAction_7];
    [controller addAction:deleteAlertAction];
    [self presentViewController:controller animated:YES completion:^{}];
}

-(void)setTimeString:(NSString *)timeString{
    _timeString = timeString;
    [self initData];
}


-(void)initData{
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view andText:nil];
    [self.dataArray removeAllObjects];
    [CCMineManage MineObtainFinancialRecordsWithTime:_timeString completion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
            [self showEmptyView];
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            if ([error isEqualToString:@"0"]) {
                id arr = [resultDictionary objectForKey:@"data"];
                if (![arr isKindOfClass:[NSNull class]]) {
                    NSArray *array  = [[resultDictionary objectForKey:@"data"] objectForKey:@"data"];
                    if (![array isKindOfClass:[NSNull class]]) {
                        for (int i = 0 ; i < array.count; i++) {
                            CCPersonalPurseModel *model = [CCPersonalPurseModel modelWithDictionary:[array objectAtIndex:i]];
                            [self.dataArray addObject:model];
                        }
                    }
                }
                [self.tableView reloadData];
                if (self.dataArray.count == 0) {
                    [self showEmptyView];
                }else{
                    [self.emptyView removeFromSuperview];
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
