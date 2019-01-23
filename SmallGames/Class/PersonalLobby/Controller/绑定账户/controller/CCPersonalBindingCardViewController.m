//
//  CCPersonalBindingCardViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/21.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalBindingCardViewController.h"
#import "CCPersonalCell.h"
#import "CCPersonalBindingCardView.h"

@interface CCPersonalBindingCardViewController ()
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UIButton *addCardButton;
@property(nonatomic,strong)CCPersonalBindingCardView *personalBindingCardView;

@end

@implementation CCPersonalBindingCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initView{
    [super initView];
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.viewType == BaseViewTypeAlipay) {
        self.title = @"支付宝";
    }else{
        self.title = @"银行卡";
    }
    self.navigationItem.leftBarButtonItem = self.customLeftItem;
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[CCPersonalCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-100);
    }];
    
    [self.view addSubview:self.addCardButton];
    [self.addCardButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView.mas_bottom);
        make.left.equalTo(self.view).offset(50);
        make.right.equalTo(self.view).offset(-50);
        make.height.equalTo(@50);
    }];
    
    [self getData];
}

- (UIButton *)addCardButton {
    if (_addCardButton == nil) {
        _addCardButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _addCardButton.backgroundColor = MCUIColorFromRGB(0x64A0D7);
        _addCardButton.layer.masksToBounds = YES;
        _addCardButton.layer.cornerRadius = 25;
        _addCardButton.titleLabel.font = [UIFont systemFontOfSize:19];
        [_addCardButton setTitle:@"添加" forState:UIControlStateNormal];
        [_addCardButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_addCardButton addTarget:self action:@selector(clickAddCardButton) forControlEvents:UIControlEventTouchUpInside];
    } return _addCardButton;
}

-(CCPersonalBindingCardView *)personalBindingCardView{
    if (!_personalBindingCardView) {
        _personalBindingCardView = [[CCPersonalBindingCardView alloc]init];
        _personalBindingCardView.viewType = self.viewType;
        __block typeof(self) weakSelf = self;
        _personalBindingCardView.clickConfirmBtn = ^(NSString *baseViewString) {
            [weakSelf addCardWithCardID:baseViewString];
        };
    }
    return _personalBindingCardView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CCPersonalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    cell.rightImageView.hidden = YES;
    cell.cellTitle = [NSString stringWithFormat:@"%@",[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 5)];
    return sectionHeaderView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    CCPasswordViewController *vc = [[CCPasswordViewController alloc]init];
//    vc.viewTaye = @"2";
//    [self.navigationController pushViewController:vc animated:YES];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSString *cardID = [self.dataArray objectAtIndex:indexPath.row];
        [self deleteUserCardWithCardID:cardID];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

-(void)clickAddCardButton{
    if (self.dataArray.count == 3) {
        [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:[NSString stringWithFormat:@"%@数量已达上限！",self.title]];
        return;
    }
    [self.view.window addSubview:self.personalBindingCardView];
    [self.personalBindingCardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view.window);
    }];
}

-(void)addCardWithCardID:(NSString *)cardID{
    [self.personalBindingCardView removeFromSuperview];
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view andText:@"正在添加，请稍候"];
    [CCMineManage MineAddCardInformationWithCardNumber:cardID andBaseViewType:self.viewType andCardStatus:self.dataArray.count completion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            if ([error isEqualToString:@"0"]) {
                [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"已添加成功！"];
                [self getData];
            }else{
                NSString *msg = [resultDictionary objectForKey:@"msg"];
                [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:msg];
            }
        }
    }];
}

-(void)deleteUserCardWithCardID:(NSString *)cardID{
    NSString *message = [NSString stringWithFormat:@"是否删除%@卡号?",cardID];
    UIAlertController *controller=[UIAlertController alertControllerWithTitle:@"重要提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *signoutAlertAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self deleteCardWithCardID:cardID];
    }];
    UIAlertAction *cancelAlertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    
    [controller addAction:cancelAlertAction];
    [controller addAction:signoutAlertAction];
    [self presentViewController:controller animated:YES completion:^{}];
}

-(void)deleteCardWithCardID:(NSString *)cardID{
    [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"权限不够，请联系客服！"];
}

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

#pragma 数据请求
-(void)getData{
    [self.emptyView removeFromSuperview];
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view andText:nil];
    [CCMineManage MineCardInformationCompletion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
            __block typeof(self) weakSelf = self;
            dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5* NSEC_PER_SEC));
            dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                [weakSelf.navigationController popViewControllerAnimated:YES];
            });
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            if ([error isEqualToString:@"0"]) {
                [self.dataArray removeAllObjects];
                NSDictionary *dataDic = [resultDictionary objectForKey:@"data"];
                if (self.viewType == BaseViewTypeAlipay) {
                    NSString *alipay1 = [dataDic objectForKey:@"alipay1"];
                    NSString *alipay2 = [dataDic objectForKey:@"alipay2"];
                    NSString *alipay3 = [dataDic objectForKey:@"alipay3"];
                    if (![alipay1 isKindOfClass:[NSNull class]]) {
                        [self.dataArray addObject:alipay1];
                    }
                    if (![alipay2 isKindOfClass:[NSNull class]]) {
                        [self.dataArray addObject:alipay2];
                    }
                    if (![alipay3 isKindOfClass:[NSNull class]]) {
                        [self.dataArray addObject:alipay3];
                    }
                }else{
                    NSString *bankid1 = [dataDic objectForKey:@"bankid1"];
                    NSString *bankid2 = [dataDic objectForKey:@"bankid2"];
                    NSString *bankid3 = [dataDic objectForKey:@"bankid3"];
                    if (![bankid1 isKindOfClass:[NSNull class]]) {
                        [self.dataArray addObject:bankid1];
                    }
                    if (![bankid2 isKindOfClass:[NSNull class]]) {
                        [self.dataArray addObject:bankid2];
                    }
                    if (![bankid3 isKindOfClass:[NSNull class]]) {
                        [self.dataArray addObject:bankid3];
                    }
                }
                
                [self.tableView reloadData];
                if (self.dataArray.count == 0) {
                    [self.view addSubview:self.emptyView];
                    [self.emptyView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.edges.equalTo(self.tableView);
                    }];
                }
            }else{
                NSString *msg = [resultDictionary objectForKey:@"msg"];
                [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:msg];
                __block typeof(self) weakSelf = self;
                dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5* NSEC_PER_SEC));
                dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                    [weakSelf.navigationController popViewControllerAnimated:YES];
                });
            }
        }
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
