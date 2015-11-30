//
//  BgCollectionViewCell.m
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/22.
//  Copyright © 2015年 √Ç¬∫‚Ä†√ä‚â•Œ©√ä‚Ä¢‚Ä†. All rights reserved.
//

#import "BgCollectionViewCell.h"
#import "ChoiceCell.h"
#import "CustomLayout.h"
#import "ZYBannerCell.h"
#import "ZYProductCell.h"
#import "ZYRankCell.h"
#import "SelectedCell.h"
#import "SectionCell.h"
#import <SVPullToRefresh.h>
#import "UICollectionView+Regist.h"

@interface BgCollectionViewCell()
<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, PX_STRONG) UICollectionView *myCo;

@end

@implementation BgCollectionViewCell

- (UICollectionView *)myCo {
    if (!_myCo) {
        CGRect rect = CGRectMake(0, 0, ScreenW, ScreenH - NAVGATIONNAR_H - 35 - CUSTOM_Tab_H);
        CustomLayout *layout = [[CustomLayout alloc] init];
        layout.minimumLineSpacing = 15;
        layout.itemSize = CGSizeMake(10, 10);
        _myCo = [[UICollectionView alloc] initWithFrame:rect
                                   collectionViewLayout:layout];
        PX_RELEASE(layout);
        _myCo.backgroundColor = GRAYCOLOR;
        [_myCo registerNibClass:[ZYRankCell class]];
        [_myCo registerNibClass:[ChoiceCell class]];
        [_myCo registerNibClass:[SectionCell class]];
        [_myCo registerNibClass:[SelectedCell class]];
        [_myCo registerNibClass:[ZYBannerCell class]];
        [_myCo registerNibClass:[ZYProductCell class]];

        _myCo.dataSource = self;
        _myCo.delegate = self;
    }
    return _myCo;
}

- (void)awakeFromNib {
    [self.contentView addSubview:self.myCo];
}

- (void)setIndex:(NSInteger)index {
    _index = index;
    [self.myCo reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case 0: return self.banners.count == 0 ? 0 : 1;
        case 1: return self.btns == 0 ? 0 : 3;
        case 2: return self.rankings.count == 0 ? 0 : self.rankings.count + 1;
        case 3: return self.products.count == 0 ? 0 : self.products.count + 1;
        default:return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = nil;
    switch (indexPath.section) {
        case 0:{
            ZYBannerCell *bannerCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZYBannerCell"
                                                                                 forIndexPath:indexPath];
            bannerCell.dataSource = self.banners;
            cell = bannerCell;
        }
            break;
        case 1:{
            SelectedCell *selectCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SelectedCell"
                                                                                 forIndexPath:indexPath];
            cell = selectCell;
        }
            break;
        case 2:{
            if (indexPath.item == 0) {
                cell.backgroundColor = [UIColor orangeColor];
                SectionCell *sectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SectionCell"
                                            forIndexPath:indexPath];
                cell = sectionCell;
            } else {
                cell.backgroundColor = [UIColor greenColor];
                ZYRankCell *rankCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZYRankCell"
                                                                                 forIndexPath:indexPath];
                rankCell.rank = self.rankings[indexPath.item-1];
                cell = rankCell;
            }
        }
            break;
        case 3:{
            if (indexPath.item == 0) {
                ChoiceCell *choiceCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ChoiceCell" forIndexPath:indexPath];
                cell = choiceCell;
            } else {
                ZYProductCell *productCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZYProductCell" forIndexPath:indexPath];
                productCell.product = self.products[indexPath.item-1];
                cell = productCell;
            }
        }
            break;
    }
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}

@end
