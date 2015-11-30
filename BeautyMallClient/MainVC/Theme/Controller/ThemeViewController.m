//
//  ThemeViewController.m
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/22.
//  Copyright © 2015年 √Ç¬∫‚Ä†√ä‚â•Œ©√ä‚Ä¢‚Ä†. All rights reserved.
//

#import "ThemeViewController.h"
#import "ThemeCell.h"
#import "UICollectionView+Regist.h"
#import "AFNetworkRequest.h"
#import "ListModal.h"
#import "ActivityDataModels.h"
#define TopBarH 56

@interface ThemeViewController ()
<AFNetworkRequestDatasource>

@property (nonatomic, PX_STRONG) UIView *topView;
@property (nonatomic, PX_STRONG) UIView *topLineView;
@property (nonatomic, PX_STRONG) UIButton *topSelectedBtn;
@property (nonatomic, PX_STRONG) UICollectionView *bgCollectionView;
@property (nonatomic, PX_STRONG) NSMutableArray *themes;
@property (nonatomic, assign   ) CGPoint oldPoint;
@property (nonatomic, assign   ) BOOL isScrolling;
@property (nonatomic, PX_STRONG) NSMutableArray *activities;

@end

@implementation ThemeViewController

- (NSMutableArray *)activities {
    if (!_activities) {
        _activities = [[NSMutableArray alloc] init];
    }
    return _activities;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.topView];
    [self.topView addSubview:self.topLineView];
    [self.view addSubview:self.bgCollectionView];
    
    AFNetworkRequest *request = [[AFNetworkRequest alloc] init];
    request.datasource = self;
    [request requestWithURLString:@"category_list.php?sid=fa275dd28158fb9e215da37b2fbb155b&yk_appid=1&yk_cbv=2.9.2&yk_pid=1" parameters:nil type:NetworkRequestTypeGet resultBlock:^(id responseObject, NSError *error) {
        NSArray *array = responseObject[@"data"];
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//            ListModal *modal = [ListModal modalWithDictionary:obj];
            
        }];
    }];
    [request requestWithURLString:@"list.php?activity_category_ids=1&activity_types=1,2,3,4,5&count=40&cursor=0&sid=fa275dd28158fb9e215da37b2fbb155b&yk_appid=1&yk_cbv=2.9.2&yk_pid=1&yk_user_id=2079512" parameters:nil type:NetworkRequestTypeGet resultBlock:^(id responseObject, NSError *error) {
        ActivityBaseClass *base = [ActivityBaseClass modelObjectWithDictionary:responseObject];
        ActivityData *acData = base.data;
        [self.activities addObjectsFromArray:acData.activities];
        [self.bgCollectionView reloadData];
//        [acData.activities enumerateObjectsUsingBlock:^(ActivityActivities *obj, NSUInteger idx, BOOL *stop) {
////            obj.url 点进去的网页地址
//            UIImageView *imgV = [[UIImageView alloc] init];
//            imgV.frame = CGRectMake(0, 0, 100, 100);
//            [self.view addSubview:imgV];
//            [imgV sd_setImageWithURL:[NSURL URLWithString:obj.picUrl]];
//            
//        }];
        
    }];
    //最上面五个按钮:http://api.yuike.com/beautymall/api/1.0/activity/category_list.php?sid=fa275dd28158fb9e215da37b2fbb155b&yk_appid=1&yk_cbv=2.9.2&yk_pid=1
    //中间内容:http://api.yuike.com/beautymall/api/1.0/activity/list.php?activity_category_ids=1&activity_types=1,2,3,4,5&count=40&cursor=0&sid=fa275dd28158fb9e215da37b2fbb155b&yk_appid=1&yk_cbv=2.9.2&yk_pid=1&yk_user_id=2079512
}

- (NSString *)NetworkRequestBaseURLString {
    return @"http://api.yuike.com/beautymall/api/1.0/activity/";
}

#pragma mark - Lazy

- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] init];
        _topView.frame = CGRectMake(-1, -1, ScreenW + 2, TopBarH);
        _topView.backgroundColor = [UIColor colorWithRed:0.957 green:0.957 blue:0.945 alpha:1.000];
        _topView.layer.borderWidth = 1;
        _topView.layer.borderColor = [UIColor colorWithRed:0.741 green:0.741 blue:0.737 alpha:1.000].CGColor;
        NSArray *titles = @[@"福利", @"时尚", @"特卖", @"课堂", @"穿搭"];
        CGFloat btnW = ScreenW / titles.count;
        CGFloat btnH = TopBarH - 20;
        for (int i = 0; i < titles.count; i ++) {
            UIButton *btn = [UIButton buttonWithType:0];
            btn.frame = CGRectMake(btnW * i, 20, btnW, btnH);
            [btn setTitle:titles[i]
                 forState:UIControlStateNormal];
            [btn setTitleColor:PINKCOLOR
                      forState:UIControlStateSelected];
            [btn setTitleColor:[UIColor colorWithWhite:0.431 alpha:1.000]
                      forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(topBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [_topView addSubview:btn];
            btn.tag = i + 1000;
            if (0 == i) {
                CGPoint center = btn.center;
                center.y = CGRectGetMaxY(btn.frame) - 2;
                self.topLineView.center = center;
                self.oldPoint = center;
            }
        }
    }
    return _topView;
}

- (void)topBtnClick:(UIButton *)sender {
    if (self.topSelectedBtn == sender) {
        return;
    }
    [UIView animateWithDuration:0.2 animations:^{
        CGPoint center = sender.center;
        center.y = CGRectGetMaxY(sender.frame) - 2;
        self.topLineView.center = center;
    }];
    
    self.topSelectedBtn.selected = NO;
    sender.selected = YES;
    self.topSelectedBtn = sender;
    NSInteger index = sender.tag - 1000;
    CGFloat y = CGRectGetMidY(self.topLineView.frame);
    self.topLineView.center = CGPointMake(sender.center.x, y);
    [self.bgCollectionView setContentOffset:CGPointMake(ScreenW * index, 0) animated:YES];
}

- (UIView *)topLineView {
    if (!_topLineView) {
        _topLineView = [[UIView alloc] init];
        _topLineView.bounds = CGRectMake(0, 0, 66, 2);
        _topLineView.backgroundColor = PINKCOLOR;
    }
    return _topLineView;
}

- (UICollectionView *)bgCollectionView {
    if (!_bgCollectionView) {
        CGRect rect = CGRectMake(0, TopBarH, ScreenW, ScreenH - TopBarH - CUSTOM_Tab_H);
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(ScreenW, ScreenH - TopBarH - CUSTOM_Tab_H);
        _bgCollectionView = [[UICollectionView alloc] initWithFrame:rect
                                   collectionViewLayout:layout];
        PX_RELEASE(layout);
        _bgCollectionView.pagingEnabled = YES;
        _bgCollectionView.showsVerticalScrollIndicator = NO;
        _bgCollectionView.showsHorizontalScrollIndicator = NO;
        _bgCollectionView.backgroundColor = GRAYCOLOR;
        [_bgCollectionView registerNibClass:[ThemeCell class]];
        A2DynamicDelegate *delegate = _bgCollectionView.bk_dynamicDelegate;
        @weakify_self
        
        [delegate implementMethod:@selector(collectionView:cellForItemAtIndexPath:) withBlock:^(UICollectionView *collectionView, NSIndexPath *indexPath){
            ThemeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThemeCell" forIndexPath:indexPath];
            if (self.activities.count != 0) {
                cell.themes = self.activities;
            }
            return cell;
        }];
        [delegate implementMethod:@selector(collectionView:numberOfItemsInSection:) withBlock:^(UICollectionView *collectionView, NSInteger section){
            return 5;
        }];
        
        [delegate implementMethod:@selector(scrollViewWillBeginDragging:) withBlock:^(UIScrollView *scrollView){
            @strongify_self
            self.isScrolling = YES;
        }];
        
        [delegate implementMethod:@selector(scrollViewDidScroll:) withBlock:^(UIScrollView *scrollView){
            @strongify_self
            if (self.isScrolling) {
                NSInteger index = scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame);
                UIButton *btn = (UIButton *)[self.topView viewWithTag:1000 + index];
                CGFloat btnW = CGRectGetWidth(btn.frame);
                CGFloat y = CGRectGetMaxY(btn.frame) - 2;
                CGFloat offX = btnW * scrollView.contentOffset.x / ScreenW + self.oldPoint.x;
                self.topLineView.center = CGPointMake(offX, y);
            }
        }];
        
        [delegate implementMethod:@selector(scrollViewDidEndDecelerating:) withBlock:^(UIScrollView *scrollView){
            @strongify_self
            NSInteger index = scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame);
            UIButton *btn = (UIButton *)[self.topView viewWithTag:1000 + index];
            [self topBtnClick:btn];
            self.isScrolling = NO;
        }];

        _bgCollectionView.delegate = (id)delegate;
        _bgCollectionView.dataSource = (id)delegate;
    }
    return _bgCollectionView;
}

- (NSMutableArray *)themes {
    if (!_themes) {
        _themes = [[NSMutableArray alloc] init];
    }
    return _themes;
}

@end
