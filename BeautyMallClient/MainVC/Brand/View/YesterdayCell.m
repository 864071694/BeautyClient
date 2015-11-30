//
//  YesterdayCell.m
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/28.
//  Copyright © 2015年 ‚Äö√†√∂‚àö√°¬¨¬®‚Äö√†¬¥‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö¬¢‚Äö√Ñ¬¢‚âà√≠¬¨¬©‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö√ë¬¨¬¢‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†. All rights reserved.
//

#import "YesterdayCell.h"
#import "BrandListItems.h"

@implementation YesterdayCell

- (void)setItem:(BrandListItems *)item {
    _item = item;
    NSLog(@"%@", item.logoUrl);
    [self.imgBtn sd_setImageWithURL:[NSURL URLWithString:item.logoUrl]
                           forState:UIControlStateNormal];
}

- (void)awakeFromNib {
    // Initialization code
}

@end