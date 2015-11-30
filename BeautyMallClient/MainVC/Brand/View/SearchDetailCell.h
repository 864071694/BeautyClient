//
//  SearchDetailCell.h
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/29.
//  Copyright © 2015年 ‚Äö√†√∂‚àö√°¬¨¬®‚Äö√†¬¥‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö¬¢‚Äö√Ñ¬¢‚âà√≠¬¨¬©‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö√ë¬¨¬¢‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BrandBrands;

@interface SearchDetailCell : UICollectionViewCell

@property (nonatomic, PX_STRONG) BrandBrands *brand;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgVs;
@property (retain, nonatomic) IBOutlet UIImageView *logoImgV;
@property (retain, nonatomic) IBOutlet UILabel *starLB;
@property (retain, nonatomic) IBOutlet UIButton *starBtn;
@property (retain, nonatomic) IBOutlet UILabel *nameLB;
@property (retain, nonatomic) IBOutlet UILabel *contentLB;
@property (retain, nonatomic) IBOutlet UILabel *styleLB;

@end
