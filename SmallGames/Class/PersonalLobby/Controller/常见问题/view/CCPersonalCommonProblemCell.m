//
//  CCPersonalCommonProblemCell.m
//  SmallGames
//
//  Created by hello on 2018/9/22.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalCommonProblemCell.h"

@interface CCPersonalCommonProblemCell()
@property(nonatomic,strong)UIView *titleView;
@property(nonatomic,strong)UIView *contentview;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UIButton *rightButton;

@end

@implementation CCPersonalCommonProblemCell

-(void)setCommonProblemModel:(CCCommonProblemModel *)commonProblemModel{
    _commonProblemModel = commonProblemModel;
    self.titleLabel.text = commonProblemModel.title;
    self.contentLabel.text = commonProblemModel.content;
    self.rightButton.selected = commonProblemModel.isOpen;
}

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
    
    [self addSubview:self.titleView];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.equalTo(self);
        make.height.equalTo(@49.5);
    }];
    
    [self addSubview:self.contentview];
    [self.contentview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.titleView.mas_bottom);
        make.bottom.equalTo(self.lineView.mas_top);
    }];
    
    [self.contentview addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentview).offset(15);
        make.bottom.right.equalTo(self.contentview).offset(-15);
    }];
    
    [self.titleView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleView).offset(15);
        make.centerY.equalTo(self.titleView);
    }];
    
    [self.titleView addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self.titleView);
        make.width.equalTo(@50);
    }];
}

-(UIView *)titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc]init];
        _titleView.backgroundColor = [UIColor whiteColor];
    }
    return _titleView;
}

-(UIView *)contentview{
    if (!_contentview) {
        _contentview = [[UIView alloc]init];
        _contentview.backgroundColor = MCUIColorFromRGB(0xF9F9F9);
    }
    return _contentview;
}



-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = MCUIColorFromRGB(0xcccccc);
    }
    return _lineView;
}

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textColor = MCUIColorFromRGB(0x333333);
        _titleLabel.text = @"我的下线";
    }
    return _titleLabel;
}

-(UILabel *)contentLabel{
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:12];
        _contentLabel.textColor = MCUIColorFromRGB(0x333333);
        _contentLabel.numberOfLines = 0;
        _contentLabel.text = @"我的下线我的下线我的下线我的下线我的下线我的下线我的下线我的下线我的下线我的下线我的下线我的下线";
    }
    return _contentLabel;
}

-(UIButton *)rightButton{
    if (_rightButton == nil) {
        _rightButton = [[UIButton alloc]init];
        _rightButton.selected = NO;
        [_rightButton setImage:[UIImage imageNamed:@"CCPersonalCommonProblemCell_up"] forState:UIControlStateNormal];
        [_rightButton setImage:[UIImage imageNamed:@"CCPersonalCommonProblemCell_done"] forState:UIControlStateSelected];
        [_rightButton addTarget:self action:@selector(clickRightButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

-(void)clickRightButton:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (self.returnButtonOpenStatus) {
        self.returnButtonOpenStatus(sender.selected);
    }
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
