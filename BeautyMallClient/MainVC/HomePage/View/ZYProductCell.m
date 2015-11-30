//
//  ZYProductCell.m
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/23.
//  Copyright © 2015年 ‚Äö√†√∂‚àö√°¬¨¬®‚Äö√†¬¥‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö¬¢‚Äö√Ñ¬¢‚âà√≠¬¨¬©‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö√ë¬¨¬¢‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†. All rights reserved.
//

#import "ZYProductCell.h"
#import "ZYProducts.h"
#import "ZYTaobaoItemImgs.h"

@interface ZYProductCell()

@end

@implementation ZYProductCell

- (void)setProduct:(ZYProducts *)product {
    _product = product;
    self.priceLB.text = [NSString stringWithFormat:@"%@%@", product.moneySymbol, product.taobaoSellingPrice];
    [self.likeBtn setTitle:product.likesCount forState:UIControlStateNormal];
    ZYTaobaoItemImgs *itemImg = product.taobaoItemImgs[0];
    
    [self.imgV sd_setImageWithURL:[NSURL URLWithString:itemImg.url] placeholderImage:nil];
}

- (void)awakeFromNib {
    // Initialization code
}

@end
