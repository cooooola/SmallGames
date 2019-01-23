//
//  CCGameLongDragonCell.m
//  SmallGames
//
//  Created by hello on 2018/9/27.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameLongDragonCell.h"

@interface CCGameLongDragonCell()
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *rankingLabel;//名次
@property(nonatomic,strong)UILabel *resultLabel;//结果
@property(nonatomic,strong)UILabel *edgeLabel;//连期
@end

@implementation CCGameLongDragonCell

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

-(void)initView{
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.left.right.bottom.equalTo(self);
    }];
    
    
    [self addSubview:self.rankingLabel];
    [self.rankingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@40);
        make.height.equalTo(@20);
        make.centerY.equalTo(self);
        make.centerX.equalTo(self).offset(-MCScreenWidth/3);
    }];
    
    [self addSubview:self.resultLabel];
    [self.resultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@40);
        make.height.equalTo(@20);
        make.center.equalTo(self);
    }];

    [self addSubview:self.edgeLabel];
    [self.edgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@40);
        make.height.equalTo(@20);
        make.centerY.equalTo(self);
        make.centerX.equalTo(self).offset(MCScreenWidth/3);
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
        _rankingLabel.textColor = [UIColor whiteColor];
        _rankingLabel.textAlignment = NSTextAlignmentCenter;
        _rankingLabel.text = @"1";
        _rankingLabel.backgroundColor = MCUIColorFromRGB(0x0000FD);
    }
    return _rankingLabel;
}

-(UILabel *)resultLabel{
    if (_resultLabel == nil) {
        _resultLabel = [[UILabel alloc]init];
        _resultLabel.font = [UIFont systemFontOfSize:12];
        _resultLabel.textColor = [UIColor whiteColor];
        _resultLabel.textAlignment = NSTextAlignmentCenter;
        _resultLabel.text = @"龙";
        _resultLabel.backgroundColor = [UIColor redColor];
    }
    return _resultLabel;
}

-(UILabel *)edgeLabel{
    if (_edgeLabel == nil) {
        _edgeLabel = [[UILabel alloc]init];
        _edgeLabel.font = [UIFont systemFontOfSize:12];
        _edgeLabel.textColor = [UIColor whiteColor];
        _edgeLabel.textAlignment = NSTextAlignmentCenter;
        _edgeLabel.text = @"7期";
        _edgeLabel.backgroundColor = MCUIColorFromRGB(0x0000FD);
    }
    return _edgeLabel;
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
