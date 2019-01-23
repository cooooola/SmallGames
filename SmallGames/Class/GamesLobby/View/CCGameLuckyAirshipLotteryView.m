//
//  CCGameLuckyAirshipLotteryView.m
//  SmallGames
//
//  Created by hello on 2018/9/27.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameLuckyAirshipLotteryView.h"
@interface CCGameLuckyAirshipLotteryView()
<UICollectionViewDelegateFlowLayout,
UICollectionViewDelegate,
UICollectionViewDataSource>
@property (nonatomic, strong) NSMutableArray * collectionDataArrayM;
@property(nonatomic,strong)UILabel *issueLabel;
@property (nonatomic, strong) UICollectionView * collectionView;

@end

@implementation CCGameLuckyAirshipLotteryView
#define kReuseCollectionCell @"cell"

-(void)initView{
    self.backgroundColor = MCUIColorFromRGB(0x302941);
    [self addSubview:self.issueLabel];
    [self.issueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self).offset(10);
    }];
    
    [self addSubview:self.collectionView];
    [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.issueLabel.mas_right).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.bottom.equalTo(self);
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
    UIImageView *imageview = [[UIImageView alloc]init];
    imageview.image = [UIImage imageNamed:[self.collectionDataArrayM objectAtIndex:indexPath.row]];
    imageview.layer.cornerRadius = 11;
    imageview.layer.masksToBounds = YES;
    [cell addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(cell);
    }];
    return cell;
}



-(UILabel *)issueLabel{
    if (!_issueLabel) {
        _issueLabel = [[UILabel alloc]init];
        _issueLabel.textColor = [UIColor whiteColor];
        _issueLabel.font = [UIFont systemFontOfSize:10];
        _issueLabel.textAlignment = NSTextAlignmentCenter;
        _issueLabel.numberOfLines = 2;
        _issueLabel.text = @"幸运飞艇\n123456期";
    }
    return _issueLabel;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        CGFloat itemW = 30;
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(itemW,22);
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        self.collectionView.backgroundColor = MCUIColorFromRGB(0x302941);
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kReuseCollectionCell];
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
    }
    return _collectionView;
}

- (NSMutableArray *)collectionDataArrayM {
    if (_collectionDataArrayM == nil) {
        self.collectionDataArrayM = [NSMutableArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    } return _collectionDataArrayM;
}

@end
