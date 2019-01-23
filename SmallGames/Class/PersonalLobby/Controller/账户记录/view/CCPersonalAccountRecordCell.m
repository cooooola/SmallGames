//
//  CCPersonalAccountRecordCell.m
//  SmallGames
//
//  Created by hello on 2018/9/23.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalAccountRecordCell.h"
#import "CCPersonalAccountRecordSectionHeaderView.h"

@interface CCPersonalAccountRecordCell()
@property(nonatomic,strong)CCPersonalAccountRecordSectionHeaderView *accountRecordSectionHeaderView;
@end

@implementation CCPersonalAccountRecordCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    return self;
}

-(instancetype)init{
    if (self == [super init]) {
        [self initView];
    }
    return self;
}

-(void)setTimeString:(NSString *)timeString{
    _timeString = timeString;
    self.accountRecordSectionHeaderView.timeLabel.text = timeString;
    self.accountRecordSectionHeaderView.timeLabel.textColor = MCUIColorFromRGB(0x6AB5D9);
}

-(void)setNoteString:(NSString *)noteString{
    _noteString = noteString;
    self.accountRecordSectionHeaderView.noteLabel.text = noteString;
}

-(void)setAmountString:(NSString *)amountString{
    _amountString = amountString;
    self.accountRecordSectionHeaderView.betAmountLabel.text = amountString;
}

-(void)setProfitLossString:(NSString *)profitLossString{
    _profitLossString = profitLossString;
    self.accountRecordSectionHeaderView.profitLossLabel.text = profitLossString;
}

-(CCPersonalAccountRecordSectionHeaderView *)accountRecordSectionHeaderView{
    if (!_accountRecordSectionHeaderView) {
        _accountRecordSectionHeaderView = [[CCPersonalAccountRecordSectionHeaderView alloc]init];
        __block typeof(self) weakSelf = self;
        _accountRecordSectionHeaderView.clickAccountHistoryBtn = ^{
            if(weakSelf.clickAccountHistory){
                weakSelf.clickAccountHistory(weakSelf.timeString);
            }
        };
    }
    return _accountRecordSectionHeaderView;
}


-(void)initView{
    [self addSubview:self.accountRecordSectionHeaderView];
    [self.accountRecordSectionHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
