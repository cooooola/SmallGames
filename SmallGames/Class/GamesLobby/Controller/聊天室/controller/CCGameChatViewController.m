//
//  CCGameChatViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/29.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameChatViewController.h"
#import "IQKeyboardManager.h"
#import "CCGameChatCell.h"
#import "CCGameDocumentaryView.h"
#import "CCChatMessageModel.h"
#import "CCGameFeaturesView.h"
#import "CCGameRuleView.h"

#import "CCPersonalPurseViewController.h"
#import "CCPersonalBettingRecordViewController.h"
#import "CCPersonalAccountRecordViewController.h"
#import "CCCustomerServiceView.h"

@interface CCGameChatViewController ()<SRWebSocketDelegate,getMessageDelegate>
@property(nonatomic,strong)CCGameFeaturesView *gameFeaturesView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)CCGameDocumentaryView *gameDocumentaryView;

@property(nonatomic,strong)CCGameRuleView *gameRuleView;//规则
@property(nonatomic,strong)CCCustomerServiceView *customerServiceView;
@end


@implementation CCGameChatViewController

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}


-(void)dealloc{
     [_chatWebSocketManager closeSocket];
}


-(void)setGameType:(GameType)gameType{
    if (_gameType == gameType) {
        return;
    }
    _gameType = gameType;
    _gameRuleView.gameType = gameType;
    _chatWebSocketManager.gameType = gameType;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _chatWebSocketManager = [webSocketManager shared];
    _chatWebSocketManager.gameType = self.gameType;
    _chatWebSocketManager.delegate = self;
    __block typeof(self) weakSelf = self;
    _chatWebSocketManager.returningNum = ^(NSString *peopleNum) {
        if(weakSelf.returningNumber){
            weakSelf.returningNumber(peopleNum);
        }
    };
}

-(void)initView{
    [super initView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width,MCScreenHeight-MCTopHeight-kAdapterWith(240)-84);
    self.backgroundImageView.image = nil;
    self.backgroundImageView.backgroundColor = MCUIColorFromRGB(0xF2F2F2);

    
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[CCGameChatCell class] forCellReuseIdentifier:@"cell"];
    [self.backgroundImageView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self.backgroundImageView);
        make.left.equalTo(self.backgroundImageView).offset(55);
    }];
    
    [self.backgroundImageView addSubview:self.gameFeaturesView];
    [self.gameFeaturesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self.backgroundImageView);
        make.right.equalTo(self.tableView.mas_left);
    }];
    
}

-(CCGameDocumentaryView *)gameDocumentaryView{
    if (!_gameDocumentaryView) {
        _gameDocumentaryView = [[CCGameDocumentaryView alloc]init];
        __block typeof(self) weakself = self;
        _gameDocumentaryView.clickConfirmBtn = ^(NSString *magnification,NSString *userShowid) {
            [weakself documentaryWithMagnification:magnification andUserShowid:userShowid];
        };
        _gameDocumentaryView.clickRuleBtn = ^{
            [weakself showGameRuleView];
        };
    }
    return _gameDocumentaryView;
}

-(CCGameRuleView *)gameRuleView{
    if (!_gameRuleView) {
        _gameRuleView = [[CCGameRuleView alloc]init];
        _gameRuleView.gameType = self.gameType;
    }
    return _gameRuleView;
}

-(CCGameFeaturesView *)gameFeaturesView{
    if (!_gameFeaturesView) {
        _gameFeaturesView = [[CCGameFeaturesView alloc]init];
        __block typeof(self) weakSelf = self;
        _gameFeaturesView.clickBtn = ^(GameChatType gameChatType) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ExitKeyboard" object:nil];
            switch (gameChatType) {
                case GameChatTypeCustomerService:{
                    CCPersonalPurseViewController *ppvc = [[CCPersonalPurseViewController alloc]init];
                    [weakSelf.navigationController pushViewController:ppvc animated:YES];
                }break;
                case GameChatTypeDetail:{
                    CCPersonalBettingRecordViewController *pbrvc = [[CCPersonalBettingRecordViewController alloc]init];
                    [weakSelf.navigationController pushViewController:pbrvc animated:YES];
                }break;
                case GameChatTypeRunningWater:{
                    CCPersonalAccountRecordViewController *parvc = [[CCPersonalAccountRecordViewController alloc]init];
                    [weakSelf.navigationController pushViewController:parvc animated:YES];
                    
                }break;
                case GameChatTypeRegulation:{
                    [weakSelf showGameRuleView];
                }break;
                case GameChatTypeUpperScore:{
                    [weakSelf showCustomerServiceView];
                    
                }break;
                case GameChatTypeCenter:{
                    [weakSelf goUserCenter];
                    
                }break;
                default:break;
            }
        };
    }
    return _gameFeaturesView;
}

-(void)goUserCenter{
    [self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GoUserCenter" object:nil];
}

-(void)showCustomerServiceView{
    [self.view.window addSubview:self.customerServiceView];
    self.customerServiceView.viewType = ShowViewCustomerService;
    [self.customerServiceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view.window);
    }];
}

-(CCCustomerServiceView *)customerServiceView{
    if (!_customerServiceView) {
        _customerServiceView = [[CCCustomerServiceView alloc]init];
        _customerServiceView.viewType = ShowViewCustomerService;
    }
    return _customerServiceView;
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CCGameChatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.chatMessageModel = [self.dataArray objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CCChatMessageModel *model = [self.dataArray objectAtIndex:indexPath.row];
    float cellH = [model returnCellHight];
    if (cellH < 50) {
        cellH = 50;
    }
    return cellH;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CCChatMessageModel *model = [self.dataArray objectAtIndex:indexPath.row];
    if ([model.type isEqualToString:@"bets"]  &&![model.from_show_id isEqualToString:[AppDelegate sharedApplicationDelegate].userInfoModel.showid]) {
        self.gameDocumentaryView.chatMessageModel = model;
        [self.view.window addSubview:self.gameDocumentaryView];
        [self.gameDocumentaryView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view.window);
        }];
    }

    
}




-(void)getMessageFromSocket:(NSDictionary *)message{
    CCChatMessageModel *model = [CCChatMessageModel modelWithDictionary:message];
    if ([model.type isEqualToString:@"newterm"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"newterm" object:nil];
    }
    if (([model.type isEqualToString:@"welcome"] && self.dataArray.count == 0)||![model.type isEqualToString:@"welcome"]) {
        [self.dataArray addObject:model];
        [self.tableView reloadData];
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    }
}

-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(void)showGameRuleView{
    [self.view.window addSubview:self.gameRuleView];
    [self.gameRuleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view.window);
    }];
}

-(void)setSendMessageModel:(CCSendMessageModel *)sendMessageModel{
    _sendMessageModel = sendMessageModel;
    [self.chatWebSocketManager sendTalkMessageWithSendMessageModel:sendMessageModel];
}

#pragma 跟单
-(void)documentaryWithMagnification:(NSString *)magnification andUserShowid:(NSString *)userShowid{
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view.window andText:@"正在跟单，请稍候..."];
    [CCMineManage MineDocumentaryInterfaceWithGameType:self.gameType andDocumentaryUserShowID:userShowid andMagnification:magnification completion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view.window];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络不好，请稍后再试！"];
        }else{
            NSString *msg = [resultDictionary objectForKey:@"msg"];
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:msg];
        }
    }];
}

#pragma 刷新游戏

-(void)refreshGame{
    NSLog(@"我要刷新");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
