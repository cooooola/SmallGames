//
//  CCGameLongDragonHeaderView.m
//  SmallGames
//
//  Created by hello on 2018/9/27.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameLongDragonHeaderView.h"

@interface CCGameLongDragonHeaderView()
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *rankingLabel;//名次
@property(nonatomic,strong)UILabel *resultLabel;//结果
@property(nonatomic,strong)UILabel *edgeLabel;//连期
@end

@implementation CCGameLongDragonHeaderView

-(void)initView{
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.left.right.bottom.equalTo(self);
    }];
    
    
    [self addSubview:self.rankingLabel];
    [self.rankingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/3));
    }];
    
    [self addSubview:self.resultLabel];
    [self.resultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/3));
        make.left.equalTo(self.rankingLabel.mas_right);
        
    }];
    
    [self addSubview:self.edgeLabel];
    [self.edgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(MCScreenWidth/3));
        make.left.equalTo(self.resultLabel.mas_right);
    }];
}


-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView;
}

-(UILabel *)rankingLabel{
    if (_rankingLabel == nil) {
        _rankingLabel = [[UILabel alloc]init];
        _rankingLabel.font = [UIFont systemFontOfSize:12];
        _rankingLabel.textColor = MCUIColorFromRGB(0x999999);
        _rankingLabel.textAlignment = NSTextAlignmentCenter;
        _rankingLabel.text = @"名次";
    }
    return _rankingLabel;
}

-(UILabel *)resultLabel{
    if (_resultLabel == nil) {
        _resultLabel = [[UILabel alloc]init];
        _resultLabel.font = [UIFont systemFontOfSize:12];
        _resultLabel.textColor = MCUIColorFromRGB(0x999999);
        _resultLabel.textAlignment = NSTextAlignmentCenter;
        _resultLabel.text = @"结果";
    }
    return _resultLabel;
}

-(UILabel *)edgeLabel{
    if (_edgeLabel == nil) {
        _edgeLabel = [[UILabel alloc]init];
        _edgeLabel.font = [UIFont systemFontOfSize:12];
        _edgeLabel.textColor = MCUIColorFromRGB(0x999999);
        _edgeLabel.textAlignment = NSTextAlignmentCenter;
        _edgeLabel.text = @"连期";
    }
    return _edgeLabel;
}
@end

