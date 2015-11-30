//
//  ZYProductCell.h
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/23.
//  Copyright © 2015年 ‚Äö√†√∂‚àö√°¬¨¬®‚Äö√†¬¥‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö¬¢‚Äö√Ñ¬¢‚âà√≠¬¨¬©‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö√ë¬¨¬¢‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYProducts;

@interface ZYProductCell : UICollectionViewCell

@property (nonatomic, PX_STRONG) ZYProducts *product;
@property (retain, nonatomic) IBOutlet UIImageView *imgV;
@property (retain, nonatomic) IBOutlet UILabel *priceLB;
@property (retain, nonatomic) IBOutlet UIButton *likeBtn;

@end
