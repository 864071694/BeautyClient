//
//  HomePageViewController.m
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/22.
//  Copyright © 2015年 √Ç¬∫‚Ä†√ä‚â•Œ©√ä‚Ä¢‚Ä†. All rights reserved.
//

#import "BannerObj.h"
#import "BgCollectionViewCell.h"
#import "HomePageViewController.h"
#import "RankingObj.h"
#import "ZYDataModels.h"
#import "UICollectionView+Regist.h"

#define TOPVIEW_H 35

@interface HomePageViewController ()
<AFNetworkRequestDatasource>

@property (nonatomic, assign   ) BOOL             isScrolling;
@property (nonatomic, PX_STRONG) UIView           *topLineView;
@property (nonatomic, PX_STRONG) UIView           *topView;
@property (nonatomic, PX_STRONG) NSArray          *titles;
@property (nonatomic, assign   ) CGPoint          oldPoint;
@property (nonatomic, PX_STRONG) UIButton         *topSelectedBtn;
@property (nonatomic, PX_STRONG) UIScrollView     *topScroView;
@property (nonatomic, PX_STRONG) NSMutableArray   *banners;
@property (nonatomic, PX_STRONG) NSMutableArray   *rankings;
@property (nonatomic, PX_STRONG) NSMutableArray   *products;
@property (nonatomic, PX_STRONG) UICollectionView *bgCollectionView;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.topView];
    [self.topView addSubview:self.topScroView];
    [self.view addSubview:self.bgCollectionView];
    
    UIImageView *titleImgV = [[UIImageView alloc] init];
    titleImgV.image = [UIImage imageNamed:@"home_page_titleimage"];
    titleImgV.frame = CGRectMake(0, 0, 100, 30);
    self.navigationItem.titleView = titleImgV;
    PX_RELEASE(titleImgV);
    
    AFNetworkRequest *request = [[AFNetworkRequest alloc] init];
    request.datasource = self;
    @weakify_self;
    [request requestWithURLString:@"client/banner_list.php?sid=f68e6d0cfd81f0bc337af97b0f733701&yk_appid=1&yk_cbv=2.9.2&yk_pid=1" parameters:nil type:NetworkRequestTypeGet resultBlock:^(id responseObject, NSError *error) {
        if (self.banners.count > 0) {
            [self.banners removeAllObjects];
        }
        [responseObject[@"data"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            @strongify_self;
            BannerObj *banner = [BannerObj modalWithDictionary:obj];
            [self.banners addObject:banner];
        }];
        [self.bgCollectionView reloadData];
    }];
    [request requestWithURLString:@"category/ranking_list.php?yk_appid=1&sid=6b94d8ee8b05caffc4b7c361c0f979f5&yk_pid=1&yk_cbv=2.8.4.2" parameters:nil type:NetworkRequestTypeGet resultBlock:^(id responseObject, NSError *error) {
        if (self.rankings.count > 0) {
            [self.rankings removeAllObjects];
        }
        [responseObject[@"data"][@"categories"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            @strongify_self;
            RankingObj *rank = [RankingObj modalWithDictionary:obj];
            [self.rankings addObject:rank];
        }];
        [self.bgCollectionView reloadData];
    }];
    [request requestWithURLString:@"product/quality.php?cursor=0&yk_pid=1&yk_cbv=2.8.4.2&count=40&yk_user_id=2061882&yk_appid=1&sid=6b94d8ee8b05caffc4b7c361c0f979f5&type=choice" parameters:nil type:NetworkRequestTypeGet resultBlock:^(id responseObject, NSError *error) {
        @strongify_self;
        if (self.products.count > 0) {
            [self.products removeAllObjects];
        }
        ZYBaseClass *base = [ZYBaseClass modelObjectWithDictionary:responseObject];
        ZYData *data = base.data;
        [self.products addObjectsFromArray:data.products];
        [self.bgCollectionView reloadData];
    }];
    PX_RELEASE(request);
}

- (void)topBtnClick:(UIButton *)sender {
    if (self.topSelectedBtn == sender) {
        return;
    }
    self.topSelectedBtn.selected = NO;
    sender.selected = YES;
    self.topSelectedBtn = sender;
    NSInteger index = sender.tag - 1000;
    CGFloat y = CGRectGetMidY(self.topLineView.frame);
    self.topLineView.center = CGPointMake(sender.center.x, y);
    if (index > 3 && index < self.titles.count - 2) {
        CGFloat x = CGRectGetMidX(sender.frame) - self.topScroView.contentOffset.x - ScreenW / 2;
        [self.topScroView setContentOffset:CGPointMake(self.topScroView.contentOffset.x + x, 0)
                                  animated:YES];
    } else if (index <= 3) {
        [self.topScroView setContentOffset:CGPointMake(0, 0)
                                  animated:YES];
    }
    
    [self.bgCollectionView setContentOffset:CGPointMake(ScreenW * index, 0) animated:YES];
}

#pragma mark - AFNetworkRequestDatasource

- (NSString *)NetworkRequestBaseURLString {
    return @"http://api.yuike.com/beautymall/api/1.0/";
}

#pragma mark - LAZY 

- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"推荐", @"青春", @"淑女", @"女鞋", @"配饰",
                    @"女包", @"泳装", @"内衣", @"婚礼", @"大码",
                    @"老公", @"爸爸", @"妈妈", @"孕妇", @"男孩",
                    @"女孩", @"生活", @"护肤"];
    }
    return _titles;
}

- (UICollectionView *)bgCollectionView {
    if (!_bgCollectionView) {
        CGRect rect = CGRectMake(0, NAVGATIONNAR_H + TOPVIEW_H, ScreenW, ScreenH - NAVGATIONNAR_H - TOPVIEW_H - CUSTOM_Tab_H);
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(ScreenW, ScreenH - NAVGATIONNAR_H - TOPVIEW_H - CUSTOM_Tab_H);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _bgCollectionView = [[UICollectionView alloc] initWithFrame:rect
                                               collectionViewLayout:layout];
        PX_RELEASE(layout);
        _bgCollectionView.pagingEnabled = YES;
        _bgCollectionView.showsHorizontalScrollIndicator = NO;
        _bgCollectionView.showsVerticalScrollIndicator = NO;
        [_bgCollectionView registerNibClass:[BgCollectionViewCell class]];
        
        A2DynamicDelegate *dataSource = _bgCollectionView.bk_dynamicDelegate;
        [dataSource implementMethod:@selector(collectionView:numberOfItemsInSection:) withBlock:^(UICollectionView *collectionView, NSInteger section){
            return self.titles.count;
        }];
        
        @weakify_self
        [dataSource implementMethod:@selector(collectionView:cellForItemAtIndexPath:) withBlock:^(UICollectionView *collectionView, NSIndexPath *indexPath){
            @strongify_self
            BgCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BgCollectionViewCell"
                                          forIndexPath:indexPath];
            
            cell.index = indexPath.item;
            if (cell.index == 0) {
                cell.banners = self.banners;
                cell.rankings = self.rankings;
                cell.btns = 3;
            } else {
                cell.banners = nil;
                cell.rankings = nil;
                cell.btns = 0;
            }
            cell.products = self.products;
            return cell;
        }];
        
        [dataSource implementMethod:@selector(scrollViewWillBeginDragging:) withBlock:^(UIScrollView *scrollView){
            @strongify_self
            self.isScrolling = YES;
        }];
        
        [dataSource implementMethod:@selector(scrollViewDidScroll:) withBlock:^(UIScrollView *scrollView){
            @strongify_self
            if (self.isScrolling) {
                NSInteger index = scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame);
                UIButton *btn   = (id)[self.topScroView viewWithTag:1000 + index];
                CGFloat btnW    = CGRectGetWidth(btn.frame);
                CGFloat offY    = CGRectGetMaxY(btn.frame) - 1;
                CGFloat offX    = btnW * scrollView.contentOffset.x / ScreenW + self.oldPoint.x;
                self.topLineView.center = CGPointMake(offX, offY);
            }
        }];
        
        [dataSource implementMethod:@selector(scrollViewDidEndDecelerating:) withBlock:^(UIScrollView *scrollView){
            @strongify_self
            NSInteger index = scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame);
            UIButton *btn = (UIButton *)[self.topScroView viewWithTag:1000 + index];
            [self topBtnClick:btn];
            if (index > 3 && index < self.titles.count - 2) {
                CGFloat x = CGRectGetMidX(btn.frame) - self.topScroView.contentOffset.x - ScreenW / 2;
                [self.topScroView setContentOffset:CGPointMake(self.topScroView.contentOffset.x + x, 0)
                                          animated:YES];
            } else if (index == 2) {
                [self.topScroView setContentOffset:CGPointMake(0, 0)
                                          animated:YES];
            }
            self.isScrolling = NO;
        }];
        _bgCollectionView.dataSource = (id)dataSource;
        _bgCollectionView.delegate = (id)dataSource;
    }
    return _bgCollectionView;
}

- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] init];
        _topView.frame = CGRectMake(0, NAVGATIONNAR_H, ScreenW, TOPVIEW_H);
        UIButton *arrowBtn = [UIButton buttonWithType:0];
        _topView.backgroundColor = GRAYCOLOR;
        arrowBtn.frame = CGRectMake(ScreenW - TOPVIEW_H, 0, TOPVIEW_H, TOPVIEW_H);
        arrowBtn.backgroundColor = [UIColor yellowColor];
        [_topView addSubview:arrowBtn];
    }
    return _topView;
}

- (UIView *)topLineView {
    if (!_topLineView) {
        _topLineView = [[UIView alloc] init];
        _topLineView.backgroundColor = PINKCOLOR;
    }
    return _topLineView;
}

- (UIScrollView *)topScroView {
    if (!_topScroView) {
        _topScroView = [[UIScrollView alloc] init];
        _topScroView.frame = CGRectMake(0, 0, ScreenW - TOPVIEW_H, TOPVIEW_H);
        CGFloat btnW = CGRectGetWidth(_topScroView.frame) / 6;
        CGFloat btnH = TOPVIEW_H;
        _topScroView.contentSize = CGSizeMake(self.titles.count * btnW, btnH);
        _topScroView.showsVerticalScrollIndicator = NO;
        _topScroView.showsHorizontalScrollIndicator = NO;
        [_topScroView addSubview:self.topLineView];
        for (int i = 0; i < self.titles.count; i ++) {
            UIButton *btn = [UIButton buttonWithType:0];
            btn.frame = CGRectMake(btnW * i, 0, btnW, btnH);
            [btn setTitle:self.titles[i]
                 forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithWhite:0.459 alpha:1.000]
                      forState:UIControlStateNormal];
            [btn setTitleColor:PINKCOLOR
                      forState:UIControlStateSelected];
            btn.tag = i + 1000;
            [btn addTarget:self action:@selector(topBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            if (0 == i) {
                [self topBtnClick:btn];
                _topLineView.bounds = CGRectMake(0, 0, btnW - 10, 2);
                CGFloat y = CGRectGetMaxY(btn.frame) - 1;
                _topLineView.center = CGPointMake(btn.center.x, y);
                self.oldPoint = _topLineView.center;
            }
            [_topScroView addSubview:btn];
        }
    }
    return _topScroView;
}

- (NSMutableArray *)banners {
    if (!_banners) {
        _banners = [[NSMutableArray alloc] init];
    }
    return _banners;
}

- (NSMutableArray *)rankings {
    if (!_rankings) {
        _rankings = [[NSMutableArray alloc] init];
    }
    return _rankings;
}

- (NSMutableArray *)products {
    if (!_products) {
        _products = [[NSMutableArray alloc] init];
    }
    return _products;
}

@end