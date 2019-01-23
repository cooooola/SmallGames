//
//  CCPersonalAccountRecordSectionFootView.m
//  SmallGames
//
//  Created by hello on 2018/9/23.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalAccountRecordSectionFootView.h"
#import "CCPersonalAccountRecordSectionHeaderView.h"

@interface CCPersonalAccountRecordSectionFootView()
@property(nonatomic,strong)CCPersonalAccountRecordSectionHeaderView *accountRecordSectionHeaderView;
@end

@implementation CCPersonalAccountRecordSectionFootView

-(void)setNoteString:(NSString *)noteString{
    _noteString = noteString;
    self.accountRecordSectionHeaderView.noteLabel.text = noteString;
}

-(void)setYkString:(NSString *)ykString{
    _ykString = ykString;
    self.accountRecordSectionHeaderView.profitLossLabel.text = ykString;
}

-(void)setMoneyString:(NSString *)moneyString{
    _moneyString = moneyString;
    self.accountRecordSectionHeaderView.betAmountLabel.text = moneyString;
}

-(void)setViewTitleString:(NSString *)viewTitleString{
    _viewTitleString = viewTitleString;
    self.accountRecordSectionHeaderView.viewTitleString = viewTitleString;
}

-(CCPersonalAccountRecordSectionHeaderView *)accountRecordSectionHeaderView{
    if (!_accountRecordSectionHeaderView) {
        _accountRecordSectionHeaderView = [[CCPersonalAccountRecordSectionHeaderView alloc]init];
        _accountRecordSectionHeaderView.backgroundColor = [UIColor clearColor];
        
    }
    return _accountRecordSectionHeaderView;
}


-(void)initView{
    [super initView];
    
    [self addSubview:self.accountRecordSectionHeaderView];
    [self.accountRecordSectionHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
}

@end
