//
//  CCGameChongqingTimeColorTrendCell.m
//  SmallGames
//
//  Created by hello on 2018/9/27.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameChongqingTimeColorTrendCell.h"

@interface CCGameChongqingTimeColorTrendCell()
<UICollectionViewDelegateFlowLayout,
UICollectionViewDelegate,
UICollectionViewDataSource>
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *periodLabel;//期数
@property(nonatomic,strong)UIView *lineView_0;
@property (nonatomic, strong) NSArray * collectionDataArrayM;
@property (nonatomic, strong) UICollectionView * collectionView;

@property(nonatomic,strong)UIView *lineView_1;

@property(nonatomic,strong)UILabel *sumLabel;

@property(nonatomic,strong)UIView *lineView_2;

@property(nonatomic,strong)UILabel *bigLabel;

@property(nonatomic,strong)UIView *lineView_3;

@property(nonatomic,strong)UILabel *singleLabel;

@property(nonatomic,strong)UIView *lineView_4;

@property(nonatomic,strong)UILabel *dragonLabel;


@end

@implementation CCGameChongqingTimeColorTrendCell
#define kReuseCollectionCell @"cell"

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

-(void)setGameChongqingTimeColorTrendModel:(CCGameChongqingTimeColorTrendModel *)gameChongqingTimeColorTrendModel{
    _gameChongqingTimeColorTrendModel = gameChongqingTimeColorTrendModel;
     self.collectionDataArrayM = gameChongqingTimeColorTrendModel.kaijiang;
     [self.collectionView reloadData];
    self.periodLabel.text = gameChongqingTimeColorTrendModel.term;
    self.sumLabel.text = [NSString stringWithFormat:@"%@",[gameChongqingTimeColorTrendModel.hezhi objectForKey:@"he"]];
    self.bigLabel.text = [gameChongqingTimeColorTrendModel.hezhi objectForKey:@"dx"];
    self.singleLabel.text = [gameChongqingTimeColorTrendModel.hezhi objectForKey:@"ds"];
    if ([[gameChongqingTimeColorTrendModel.hezhi objectForKey:@"ds"] isEqualToString:@"单"]) {
        self.singleLabel.textColor = MCUIColorFromRGB(0x1764FE);
    }else{
        self.singleLabel.textColor = MCUIColorFromRGB(0xF2086E);
    }
    if ([[gameChongqingTimeColorTrendModel.hezhi objectForKey:@"dx"] isEqualToString:@"小"]) {
        self.bigLabel.textColor = MCUIColorFromRGB(0x1764FE);
    }else{
        self.bigLabel.textColor = MCUIColorFromRGB(0xF2086E);
    }
    
    self.dragonLabel.text = gameChongqingTimeColorTrendModel.lh;
}


-(void)initView{
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.left.right.bottom.equalTo(self);
    }];
    
    float viewH = (MCScreenWidth - 25*5-10)/5;
    
    [self addSubview:self.periodLabel];
    [self.periodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.equalTo(@(viewH));
    }];
    [self addSubview:self.lineView_0];
    [self.lineView_0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@0.5);
        make.left.equalTo(self.periodLabel.mas_right);
    }];
    
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@125);
        make.left.equalTo(self.lineView_0.mas_right).offset(5);
    }];
    
    [self addSubview:self.lineView_1];
    [self.lineView_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@0.5);
        make.left.equalTo(self.collectionView.mas_right).offset(5);
    }];
    
    [self addSubview:self.sumLabel];
    [self.sumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(viewH));
        make.left.equalTo(self.lineView_1.mas_right);
    }];
    
    [self addSubview:self.lineView_2];
    [self.lineView_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@0.5);
        make.left.equalTo(self.sumLabel.mas_right);
    }];
    
    [self addSubview:self.bigLabel];
    [self.bigLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(viewH));
        make.left.equalTo(self.lineView_2.mas_right);
    }];
    
    [self addSubview:self.lineView_3];
    [self.lineView_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@0.5);
        make.left.equalTo(self.bigLabel.mas_right);
    }];
    
    [self addSubview:self.singleLabel];
    [self.singleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(viewH));
        make.left.equalTo(self.lineView_3.mas_right);
    }];
    
    [self addSubview:self.lineView_4];
    [self.lineView_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@0.5);
        make.left.equalTo(self.singleLabel.mas_right);
    }];
    
    [self addSubview:self.dragonLabel];
    [self.dragonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self);
        make.left.equalTo(self.lineView_4.mas_right);
    }];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.collectionDataArrayM.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReuseCollectionCell forIndexPath:indexPath];
    for (UIView * subView in cell.subviews) {
        [subView removeFromSuperview];
    }
    UILabel *label = [[UILabel alloc]init];
    label.layer.cornerRadius = 11;
    label.layer.masksToBounds = YES;
    label.font = [UIFont systemFontOfSize:9];
    label.text = [NSString stringWithFormat:@"%@",[self.collectionDataArrayM objectAtIndex:indexPath.row]];
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.borderWidth = 1;
    UIColor *color = MCUIColorFromRGB(0x578CD1);
    label.layer.borderColor = color.CGColor;
    
    [cell addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(cell);
        make.width.height.equalTo(@22);
    }];
    return cell;
}


-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView;
}

-(UIView *)lineView_0{
    if (!_lineView_0) {
        _lineView_0 = [[UIView alloc]init];
        _lineView_0.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView_0;
}

-(UIView *)lineView_1{
    if (!_lineView_1) {
        _lineView_1 = [[UIView alloc]init];
        _lineView_1.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView_1;
}

-(UIView *)lineView_2{
    if (!_lineView_2) {
        _lineView_2 = [[UIView alloc]init];
        _lineView_2.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView_2;
}

-(UIView *)lineView_3{
    if (!_lineView_3) {
        _lineView_3 = [[UIView alloc]init];
        _lineView_3.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView_3;
}

-(UIView *)lineView_4{
    if (!_lineView_4) {
        _lineView_4 = [[UIView alloc]init];
        _lineView_4.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView_4;
}



-(UILabel *)periodLabel{
    if (_periodLabel == nil) {
        _periodLabel = [[UILabel alloc]init];
        _periodLabel.font = [UIFont systemFontOfSize:12];
        _periodLabel.textColor = MCUIColorFromRGB(0x6B665E);
        _periodLabel.textAlignment = NSTextAlignmentCenter;
        _periodLabel.text = @"025";
        _periodLabel.adjustsFontSizeToFitWidth = YES;
//        _periodLabel.numberOfLines = 2;
    }
    return _periodLabel;
}

-(UILabel *)sumLabel{
    if (_sumLabel == nil) {
        _sumLabel = [[UILabel alloc]init];
        _sumLabel.font = [UIFont systemFontOfSize:12];
        _sumLabel.textColor = MCUIColorFromRGB(0x6B665E);
        _sumLabel.textAlignment = NSTextAlignmentCenter;
        _sumLabel.text = @"28";
    }
    return _sumLabel;
}


-(UILabel *)bigLabel{
    if (_bigLabel == nil) {
        _bigLabel = [[UILabel alloc]init];
        _bigLabel.font = [UIFont systemFontOfSize:12];
        _bigLabel.textColor = MCUIColorFromRGB(0xA04444);
        _bigLabel.textAlignment = NSTextAlignmentCenter;
        _bigLabel.text = @"大";
    }
    return _bigLabel;
}

-(UILabel *)singleLabel{
    if (_singleLabel == nil) {
        _singleLabel = [[UILabel alloc]init];
        _singleLabel.font = [UIFont systemFontOfSize:12];
        _singleLabel.textColor = MCUIColorFromRGB(0x6B665E);
        _singleLabel.textAlignment = NSTextAlignmentCenter;
        _singleLabel.text = @"单";
    }
    return _singleLabel;
}

-(UILabel *)dragonLabel{
    if (_dragonLabel == nil) {
        _dragonLabel = [[UILabel alloc]init];
        _dragonLabel.font = [UIFont systemFontOfSize:12];
        _dragonLabel.textColor = MCUIColorFromRGB(0x6B665E);
        _dragonLabel.textAlignment = NSTextAlignmentCenter;
        _dragonLabel.text = @"龙";
    }
    return _dragonLabel;
}




- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        CGFloat itemW = 25;
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(itemW,22);
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        self.collectionView.backgroundColor = [UIColor clearColor];
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kReuseCollectionCell];
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
    }
    return _collectionView;
}

- (NSMutableArray *)collectionDataArrayM {
    if (_collectionDataArrayM == nil) {
        self.collectionDataArrayM = [NSMutableArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4", nil];
    } return _collectionDataArrayM;
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
