//
//  CCGameChongqingTimeColorTrendHeaderView.m
//  SmallGames
//
//  Created by hello on 2018/9/27.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameChongqingTimeColorTrendHeaderView.h"

@interface CCGameChongqingTimeColorTrendHeaderView()
<UICollectionViewDelegateFlowLayout,
UICollectionViewDelegate,
UICollectionViewDataSource>
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *periodLabel;//期数
@property (nonatomic, strong) NSMutableArray * collectionDataArrayM;
@property (nonatomic, strong) UICollectionView * collectionView;
@property(nonatomic,strong)UILabel *winningNumbersLabel;
@property(nonatomic,strong)UILabel *sumLabel;
@property(nonatomic,strong)UILabel *dragonLabel;

@property(nonatomic,strong)UIView *view_0;
@property(nonatomic,strong)UIView *view_1;
@property(nonatomic,strong)UIView *view_2;
@property(nonatomic,strong)UIView *view_3;
@end

@implementation CCGameChongqingTimeColorTrendHeaderView
#define kReuseCollectionCell @"cell"

-(void)initView{
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.left.right.bottom.equalTo(self);
    }];
    
    float viewH = (MCScreenWidth - 25*5-10)/5;
    
    [self addSubview:self.periodLabel];
    [self.periodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.width.equalTo(@(viewH));
        make.height.equalTo(@20);
    }];
    
    [self addSubview:self.view_0];
    [self.view_0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.equalTo(self);
        make.width.height.equalTo(self.periodLabel);
    }];


    [self addSubview:self.winningNumbersLabel];
    [self.winningNumbersLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.width.equalTo(@135);
        make.left.equalTo(self.periodLabel.mas_right).offset(0.5);
        make.height.equalTo(@20);
    }];
    
    [self addSubview:self.view_3];
    [self.view_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.width.height.left.equalTo(self.winningNumbersLabel);
    }];
    
    [self.view_3 addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view_3).offset(5);
        make.right.equalTo(self.view_3).offset(-5);
        make.top.bottom.equalTo(self.view_3);
    }];
    
    
    [self addSubview:self.sumLabel];
    [self.sumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.width.equalTo(@(viewH*3+1));
        make.left.equalTo(self.winningNumbersLabel.mas_right).offset(0.5);
        make.height.equalTo(@20);
    }];
    
    [self addSubview:self.view_1];
    [self.view_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.width.height.left.equalTo(self.sumLabel);
    }];
    

    [self addSubview:self.dragonLabel];
    [self.dragonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self);
        make.left.equalTo(self.sumLabel.mas_right).offset(0.5);
        make.height.equalTo(@20);
    }];
    
    [self addSubview:self.view_2];
    [self.view_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.width.height.left.equalTo(self.dragonLabel);
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
        _view_0.backgroundColor = MCUIColorFromRGB(0xDDDDDD);
    }
    return _view_0;
}

-(UIView *)view_1{
    if (!_view_1) {
        _view_1 = [[UIView alloc]init];
        _view_1.backgroundColor = MCUIColorFromRGB(0xDDDDDD);
    }
    return _view_1;
}

-(UIView *)view_2{
    if (!_view_2) {
        _view_2 = [[UIView alloc]init];
        _view_2.backgroundColor = MCUIColorFromRGB(0xDDDDDD);
    }
    return _view_2;
}

-(UIView *)view_3{
    if (!_view_3) {
        _view_3 = [[UIView alloc]init];
        _view_3.backgroundColor = MCUIColorFromRGB(0xDDDDDD);
    }
    return _view_3;
}


-(UILabel *)winningNumbersLabel{
    if (_winningNumbersLabel == nil) {
        _winningNumbersLabel = [[UILabel alloc]init];
        _winningNumbersLabel.font = [UIFont systemFontOfSize:12];
        _winningNumbersLabel.textColor = MCUIColorFromRGB(0x6B665E);
        _winningNumbersLabel.textAlignment = NSTextAlignmentCenter;
        _winningNumbersLabel.text = @"开奖号码";
        _winningNumbersLabel.backgroundColor = MCUIColorFromRGB(0xDDDDDD);
    }
    return _winningNumbersLabel;
}


-(UILabel *)periodLabel{
    if (_periodLabel == nil) {
        _periodLabel = [[UILabel alloc]init];
        _periodLabel.font = [UIFont systemFontOfSize:12];
        _periodLabel.textColor = MCUIColorFromRGB(0x6B665E);
        _periodLabel.textAlignment = NSTextAlignmentCenter;
        _periodLabel.text = @"期号";
        _periodLabel.backgroundColor = MCUIColorFromRGB(0xDDDDDD);
    }
    return _periodLabel;
}

-(UILabel *)sumLabel{
    if (_sumLabel == nil) {
        _sumLabel = [[UILabel alloc]init];
        _sumLabel.font = [UIFont systemFontOfSize:12];
        _sumLabel.textColor = MCUIColorFromRGB(0x6B665E);
        _sumLabel.textAlignment = NSTextAlignmentCenter;
        _sumLabel.text = @"总和";
        _sumLabel.backgroundColor = MCUIColorFromRGB(0xDDDDDD);
    }
    return _sumLabel;
}

-(UILabel *)dragonLabel{
    if (_dragonLabel == nil) {
        _dragonLabel = [[UILabel alloc]init];
        _dragonLabel.font = [UIFont systemFontOfSize:12];
        _dragonLabel.textColor = MCUIColorFromRGB(0x6B665E);
        _dragonLabel.textAlignment = NSTextAlignmentCenter;
        _dragonLabel.text = @"龙虎";
        _dragonLabel.backgroundColor = MCUIColorFromRGB(0xDDDDDD);
    }
    return _dragonLabel;
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
    label.font = [UIFont systemFontOfSize:11];
    label.textColor = MCUIColorFromRGB(0x331C0C);
    label.text = [NSString stringWithFormat:@"%@",[self.collectionDataArrayM objectAtIndex:indexPath.row]];
    label.textAlignment = NSTextAlignmentCenter;
    
    [cell addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(cell);
        make.width.equalTo(@22);
    }];
    return cell;
}


- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        CGFloat itemW = 25;
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(itemW,19);
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
        self.collectionDataArrayM = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    } return _collectionDataArrayM;
}

@end
