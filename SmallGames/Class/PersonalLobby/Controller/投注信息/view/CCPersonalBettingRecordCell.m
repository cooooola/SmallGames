//
//  CCPersonalBettingRecordCell.m
//  SmallGames
//
//  Created by hello on 2018/9/23.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalBettingRecordCell.h"
#import "CCUnsettledBetSceionView.h"

@interface CCPersonalBettingRecordCell()
@property(nonatomic,strong)CCUnsettledBetSceionView *unsettledBetSceionView;
@end

@implementation CCPersonalBettingRecordCell


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

-(void)setPersonalBettingRecordModel:(CCPersonalBettingRecordModel *)personalBettingRecordModel{
    _personalBettingRecordModel = personalBettingRecordModel;
    self.unsettledBetSceionView.personalBettingRecordModel = personalBettingRecordModel;
}


-(CCUnsettledBetSceionView *)unsettledBetSceionView{
    if(!_unsettledBetSceionView){
        _unsettledBetSceionView = [[CCUnsettledBetSceionView alloc]init];
    }
    return _unsettledBetSceionView;
}


-(void)initView{
    [self addSubview:self.unsettledBetSceionView];
    [self.unsettledBetSceionView mas_makeConstraints:^(MASConstraintMaker *make) {
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
