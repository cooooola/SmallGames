//
//  CCGameDocumentaryCell.m
//  SmallGames
//
//  Created by hello on 2018/9/27.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameDocumentaryCell.h"
#import "CCGameDocumentarySectionView.h"

@interface CCGameDocumentaryCell()
@property(nonatomic,strong)CCGameDocumentarySectionView *cellView;
@end

@implementation CCGameDocumentaryCell

-(void)setGameDocumentaryModel:(CCGameDocumentaryModel *)gameDocumentaryModel{
    _gameDocumentaryModel = gameDocumentaryModel;
    self.cellView.timeLabel.text = gameDocumentaryModel.starttime;
    self.cellView.periodLabel.text = gameDocumentaryModel.b_show_id;
    self.cellView.playLabel.text = gameDocumentaryModel.b_username;
    self.cellView.amountLabel.text = gameDocumentaryModel.bl;
    self.cellView.profitLossLabel.text = gameDocumentaryModel.money;
    self.cellView.statusLabel.text = gameDocumentaryModel.yk;
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
    [self addSubview:self.cellView];
    [self.cellView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

-(CCGameDocumentarySectionView *)cellView{
    if (!_cellView) {
        _cellView = [[CCGameDocumentarySectionView alloc]init];
        _cellView.backgroundColor = MCUIColorFromRGB(0xEEF4F9);
    }
    return _cellView;
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
