//
//  RecommendCell.m
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/28.
//  Copyright © 2015年 ‚Äö√†√∂‚àö√°¬¨¬®‚Äö√†¬¥‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö¬¢‚Äö√Ñ¬¢‚âà√≠¬¨¬©‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö√ë¬¨¬¢‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†. All rights reserved.en
//

#import "RecommendCell.h"
#import "BrandData.h"
#import "BrandBrands.h"
#import "BrandProducts.h"

@implementation RecommendCell

- (void)setBrand:(BrandBrands *)brand {
    _brand = brand;
    [brand.taobaoPicUrls enumerateObjectsUsingBlock:^(id obj1, NSUInteger idx1, BOOL *stop1) {
        UIImageView *imgV = self.imgVs[idx1];
        [imgV sd_setImageWithURL:[NSURL URLWithString:obj1] placeholderImage:nil];
    }];
    [self.logoImgV sd_setImageWithURL:[NSURL URLWithString:brand.logoUrl] placeholderImage:nil];
    self.contentLB.text = brand.brandsDescription;
    self.starLB.text = [NSString stringWithFormat:@"%@人收藏", brand.likesCount];
    self.styleLB.text = [NSString stringWithFormat:@"风格:%@", brand.style];
}

- (void)awakeFromNib {
    // Initialization code
}

@end
