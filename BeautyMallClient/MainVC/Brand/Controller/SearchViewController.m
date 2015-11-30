//
//  SearchViewController.m
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/29.
//  Copyright © 2015年 ‚Äö√†√∂‚àö√°¬¨¬®‚Äö√†¬¥‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö¬¢‚Äö√Ñ¬¢‚âà√≠¬¨¬©‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö√ë¬¨¬¢‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†. All rights reserved.
//

#import "SearchViewController.h"
#import "UICollectionView+Regist.h"
#import "SearchDetailCell.h"
#import "AFNetworkRequest.h"
#import "BrandDataModels.h"

@interface SearchViewController ()
<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,AFNetworkRequestDatasource>

@property (nonatomic, PX_STRONG) UIView *topView;
@property (nonatomic, PX_STRONG) UIView *textFieldView;
@property (nonatomic, PX_STRONG) UITextField *searchTextField;
@property (nonatomic, PX_STRONG) UICollectionView *bgCollectionView;
@property (nonatomic, PX_STRONG) NSMutableArray *results;

@end

@implementation SearchViewController

- (void)dealloc {
    PX_RELEASE(_topView);
    PX_RELEASE(_textFieldView);
    PX_RELEASE(_searchTextField);
    PX_RELEASE(_bgCollectionView);
    PX_RELEASE(_results);
#if !__has_feature(objc_arc)
    [super dealloc];
#endif
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self.view addSubview:self.topView];
    [self.topView addSubview:self.textFieldView];
    [self.textFieldView addSubview:self.searchTextField];
    [self.view addSubview:self.bgCollectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.results.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SearchDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SearchDetailCell"
                                                                       forIndexPath:indexPath];
    BrandBrands *brand = self.results[indexPath.item];
    cell.brand = brand;
    return cell;
}

#pragma mark - lazy

- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] init];
        _topView.frame = CGRectMake(0, 0, ScreenW, 107);
        _topView.backgroundColor = [UIColor colorWithWhite:0.937 alpha:1.000];
    }
    return _topView;
}

- (UIView *)textFieldView {
    if (!_textFieldView) {
        _textFieldView = [[UIView alloc] init];
        _textFieldView.frame = CGRectMake(0, 20, ScreenW - 50, 44);
        _textFieldView.backgroundColor = [UIColor colorWithRed:0.898 green:0.898 blue:0.882 alpha:1.000];
        UIImageView *imgV = [[UIImageView alloc] init];
        imgV.frame = _textFieldView.bounds;
        [_textFieldView addSubview:imgV];
        imgV.image = [UIImage imageNamed:@"搜索跳转"];
        
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat x = CGRectGetMaxX(imgV.frame);
        cancelBtn.frame = CGRectMake(x, 22, 50, 44);
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn setTitleColor:PINKCOLOR forState:UIControlStateNormal];
        [cancelBtn addTarget:self
                      action:@selector(cancelBtnClick)
            forControlEvents:UIControlEventTouchUpInside];
        [_topView addSubview:cancelBtn];
        
        UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"搜品牌", @"搜宝贝"]];
        seg.frame = CGRectMake(8, CGRectGetMaxY(_textFieldView.frame) + 8, ScreenW - 16, 28);
        seg.tintColor = PINKCOLOR;
        seg.backgroundColor = [UIColor whiteColor];
        seg.selectedSegmentIndex = 0;
        seg.layer.cornerRadius = 4;
        seg.clipsToBounds = YES;
        [_topView addSubview:seg];
        PX_RELEASE(imgV);
        PX_RELEASE(seg);
    }
    return _textFieldView;
}

- (UITextField *)searchTextField {
    if (!_searchTextField) {
        _searchTextField = [[UITextField alloc] init];
        CGFloat width = CGRectGetWidth(self.textFieldView.frame);
        CGFloat height = CGRectGetHeight(self.textFieldView.frame);
        _searchTextField.frame = CGRectMake(12, 8, width - 20, height - 16);
        _searchTextField.placeholder = @"搜索你喜欢的品牌";
        UIImageView *searchImgV = [[UIImageView alloc] init];
        searchImgV.bounds = CGRectMake(0, 0, 17, 17);
        searchImgV.image = [UIImage imageNamed:@"搜索按钮"];
        _searchTextField.leftViewMode = UITextFieldViewModeAlways;
        _searchTextField.leftView = searchImgV;
        _searchTextField.returnKeyType = UIReturnKeySearch;
        [_searchTextField addTarget:self
                             action:@selector(searchFinish:)
                   forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    return _searchTextField;
}

//搜索:http://api.yuike.com/beautymall/api/1.0/search/search.php?count=40&cursor=0&keyword=1&sid=e36b653d043499c528ff200eefc0e6af&type=brand&yk_appid=1&yk_cbv=2.9.2&yk_pid=1&yk_user_id=2079512
- (void)searchFinish:(UITextField *)textField {
    AFNetworkRequest *request = [[AFNetworkRequest alloc] init];
    request.datasource = self;
    NSString *urlStr = [NSString stringWithFormat:@"search/search.php?count=40&cursor=0&keyword=%@&sid=e36b653d043499c528ff200eefc0e6af&type=brand&yk_appid=1&yk_cbv=2.9.2&yk_pid=1&yk_user_id=2079512", textField.text];
    [request requestWithURLString:urlStr parameters:nil type:NetworkRequestTypeGet resultBlock:^(id responseObject, NSError *error) {
        BrandBaseClass *base = [BrandBaseClass modelObjectWithDictionary:responseObject];
        BrandData *data = base.data[0];
        [self.results addObjectsFromArray:data.brands];
        [self.bgCollectionView reloadData];
    }];
}

- (NSString *)NetworkRequestBaseURLString {
    return @"http://api.yuike.com/beautymall/api/1.0/";
}

- (void)cancelBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UICollectionView *)bgCollectionView {
    if (!_bgCollectionView) {
        CGRect rect = CGRectMake(0, 107, ScreenW, ScreenH - 107);
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(355, 300);
        _bgCollectionView = [[UICollectionView alloc] initWithFrame:rect
                                               collectionViewLayout:layout];
        _bgCollectionView.backgroundColor = [UIColor colorWithWhite:0.922 alpha:1.000];
        [_bgCollectionView registerNibClass:[SearchDetailCell class]];
        _bgCollectionView.delegate = self;
        _bgCollectionView.dataSource = self;
    }
    return _bgCollectionView;
}

- (NSMutableArray *)results {
    if (!_results) {
        _results = [[NSMutableArray alloc] init];
    }
    return _results;
}

@end
