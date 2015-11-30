//
//  CustomLayout.m
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/22.
//  Copyright © 2015年 √Ç¬∫‚Ä†√ä‚â•Œ©√ä‚Ä¢‚Ä†. All rights reserved.
//

#import "CustomLayout.h"

@interface CustomLayout(){
    CGFloat colHeight[2];
    CGFloat height0;
    CGFloat height1;
    CGFloat height2;
    CGFloat height4;
}

@property (nonatomic, retain) NSMutableArray *attributes;

@end

@implementation CustomLayout

- (NSMutableArray *)attributes {
    if (!_attributes) {
        _attributes = [[NSMutableArray alloc] init];
    }
    return _attributes;
}

- (void)prepareLayout {
    [super prepareLayout];
    colHeight[0] = 0;
    colHeight[1] = 0;
    height0 = 0;
    height1 = 0;
    height2 = 0;
    height4 = 0;
    NSInteger sectionNum = self.collectionView.numberOfSections;
    CGFloat width = CGRectGetWidth(self.collectionView.bounds);
    CGFloat jianGe = self.minimumLineSpacing;
    [self.attributes removeAllObjects];
    for (NSInteger i = 0; i < sectionNum; i ++) {
        NSInteger itemNum = [self.collectionView numberOfItemsInSection:i];
        for (int j = 0; j < itemNum; j ++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:j
                                                        inSection:i];
            UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            [self.attributes addObject:attribute];
            switch (i) {
                case 0: {
                    attribute.frame = CGRectMake(0, 0, width, 215);
                    height0 = CGRectGetMaxY(attribute.frame);
                }
                    break;
                case 1:{
                    attribute.frame = CGRectMake(0, height0, width, 50);
                    height1 = CGRectGetMaxY(attribute.frame);
                }
                    break;
                case 2: {
                    if (j == 0) {
                        attribute.frame = CGRectMake(0, height1, width, 40);
                    } else {
                        CGFloat itemW = (width - 5 * jianGe) / 4.0;
                        CGFloat itemH = 45;
                        CGFloat x = jianGe + (jianGe + itemW) * ((j-1) % 4);
                        CGFloat y = jianGe + (jianGe + itemH) * ((j-1) / 4);
                        attribute.frame = CGRectMake(x, y + height1 + 40 - jianGe, itemW, itemH);
                    }
                    height2 = CGRectGetMaxY(attribute.frame);
                }
                    break;
                case 3:{
                    CGFloat itemW = (width - 3 * jianGe) / 2.0;
                    if (j == 0) {
                        CGFloat x = jianGe;
                        CGFloat y = height2 + jianGe;
                        CGFloat itemH = 80;
                        attribute.frame = CGRectMake(x, y, itemW, itemH);
                        colHeight[0] += itemH + jianGe;
                    } else {
                        int index = colHeight[0] <= colHeight[1] ? 0 : 1;
                        CGFloat x = jianGe + (itemW + jianGe) * index;
                        CGFloat y = colHeight[index] + jianGe;
                        attribute.frame = CGRectMake(x, y + height2, itemW, 200);
                        colHeight[index] += 200 + jianGe;
                    }
                }
                    break;
            }
        }
    }
}

- (CGSize)collectionViewContentSize {
    CGFloat w = CGRectGetWidth(self.collectionView.bounds);
    CGFloat h = CGRectGetHeight(self.collectionView.bounds);
    CGFloat section2Height = colHeight[0] > colHeight[1] ? colHeight[0] : colHeight[1];
    CGFloat realH = h > section2Height ? h : section2Height;
    return CGSizeMake(w, realH + height2);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *layoutAttributes = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes *attributes in self.attributes) {
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            [layoutAttributes addObject:attributes];
        }
    }
    return self.attributes;
}

@end
