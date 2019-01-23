//
//  CCPersonalAccountHistoryDayDetailsCell.m
//  SmallGames
//
//  Created by hello on 2018/9/25.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalAccountHistoryDayDetailsCell.h"

#import "CCPersonalAccountHistoryDayDetailsHeaderView.h"

@interface CCPersonalAccountHistoryDayDetailsCell()
@property(nonatomic,strong)CCPersonalAccountHistoryDayDetailsHeaderView *accountHistoryDayDetailsHeaderView;
@end

@implementation CCPersonalAccountHistoryDayDetailsCell

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

-(void)setModel:(CCHistoryDayDetailsModel *)model{
    _model = model;
    self.accountHistoryDayDetailsHeaderView.timeLabel.text = model.addtime;
    self.accountHistoryDayDetailsHeaderView.periodLabel.text = model.qihao;
    self.accountHistoryDayDetailsHeaderView.playLabel.text = model.wanfa;
    self.accountHistoryDayDetailsHeaderView.amountLabel.text = model.xiazhumoney;
    self.accountHistoryDayDetailsHeaderView.profitLossLabel.text = model.shuying;
    self.accountHistoryDayDetailsHeaderView.statusLabel.text = model.zhuangtai;
}


-(CCPersonalAccountHistoryDayDetailsHeaderView *)accountHistoryDayDetailsHeaderView{
    if(!_accountHistoryDayDetailsHeaderView){
        _accountHistoryDayDetailsHeaderView  = [[CCPersonalAccountHistoryDayDetailsHeaderView alloc]init];
        _accountHistoryDayDetailsHeaderView.backgroundColor = MCUIColorFromRGB(0xEEF4F9);
    }
    return _accountHistoryDayDetailsHeaderView;
}


-(void)initView{
    [self addSubview:self.accountHistoryDayDetailsHeaderView];
    [self.accountHistoryDayDetailsHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
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
