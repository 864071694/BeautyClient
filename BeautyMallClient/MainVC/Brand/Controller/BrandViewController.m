//
//  BrandViewController.m
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/22.
//  Copyright © 2015年 √Ç¬∫‚Ä†√ä‚â•Œ©√ä‚Ä¢‚Ä†. All rights reserved.
//

#import "BrandViewController.h"
#import "UICollectionView+Regist.h"
#import "RecommendCell.h"
#import "YesterdayCell.h"
#import "BrandCell.h"
#import "BrandHeaderView.h"
#import "SearchHeadView.h"
#import "AFNetworkRequest.h"
#import "BrandDataModels.h"
#import "BrandListDataModels.h"
#import "SearchViewController.h"

@interface BrandViewController ()
<AFNetworkRequestDatasource, UICollectionViewDataSource>

@property (nonatomic, PX_STRONG) UICollectionView *bgCollectionView;
@property (nonatomic, PX_STRONG) NSMutableArray *brands;
@property (nonatomic, PX_STRONG) NSMutableArray *brandLists;

@end

@implementation BrandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"品牌";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.bgCollectionView];
    //编辑推荐:http://api.yuike.com/beautymall/api/1.0/brand/recommend_list.php?sid=fa275dd28158fb9e215da37b2fbb155b&yk_appid=1&yk_cbv=2.9.2&yk_pid=1
    AFNetworkRequest *request = [[AFNetworkRequest alloc] init];
    request.datasource = self;
    [request requestWithURLString:@"recommend_list.php?sid=fa275dd28158fb9e215da37b2fbb155b&yk_appid=1&yk_cbv=2.9.2&yk_pid=1" parameters:nil type:NetworkRequestTypeGet resultBlock:^(id responseObject, NSError *error) {
        BrandBaseClass *base = [BrandBaseClass modelObjectWithDictionary:responseObject];
        NSArray *dataArray = base.data;
        [self.brands addObjectsFromArray:dataArray];
        [self.bgCollectionView reloadData];
    }];
    
    //剩下的所有:http://api.yuike.com/beautymall/api/1.0/brand/ranking_list.php?sid=fa275dd28158fb9e215da37b2fbb155b&yk_appid=1&yk_cbv=2.9.2&yk_pid=1
    [request requestWithURLString:@"ranking_list.php?sid=fa275dd28158fb9e215da37b2fbb155b&yk_appid=1&yk_cbv=2.9.2&yk_pid=1" parameters:nil type:NetworkRequestTypeGet resultBlock:^(id responseObject, NSError *error) {
        BrandListBaseClass *base = [BrandListBaseClass modelObjectWithDictionary:responseObject];
        NSArray *dataArray = base.data;
        [self.brandLists addObjectsFromArray:dataArray];
        [self.bgCollectionView reloadData];
    }];
}

- (NSString *)NetworkRequestBaseURLString {
    return @"http://api.yuike.com/beautymall/api/1.0/brand/";
}

#pragma mark - lazy

- (UICollectionView *)bgCollectionView {
    if (!_bgCollectionView) {
        CGRect rect = CGRectMake(0, NAVGATIONNAR_H, ScreenW, ScreenH - NAVGATIONNAR_H - CUSTOM_Tab_H);
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _bgCollectionView = [[UICollectionView alloc] initWithFrame:rect
                                               collectionViewLayout:layout];
        PX_RELEASE(layout);
        _bgCollectionView.showsVerticalScrollIndicator = NO;
        _bgCollectionView.showsHorizontalScrollIndicator = NO;
        _bgCollectionView.backgroundColor = GRAYCOLOR;
        [_bgCollectionView registerNibHeade:[BrandHeaderView class]];
        [_bgCollectionView registerNibHeade:[SearchHeadView class]];
        [_bgCollectionView registerNibClass:[RecommendCell class]];
        [_bgCollectionView registerNibClass:[YesterdayCell class]];
        [_bgCollectionView registerNibClass:[BrandCell class]];
        
        _bgCollectionView.delegate = (id)self;
        _bgCollectionView.dataSource = (id)self;
    }
    return _bgCollectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 0;
        case 1:
            return 5;
        case 2:
        case 3:
            return self.brandLists.count == 0 ? 0 : [[self.brandLists[section - 2] items] count];
        case 4:
            return self.brandLists.count == 0 ? 0 : self.brandLists.count - 2;
        default:
            return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = nil;
    switch (indexPath.section) {
        case 1: {
            RecommendCell *recommendCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RecommendCell"
                                                                                     forIndexPath:indexPath];
            if (self.brands.count != 0) {
                BrandData *brandData = self.brands[indexPath.section - 1];
                recommendCell.brand = brandData.brands[indexPath.item];
            }
            cell = recommendCell;
        }
            break;
        case 2:
        case 3: {
            YesterdayCell *yeterdayCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YesterdayCell"
                                                                                    forIndexPath:indexPath];
            yeterdayCell.item = [self.brandLists[indexPath.section - 2] items][indexPath.item];
            cell = yeterdayCell;
        }
            break;
        case 4: {
            BrandCell *brandCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BrandCell"
                                                                               forIndexPath:indexPath];
            if (self.brandLists.count != 0) {
                BrandListData *data = self.brandLists[indexPath.item + 2];
                brandCell.contentLB.text = data.groupName;
                [brandCell.imgV sd_setImageWithURL:[NSURL URLWithString:data.groupPicUrl]
                                  placeholderImage:nil];
            }
            cell = brandCell;
        }
            break;
    }
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 1:
            return CGSizeMake(355, 235);
        case 2:
        case 3:
            return CGSizeMake(88, 60);
        case 4:
            return CGSizeMake(355, 40);
        default:
            return CGSizeZero;
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return UIEdgeInsetsZero;
    } else {
        return UIEdgeInsetsMake(0, 10, 10, 10);
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    switch (section) {
        case 0:
            return 0;
        case 1:
            return 20;
        default:
            return 1;
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    switch (section) {
        case 0:
            return 0;
        case 1:
            return 10;
        default:
            return 1;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (![kind isEqualToString:@"UICollectionElementKindSectionHeader"]) {
        return nil;
    }
    NSInteger section = indexPath.section;
    if (section == 0) {
        SearchHeadView *searchHeadView = [collectionView dequeueReusableSupplementaryViewOfKind:@"UICollectionElementKindSectionHeader" withReuseIdentifier:@"SearchHeadView" forIndexPath:indexPath];
        [searchHeadView.searchBtn addTarget:self
                                     action:@selector(searchBtnClick:)
                           forControlEvents:UIControlEventTouchUpInside];
        return searchHeadView;
    } else {
        BrandHeaderView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:@"UICollectionElementKindSectionHeader"
                                                                       withReuseIdentifier:@"BrandHeaderView"
                                                                              forIndexPath:indexPath];
        switch (section) {
            case 1:
                headView.titleLB.text = @"编辑推荐";
                break;
            case 2:
                headView.titleLB.text = @"昨日上升最快品牌";
                break;
            case 3:
                headView.titleLB.text = @"本周品牌排行";
                break;
            case 4:
                headView.titleLB.text = @"品牌排行榜";
                break;
        }
        return headView;
    }
}

- (void)searchBtnClick:(UIButton *)sender {
    SearchViewController *vc = [[SearchViewController alloc] init];
    [self.tabBarController.navigationController pushViewController:vc animated:YES];
    PX_RELEASE(vc);
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(ScreenW, 46);
    }
    return CGSizeMake(ScreenW, 30);
}

- (NSMutableArray *)brands {
    if (!_brands) {
        _brands = [[NSMutableArray alloc] init];
    }
    return _brands;
}

- (NSMutableArray *)brandLists {
    if (!_brandLists) {
        _brandLists = [[NSMutableArray alloc] init];
    }
    return _brandLists;
}

@end
