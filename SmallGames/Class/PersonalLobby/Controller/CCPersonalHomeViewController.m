//
//  CCPersonalHomeViewController.m
//  SmallGames
//
//  Created by hello on 2018/9/18.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalHomeViewController.h"
#import "CCPersonalHomeCell.h"
#import "CCPersonalHomeHeaderView.h"
#import "CCTakePhotoAction.h"
#import "CCPersonalPurseViewController.h"//我的钱包
#import "CCPersonalProfitViewController.h"//今日盈亏
#import "CCPersonalStreamViewController.h"//今日流水
#import "CCPersonalOfflineViewController.h"//我的下线
#import "CCPersonalAccountBindingViewController.h"//账户绑定
#import "CCPersonalAccountRecordViewController.h"//账户记录
#import "CCPersonalBettingRecordViewController.h"//投注信息
#import "CCPersonalCommonProblemViewController.h"//常见问题
#import "CCPersonalSecurityPrivacyViewController.h"//安全隐私
#import "CCPersonalAPPDownloadView.h"//app下载

#import "CCAppSettingManager.h"



@interface CCPersonalHomeViewController (){
    NSString *kystring;//盈亏
    NSString *luishuistring;//流水
    NSString *umoneyString;//余额
    NSString *offlineNumber;//下线人数
}
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)NSArray *imageArray;
@property(nonatomic,strong)CCPersonalHomeHeaderView *personalHomeHeaderView;
@property(nonatomic,strong)CCTakePhotoAction *takePhotoAction;
@property(nonatomic,strong)CCPersonalAPPDownloadView *appDownloadView;
@end

@implementation CCPersonalHomeViewController

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSString *selfClass = NSStringFromClass([self class]);
    if ([selfClass isEqualToString:@"CCPersonalHomeViewController"]) {
        [self reqrutMinePersonalCenterData];
    }
    
    NSLog(@"房间号：%@",[AppDelegate sharedApplicationDelegate].userInfoModel.uroomid);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[@[@"我的下线",@"账户绑定",@"账户记录",@"投注信息"],@[@"APP下载",@"常见问题",@"安全隐私",@"退出登录"]];
    self.imageArray = @[@[@"jifen",@"zhanghubangding",@"zhanghujilv",@"touzhuxinxi"],@[@"massige",@"massige",@"massige",@"massige"]];
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    
    [self reqrutMinePersonalCenterData];
}

-(void)initView{
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.personalHomeHeaderView];
    [self.personalHomeHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@170);
    }];
    [self.tableView registerClass:[CCPersonalHomeCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.personalHomeHeaderView.mas_bottom);
    }];
}

-(CCPersonalHomeHeaderView *)personalHomeHeaderView{
    if (!_personalHomeHeaderView) {
        _personalHomeHeaderView = [[CCPersonalHomeHeaderView alloc]init];
        _personalHomeHeaderView.yingkueiString = kystring;
        _personalHomeHeaderView.lushuiStrin = luishuistring;
        __block typeof(self) weakSelf = self;
        _personalHomeHeaderView.clickDetermineBtn = ^(NSString *userName) {
            [weakSelf changeUserName:userName];
        };
        _personalHomeHeaderView.clickUserHeaderImageBtn = ^{
            [weakSelf changeUserHeaderImage];
        };
        
        _personalHomeHeaderView.clickProfitBtn = ^{
            CCPersonalProfitViewController *ppvc = [[CCPersonalProfitViewController alloc]init];
            [weakSelf.navigationController pushViewController:ppvc animated:YES];
        };
        _personalHomeHeaderView.clickStreamBtn = ^{
            CCPersonalStreamViewController *psvc = [[CCPersonalStreamViewController alloc]init];
            [weakSelf.navigationController pushViewController:psvc animated:YES];
        };
        
        _personalHomeHeaderView.clickPurseBtn = ^{
            CCPersonalPurseViewController *ppvc = [[CCPersonalPurseViewController alloc]init];
            [weakSelf.navigationController pushViewController:ppvc animated:YES];
        };
    }
    return _personalHomeHeaderView;
}

-(CCTakePhotoAction *)takePhotoAction{
    if (!_takePhotoAction) {
         _takePhotoAction = [[CCTakePhotoAction alloc]initWithViewController:self parentView:self.view];
    }
    return _takePhotoAction;
}

-(CCPersonalAPPDownloadView *)appDownloadView{
    if (!_appDownloadView) {
        _appDownloadView = [[CCPersonalAPPDownloadView alloc]init];
    }
    return _appDownloadView;
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *sectionArray = [self.dataArray objectAtIndex:section];
    return sectionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CCPersonalHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    cell.cellImageName = [NSString stringWithFormat:@"%@",[[self.imageArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    cell.cellTitle = [NSString stringWithFormat:@"%@",[[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    if (indexPath.section == 0&&indexPath.row == 0) {
        cell.cellSubtitle = [NSString stringWithFormat:@"%@人",offlineNumber];
    }else{
        cell.cellSubtitle = @"";
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 5)];
    return sectionHeaderView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc;
    switch (indexPath.section) {
        case 0:{
            switch (indexPath.row) {
                case 0:vc = [[CCPersonalOfflineViewController alloc]init];break;
                case 1:vc = [[CCPersonalAccountBindingViewController alloc]init];break;
                case 2:vc = [[CCPersonalAccountRecordViewController alloc]init];break;
                case 3:vc = [[CCPersonalBettingRecordViewController alloc]init];break;
                default:break;
            }break;
        }
        case 1:{
            switch (indexPath.row) {
                case 0:{
                    [self.view.window addSubview:self.appDownloadView];
                    [self.appDownloadView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.edges.equalTo(self.view.window);
                    }];return;
                }
                case 1:vc = [[CCPersonalCommonProblemViewController alloc]init];break;
                case 2:vc = [[CCPersonalSecurityPrivacyViewController alloc]init];break;
                case 3:{
                    [self clickSignout];return;
                }
                default:break;
            }break;
        }
        default:break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma 更换头像
-(void)changeUserHeaderImage{
    UIAlertController *controller=[UIAlertController alertControllerWithTitle:@"更换头像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cameraAlertAction = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self clickCameraAlertAction];
    }];
    UIAlertAction *albumAlertAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self clickAlbumAlertAction];
    }];
    
    UIAlertAction *deleteAlertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [controller addAction:cameraAlertAction];
    [controller addAction:albumAlertAction];
    [controller addAction:deleteAlertAction];
    [self presentViewController:controller animated:YES completion:^{}];
}

-(void)clickCameraAlertAction{
    if ([CCTakePhotoAction checkCameraAuthorizationStatus]) {
        [self.takePhotoAction selectImageCompletion:^(UIImage *image){
           self.personalHomeHeaderView.userHeaderImage = image;
        } cancel:^{ }];
        [self.takePhotoAction selectPhtotFromPhtotoCamera];
    }
}


-(void)clickAlbumAlertAction{
    if ([CCTakePhotoAction checkPhotoLibraryAuthorizationStatus]) {
        [self.takePhotoAction selectImageCompletion:^(UIImage *image){
            [self changeUserHeaderImageWithImage:image];
        } cancel:^{ }];
        [self.takePhotoAction selectPhotoFromPhtotLibrary];
    }
}

-(void)clickSignout{
    UIAlertController *controller=[UIAlertController alertControllerWithTitle:@"重要提示" message:@"是否退出当前账号？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *signoutAlertAction = [UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [CCView BSMBProgressHUD_bufferAndTextWithView:self.view andText:@"正在退出登录，请稍候！"];
        [CCMineManage MineLoginOutCompletion:^(id resultDictionary, NSError *error) {
            [CCView BSMBProgressHUD_hideWith:self.view];
            if (error) {
                [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
            }else{
                NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
                NSString *msg = [resultDictionary objectForKey:@"msg"];
                [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:msg];
                if ([error isEqualToString:@"0"]) {
                    [AppDelegate sharedApplicationDelegate].userInfoModel = nil;
                    [CCUserInfoModel UserInfoRemove];
                    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5* NSEC_PER_SEC));
                    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                        [CCAppSettingManager pushHomeController];
                    });
                }
            }
        }];
    }];
    UIAlertAction *cancelAlertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [controller addAction:cancelAlertAction];
    [controller addAction:signoutAlertAction];
    [self presentViewController:controller animated:YES completion:^{}];
}

-(void)reqrutMinePersonalCenterData{
    [CCMineManage MinePersonalCenterCompletion:^(id resultDictionary, NSError *error) {
        __block typeof(self) weakSelf = self;
        if (!error) {
            NSDictionary *dic = [resultDictionary objectForKey:@"data"];
            self->kystring = [dic objectForKey:@"yk"];
            self->luishuistring = [dic objectForKey:@"liu"];
            self->umoneyString = [dic objectForKey:@"umoney"];
            self->offlineNumber = [dic objectForKey:@"xianum"];
            [AppDelegate sharedApplicationDelegate].userInfoModel.umoney = self->umoneyString;
            weakSelf.personalHomeHeaderView.yingkueiString = self->kystring;
            weakSelf.personalHomeHeaderView.lushuiStrin = self->luishuistring;
            weakSelf.personalHomeHeaderView.umoneyString = self->umoneyString;
            [self.tableView reloadData];
        }
    }];
}

#pragma 修改用户名
-(void)changeUserName:(NSString *)userName{
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view andText:@"正在修改，请稍等！"];
    [CCMineManage MineChangeUserNameWithNewUserName:userName completion:^(id resultDictionary, NSError *error) {
        [CCView BSMBProgressHUD_hideWith:self.view];
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            NSString *msg = [resultDictionary objectForKey:@"msg"];
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:msg];
            if (![error isEqualToString:@"0"]) {
                self.personalHomeHeaderView.userNameString = [AppDelegate sharedApplicationDelegate].userInfoModel.username;
            }
        }
    }];
}

#pragma 修改头像
-(void)changeUserHeaderImageWithImage:(UIImage *)headerImage{
    [CCView BSMBProgressHUD_bufferAndTextWithView:self.view andText:@"图片正在上传中，请稍等！"];
    [CCMineManage MineUploadImageWithImage:headerImage completion:^(id resultDictionary, NSError *error) {
        if (error) {
            [CCView BSMBProgressHUD_hideWith:self.view];
            [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
        }else{
            NSString *code = [NSString stringWithFormat:@"%@",[[resultDictionary objectForKey:@"data"] objectForKey:@"code"]];
            if ([code isEqualToString:@"200"]) {
                 NSString *path = [NSString stringWithFormat:@"%@",[[[resultDictionary objectForKey:@"data"] objectForKey:@"data"] objectForKey:@"path"]];
                [CCMineManage MineChangeUserHeaderImageWithImagePath:path completion:^(id resultDictionary, NSError *error) {
                    [CCView BSMBProgressHUD_hideWith:self.view];
                    if (error) {
                        [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"网络错误，请稍后再试！"];
                    }else{
                        [AppDelegate sharedApplicationDelegate].userInfoModel.headimg = [NSString stringWithFormat:@"%@%@",MAINIP,path];
                        
                        NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
                        NSString *msg = [resultDictionary objectForKey:@"msg"];
                        [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:msg];
                        if ([error isEqualToString:@"0"]) {
                            self.personalHomeHeaderView.userHeaderImage = headerImage;
                        }
                    }
                }];
            }else{
                [CCView BSMBProgressHUD_hideWith:self.view];
                [CCView BSMBProgressHUD_onlyTextWithView:self.view andText:@"图片上传失败，请稍后再试！"];
            }
        }
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
