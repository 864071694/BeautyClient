//
//  ThemeCell.m
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/28.
//  Copyright © 2015年 ‚Äö√†√∂‚àö√°¬¨¬®‚Äö√†¬¥‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö¬¢‚Äö√Ñ¬¢‚âà√≠¬¨¬©‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö√ë¬¨¬¢‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†. All rights reserved.
//

#import "ThemeCell.h"
#import "ThemeDetailCell.h"
#import "UICollectionView+Regist.h"
#define TopBarH 56

@interface ThemeCell()
<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation ThemeCell

- (UICollectionView *)myCo {
    if (!_myCo) {
        CGRect rect = CGRectMake(0, 0, ScreenW, ScreenH - TopBarH - CUSTOM_Tab_H);
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(ScreenW - 20, 320);
        _myCo = [[UICollectionView alloc] initWithFrame:rect
                                   collectionViewLayout:layout];
        PX_RELEASE(layout);
        _myCo.backgroundColor = GRAYCOLOR;
        [_myCo registerNibClass:[ThemeDetailCell class]];
        _myCo.delegate = self;
        _myCo.dataSource = self;
    }
    return _myCo;
}

- (void)setThemes:(NSMutableArray *)themes {
    _themes = themes;
    [self.myCo reloadData];
}

- (void)awakeFromNib {
    [self.contentView addSubview:self.myCo];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.themes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ThemeDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThemeDetailCell"
                                                                      forIndexPath:indexPath];
    if (self.themes.count != 0) {
        cell.activity = self.themes[indexPath.item];
    }
    return cell;
}

@end
