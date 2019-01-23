//
//  SlotMachineView.m
//  KKSlotMachineView
//
//  Created by hello on 2018/3/13.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "SlotMachineView.h"
#import "CCLotteryModel.h"

@interface SlotMachineView()

@property(nonatomic,strong)NSMutableArray <SlotMachineRollView *>*rollViewArr;
@property(nonatomic,strong)UILabel *hundredMillionLabel;
@property(nonatomic,strong)UILabel *tenThousandLabel;
@property(nonatomic,assign)NSInteger countdownNumber;
@property(nonatomic,strong)NSString *LotteryString;

@end

@implementation SlotMachineView

- (instancetype)initWithFrame:(CGRect)frame initialNumbers:(NSString *)initialNumberStr{
    
    if(self = [super initWithFrame:frame]){
        [self setupUIWithinitialNumbers:initialNumberStr andFrame:frame];
        _isWillDisappear = NO;
        self.countdownNumber = 0;
    }
    return self;
}


-(void)setupUIWithinitialNumbers:(NSString *)initialNumberStr andFrame:(CGRect)frame{
    
    CGFloat width = 38;
    CGFloat margain = 0;
    NSMutableArray *initialNumbers = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",nil];
    NSMutableArray *labelArray = [NSMutableArray arrayWithObjects:@"万位",@"千位",@"百位",@"十位",@"个位", nil];
    NSArray *colorArray = [NSMutableArray arrayWithObjects:MCUIColorFromRGB(0xA138D3),MCUIColorFromRGB(0x6ACE29),MCUIColorFromRGB(0x3DBEF4),MCUIColorFromRGB(0xFF6C61),MCUIColorFromRGB(0xECD04E), nil];
    self.rollViewArr = [NSMutableArray array];
    
    margain = (MCScreenWidth  - initialNumbers.count * width - 15*(initialNumbers.count-1))/2;
    for(int i = 0;i < initialNumbers.count;i++){
        _rollView = [[SlotMachineRollView alloc]initWithFrame:CGRectMake(margain + (width + 15) * i, (frame.size.height-56)/2-25, width, 56)];
        _rollView.backgroundColor = [colorArray objectAtIndex:i];
        [self addSubview:_rollView];
        _rollView.number = [initialNumbers[i] integerValue];
        _rollView.isWillDisappear = _isWillDisappear;
        [self.rollViewArr addObject:_rollView];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_rollView.frame.origin.x, _rollView.bottom, _rollView.width, 25)];
        label.text = [labelArray objectAtIndex:i];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
}

-(void)stopRollingAnimation{
    for(int i = 0;i < self.rollViewArr.count;i++){
        SlotMachineRollView *rollView = _rollViewArr[i];
        rollView.isWillDisappear = YES;
    }
}

-(void)reloadDataWithNumbersStr:(NSString *)numberStr{
    
    NSMutableArray *numbers = [NSMutableArray array];
    for(int j = 0;j < numberStr.length;j++){
        NSString *subStr =  [numberStr substringWithRange:NSMakeRange(j, 1)];
        [numbers addObject:subStr];
    }
    
    //移除所有空间 再重新添加
    for(UIView *view in self.subviews){
        [view removeFromSuperview];
    }
    [self setupUIWithinitialNumbers:numberStr andFrame:self.frame];

    for(int i = 0;i < self.rollViewArr.count;i++){
        SlotMachineRollView *rollView = _rollViewArr[i];
        rollView.number = [numbers[i] integerValue];
        [rollView start];
        
        __weak typeof(self) weakSelf = self;
        rollView.stopBlock = ^{
            
            weakSelf.rollViewArr[i].isAlreadyRollToNumber = NO;
            weakSelf.rollViewArr[i].isWillDisappear = NO;
            if(i < self.rollViewArr.count - 1){
                weakSelf.rollViewArr[i+1].isShouldStop = YES;
            }
        };
        if(i == 0){
            //第一个要先设置需要停止 不然会持续滚动
            rollView.isShouldStop = YES;
        }
    }
}

-(UILabel *)hundredMillionLabel{
    if(_hundredMillionLabel == nil){
        _hundredMillionLabel = [UILabel new];
        _hundredMillionLabel.textColor = MCUIColorFromRGB(0xF9503F);
        _hundredMillionLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _hundredMillionLabel;
}

-(UILabel *)tenThousandLabel{
    if(_tenThousandLabel == nil){
        _tenThousandLabel = [UILabel new];
        _tenThousandLabel.textColor = MCUIColorFromRGB(0xF9503F);
        _tenThousandLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _tenThousandLabel;
}

-(void)setCountdownNumber:(NSInteger)countdownNumber{
    if(countdownNumber == 0){
        [self initData];
    }else{
        __block typeof(countdownNumber) weakCountdownNumber = countdownNumber;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakCountdownNumber -- ;
            self.countdownNumber = weakCountdownNumber;
            
            NSLog(@"%ld",(long)weakCountdownNumber);
        });
    }
}

-(void)initData{
    [CCMineManage MineRequestDrawCompletion:^(id resultDictionary, NSError *error) {
        if (error) {
            [CCView BSMBProgressHUD_onlyTextWithView:self andText:@"网络错误，请稍后再试！"];
            self.countdownNumber = 5;
        }else{
            NSString *error = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"error"]];
            if ([error isEqualToString:@"0"]) {
                CCLotteryModel *model = [CCLotteryModel modelWithDictionary:[resultDictionary objectForKey:@"data"]];
                self.countdownNumber = [model.daojishi integerValue];
                self->_LotteryString = [model.code stringByReplacingOccurrencesOfString:@"," withString:@""];
                if (self->_LotteryString.length == 5) {
                    [self reloadDataWithNumbersStr:self->_LotteryString];
                }
            }else{
                NSString *msg = [resultDictionary objectForKey:@"msg"];
                [CCView BSMBProgressHUD_onlyTextWithView:self andText:msg];
                self.countdownNumber = 5;//5秒后重新请求数据
            }
        }
    }];
}

-(void)setIsWillDisappear:(BOOL)isWillDisappear{
    _isWillDisappear = isWillDisappear;
    if (_LotteryString.length == 5) {
        
    }else{
        _LotteryString = @"00000";
    }
    [self reloadDataWithNumbersStr:_LotteryString];
}

@end
