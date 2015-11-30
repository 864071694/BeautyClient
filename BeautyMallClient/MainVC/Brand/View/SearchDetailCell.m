//
//  SearchDetailCell.m
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/29.
//  Copyright © 2015年 ‚Äö√†√∂‚àö√°¬¨¬®‚Äö√†¬¥‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö¬¢‚Äö√Ñ¬¢‚âà√≠¬¨¬©‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö√ë¬¨¬¢‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†. All rights reserved.
//

#import "SearchDetailCell.h"
#import "BrandBrands.h"

@implementation SearchDetailCell

- (void)setBrand:(BrandBrands *)brand {
    _brand = brand;
    [self.imgVs[2] setHidden:YES];
    [self.logoImgV sd_setImageWithURL:[NSURL URLWithString:brand.logoUrl] placeholderImage:nil];
    self.starLB.text = [NSString stringWithFormat:@"%@人收藏", brand.likesCount];
    self.nameLB.text = brand.title;
    self.contentLB.text = brand.brandsDescription;
    self.styleLB.text = [NSString stringWithFormat:@"风格:%@", brand.style];
    [brand.taobaoPicUrls enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
        if (idx == self.imgVs.count - 1) {
            [self.imgVs[2] setHidden:NO];
            *stop = YES;
        }
        if (brand.taobaoPicUrls.count - 1 == idx) {
            *stop = YES;
        }
        UIImageView *imgV = self.imgVs[idx];
        imgV.image = nil;
        [imgV sd_setImageWithURL:[NSURL URLWithString:obj] placeholderImage:nil];
    }];
}

- (void)awakeFromNib {
    // Initialization code
}

@end
