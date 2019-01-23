//
//  CCPersonalPurseHeaderView.m
//  SmallGames
//
//  Created by hello on 2018/9/21.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalPurseHeaderView.h"

@interface CCPersonalPurseHeaderView()
@property(nonatomic,strong)UILabel *showLabel;
@end

@implementation CCPersonalPurseHeaderView

-(void)initView{
    [super initView];
    self.backgroundColor = MCUIColorMain;
    
    [self addSubview:self.showLabel];
    [self.showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

-(UILabel *)showLabel{
    if (_showLabel == nil) {
        _showLabel = [[UILabel alloc]init];
        _showLabel.font = [UIFont systemFontOfSize:30];
        _showLabel.textColor = [UIColor whiteColor];
        _showLabel.textAlignment = NSTextAlignmentCenter;
        _showLabel.text = @"10000";
    }
    return _showLabel;
}

-(void)setPurseShowString:(NSString *)purseShowString{
    self.showLabel.text = purseShowString;
}

@end
