//
//  CCPersonalAccountHistoryScheduleHeaderCell.m
//  SmallGames
//
//  Created by hello on 2018/9/25.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalAccountHistoryScheduleHeaderCell.h"
#import "CCPersonalAccountHistoryScheduleHeaderView.h"

@interface CCPersonalAccountHistoryScheduleHeaderCell()
@property(nonatomic,strong)CCPersonalAccountHistoryScheduleHeaderView *accountHistoryScheduleHeaderView;
@end

@implementation CCPersonalAccountHistoryScheduleHeaderCell

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


-(CCPersonalAccountHistoryScheduleHeaderView *)accountHistoryScheduleHeaderView{
    if(!_accountHistoryScheduleHeaderView){
        _accountHistoryScheduleHeaderView = [[CCPersonalAccountHistoryScheduleHeaderView alloc]init];
        _accountHistoryScheduleHeaderView.backgroundColor = MCUIColorFromRGB(0xEEF4F9);
    }
    return _accountHistoryScheduleHeaderView;
}


-(void)initView{
    [self addSubview:self.accountHistoryScheduleHeaderView];
    [self.accountHistoryScheduleHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
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
