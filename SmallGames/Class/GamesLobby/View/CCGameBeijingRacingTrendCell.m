//
//  CCGameBeijingRacingTrendCell.m
//  SmallGames
//
//  Created by hello on 2018/9/28.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameBeijingRacingTrendCell.h"

@interface CCGameBeijingRacingTrendCell()
<UICollectionViewDelegateFlowLayout,
UICollectionViewDelegate,
UICollectionViewDataSource>
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *periodLabel;//期数
@property (nonatomic, strong) NSArray *collectionDataArrayM;
@property (nonatomic, strong) UICollectionView * collectionView;


@property(nonatomic,strong)UILabel *totalLabel;
@property(nonatomic,strong)UILabel *bigLabel;
@property(nonatomic,strong)UILabel *singleLabel;

@property(nonatomic,strong)UIView *view_0;
@property(nonatomic,strong)UIView *view_1;
@property(nonatomic,strong)UIView *view_2;
@property(nonatomic,strong)UIView *view_3;
@property(nonatomic,strong)UIView *view_4;

@property(nonatomic,strong)UILabel *dragonLabel_1;
@property(nonatomic,strong)UILabel *dragonLabel_2;
@property(nonatomic,strong)UILabel *dragonLabel_3;
@property(nonatomic,strong)UILabel *dragonLabel_4;
@property(nonatomic,strong)UILabel *dragonLabel_5;

@end

@implementation CCGameBeijingRacingTrendCell
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

-(void)setGameTrendModel:(CCGameTrendModel *)gameTrendModel{
    _gameTrendModel = gameTrendModel;
    self.collectionDataArrayM = gameTrendModel.kaijiang;
    
    [self.collectionView reloadData];
    
    self.periodLabel.text = gameTrendModel.term;
    self.totalLabel.text = [NSString stringWithFormat:@"%@",[gameTrendModel.guanya objectForKey:@"he"]];
    self.bigLabel.text = [gameTrendModel.guanya objectForKey:@"dx"];
    self.singleLabel.text = [gameTrendModel.guanya objectForKey:@"ds"];
    if ([[gameTrendModel.guanya objectForKey:@"ds"] isEqualToString:@"单"]) {
        self.singleLabel.textColor = MCUIColorFromRGB(0x1764FE);
    }else{
        self.singleLabel.textColor = MCUIColorFromRGB(0xF2086E);
    }
    if ([[gameTrendModel.guanya objectForKey:@"dx"] isEqualToString:@"小"]) {
        self.bigLabel.textColor = MCUIColorFromRGB(0x1764FE);
    }else{
        self.bigLabel.textColor = MCUIColorFromRGB(0xF2086E);
    }
    
    NSString *dragon_1 = [gameTrendModel.lh objectAtIndex:0];
    NSString *dragon_2 = [gameTrendModel.lh objectAtIndex:1];
    NSString *dragon_3 = [gameTrendModel.lh objectAtIndex:2];
    NSString *dragon_4 = [gameTrendModel.lh objectAtIndex:3];
    NSString *dragon_5 = [gameTrendModel.lh objectAtIndex:4];
    
    self.dragonLabel_1.text = dragon_1;
    self.dragonLabel_2.text = dragon_2;
    self.dragonLabel_3.text = dragon_3;
    self.dragonLabel_4.text = dragon_4;
    self.dragonLabel_5.text = dragon_5;
    
    if ([dragon_1 isEqualToString:@"虎"]) {
        self.dragonLabel_1.textColor = MCUIColorFromRGB(0x1764FE);
    }else{
        self.dragonLabel_1.textColor = MCUIColorFromRGB(0xF2086E);
    }
    
    if ([dragon_2 isEqualToString:@"虎"]) {
        self.dragonLabel_2.textColor = MCUIColorFromRGB(0x1764FE);
    }else{
        self.dragonLabel_2.textColor = MCUIColorFromRGB(0xF2086E);
    }
    if ([dragon_3 isEqualToString:@"虎"]) {
        self.dragonLabel_3.textColor = MCUIColorFromRGB(0x1764FE);
    }else{
        self.dragonLabel_3.textColor = MCUIColorFromRGB(0xF2086E);
    }
    if ([dragon_4 isEqualToString:@"虎"]) {
        self.dragonLabel_4.textColor = MCUIColorFromRGB(0x1764FE);
    }else{
        self.dragonLabel_4.textColor = MCUIColorFromRGB(0xF2086E);
    }
    if ([dragon_5 isEqualToString:@"虎"]) {
        self.dragonLabel_5.textColor = MCUIColorFromRGB(0x1764FE);
    }else{
        self.dragonLabel_5.textColor = MCUIColorFromRGB(0xF2086E);
    }
    
    
}

-(void)initView{
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.left.right.bottom.equalTo(self);
    }];
    
    float viewH = (MCScreenWidth - 20*10)/4;
    
    [self addSubview:self.periodLabel];
    [self.periodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.top.equalTo(self);
        make.width.equalTo(@(viewH));
    }];
    
    [self addSubview:self.view_0];
    [self.view_0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self);
        make.width.equalTo(@0.5);
        make.left.equalTo(self.periodLabel.mas_right);
    }];
    
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(@200);
        make.left.equalTo(self.periodLabel.mas_right).offset(0.5);
    }];
    
    [self addSubview:self.view_1];
    [self.view_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self);
        make.width.equalTo(@0.5);
        make.left.equalTo(self.collectionView.mas_right);
    }];
    
    [self addSubview:self.view_2];
    [self.view_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self);
        make.width.equalTo(@(viewH));
        make.left.equalTo(self.view_1.mas_right);
    }];
    
    [self addSubview:self.view_3];
    [self.view_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self);
        make.width.equalTo(@0.5);
        make.left.equalTo(self.view_2.mas_right);
    }];
    
    [self.view_2 addSubview:self.totalLabel];
    [self.totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.equalTo(self.view_2);
        make.width.equalTo(@(viewH/3));
    }];
    
    [self.view_2 addSubview:self.bigLabel];
    [self.bigLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.view_2);
        make.width.equalTo(@(viewH/3));
        make.center.equalTo(self.view_2);
    }];
    
    [self.view_2 addSubview:self.singleLabel];
    [self.singleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self.view_2);
        make.width.equalTo(@(viewH/3));
    }];
    
    [self addSubview:self.view_4];
    [self.view_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self);
        make.left.equalTo(self.view_3.mas_right);
    }];
    
    [self addSubview:self.dragonLabel_1];
    [self.dragonLabel_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.equalTo(self.view_4);
        make.width.equalTo(@(viewH*2/5));
    }];
    
    [self addSubview:self.dragonLabel_2];
    [self.dragonLabel_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.view_4);
        make.width.equalTo(@(viewH*2/5));
        make.left.equalTo(self.dragonLabel_1.mas_right);
    }];
    
    [self addSubview:self.dragonLabel_3];
    [self.dragonLabel_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.view_4);
        make.width.equalTo(@(viewH*2/5));
        make.left.equalTo(self.dragonLabel_2.mas_right);
    }];
    
    [self addSubview:self.dragonLabel_4];
    [self.dragonLabel_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.view_4);
        make.width.equalTo(@(viewH*2/5));
        make.left.equalTo(self.dragonLabel_3.mas_right);
    }];
    
    [self addSubview:self.dragonLabel_5];
    [self.dragonLabel_5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self.view_4);
        make.left.equalTo(self.dragonLabel_4.mas_right);
    }];
}



-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _lineView;
}

-(UIView *)view_0{
    if (!_view_0) {
        _view_0 = [[UIView alloc]init];
        _view_0.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _view_0;
}

-(UIView *)view_1{
    if (!_view_1) {
        _view_1 = [[UIView alloc]init];
        _view_1.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _view_1;
}

-(UIView *)view_2{
    if (!_view_2) {
        _view_2 = [[UIView alloc]init];
    }
    return _view_2;
}

-(UIView *)view_3{
    if (!_view_3) {
        _view_3 = [[UIView alloc]init];
        _view_3.backgroundColor = MCUIColorFromRGB(0xBFBFBF);
    }
    return _view_3;
}

-(UIView *)view_4{
    if (!_view_4) {
        _view_4 = [[UIView alloc]init];
    }
    return _view_4;
}


-(UILabel *)periodLabel{
    if (_periodLabel == nil) {
        _periodLabel = [[UILabel alloc]init];
        _periodLabel.font = [UIFont systemFontOfSize:9];
        _periodLabel.textColor = MCUIColorFromRGB(0x6B665E);
        _periodLabel.textAlignment = NSTextAlignmentCenter;
        _periodLabel.text = @"期数";
        _periodLabel.numberOfLines = 2;
    }
    return _periodLabel;
}

-(UILabel *)dragonLabel_1{
    if (_dragonLabel_1 == nil) {
        _dragonLabel_1 = [[UILabel alloc]init];
        _dragonLabel_1.font = [UIFont systemFontOfSize:12];
        _dragonLabel_1.textColor = MCUIColorFromRGB(0x6B665E);
        _dragonLabel_1.textAlignment = NSTextAlignmentCenter;
        _dragonLabel_1.text = @"龙";
    }
    return _dragonLabel_1;
}

-(UILabel *)dragonLabel_2{
    if (_dragonLabel_2 == nil) {
        _dragonLabel_2 = [[UILabel alloc]init];
        _dragonLabel_2.font = [UIFont systemFontOfSize:12];
        _dragonLabel_2.textColor = MCUIColorFromRGB(0x6B665E);
        _dragonLabel_2.textAlignment = NSTextAlignmentCenter;
        _dragonLabel_2.text = @"龙";
    }
    return _dragonLabel_2;
}

-(UILabel *)dragonLabel_3{
    if (_dragonLabel_3 == nil) {
        _dragonLabel_3 = [[UILabel alloc]init];
        _dragonLabel_3.font = [UIFont systemFontOfSize:12];
        _dragonLabel_3.textColor = MCUIColorFromRGB(0x6B665E);
        _dragonLabel_3.textAlignment = NSTextAlignmentCenter;
        _dragonLabel_3.text = @"龙";
    }
    return _dragonLabel_3;
}

-(UILabel *)dragonLabel_4{
    if (_dragonLabel_4 == nil) {
        _dragonLabel_4 = [[UILabel alloc]init];
        _dragonLabel_4.font = [UIFont systemFontOfSize:12];
        _dragonLabel_4.textColor = MCUIColorFromRGB(0x6B665E);
        _dragonLabel_4.textAlignment = NSTextAlignmentCenter;
        _dragonLabel_4.text = @"龙";
    }
    return _dragonLabel_4;
}

-(UILabel *)dragonLabel_5{
    if (_dragonLabel_5 == nil) {
        _dragonLabel_5 = [[UILabel alloc]init];
        _dragonLabel_5.font = [UIFont systemFontOfSize:12];
        _dragonLabel_5.textColor = MCUIColorFromRGB(0x6B665E);
        _dragonLabel_5.textAlignment = NSTextAlignmentCenter;
        _dragonLabel_5.text = @"龙";
    }
    return _dragonLabel_5;
}


-(UILabel *)totalLabel{
    if (_totalLabel == nil) {
        _totalLabel = [[UILabel alloc]init];
        _totalLabel.font = [UIFont systemFontOfSize:12];
        _totalLabel.textColor = MCUIColorFromRGB(0xB92C10);
        _totalLabel.textAlignment = NSTextAlignmentCenter;
        _totalLabel.text = @"28";
        _totalLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _totalLabel;
}


-(UILabel *)bigLabel{
    if (_bigLabel == nil) {
        _bigLabel = [[UILabel alloc]init];
        _bigLabel.font = [UIFont systemFontOfSize:12];
        _bigLabel.textColor = MCUIColorFromRGB(0xA04444);
        _bigLabel.textAlignment = NSTextAlignmentCenter;
        _bigLabel.text = @"大";
        _bigLabel.adjustsFontSizeToFitWidth = YES;
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
        _singleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _singleLabel;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.collectionDataArrayM.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReuseCollectionCell forIndexPath:indexPath];
    for (UIView * subView in cell.subviews) {
        [subView removeFromSuperview];
    }
    UIImageView *imageview = [[UIImageView alloc]init];
    imageview.image = [UIImage imageNamed:[self.collectionDataArrayM objectAtIndex:indexPath.row]];
    imageview.layer.cornerRadius = 2;
    imageview.layer.masksToBounds = YES;
    [cell addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(cell);
        make.width.height.equalTo(@17);
    }];
    return cell;
}


- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        CGFloat itemW = 20;
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(itemW,20);
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


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
