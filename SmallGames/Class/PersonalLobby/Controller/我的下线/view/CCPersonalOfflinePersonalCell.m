//
//  CCPersonalOfflinePersonalCell.m
//  SmallGames
//
//  Created by hello on 2018/9/23.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCPersonalOfflinePersonalCell.h"
#import "CCPersonalSectionView.h"

@interface CCPersonalOfflinePersonalCell()

@property(nonatomic,strong)CCPersonalSectionView *personalSectionView;

@end

@implementation CCPersonalOfflinePersonalCell


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

-(CCPersonalSectionView *)personalSectionView{
    if (!_personalSectionView) {
        _personalSectionView = [[CCPersonalSectionView alloc]init];
        _personalSectionView.backgroundColor = MCUIColorFromRGB(0xEEF4F9);
    }
    return _personalSectionView;
}




-(void)initView{
    [self addSubview:self.personalSectionView];
    [self.personalSectionView mas_makeConstraints:^(MASConstraintMaker *make) {
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
