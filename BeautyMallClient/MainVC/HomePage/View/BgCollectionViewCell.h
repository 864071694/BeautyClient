//
//  BgCollectionViewCell.h
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/22.
//  Copyright © 2015年 √Ç¬∫‚Ä†√ä‚â•Œ©√ä‚Ä¢‚Ä†. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BgCollectionViewCell : UICollectionViewCell

@property (nonatomic, PX_STRONG) NSMutableArray *dataSource;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, PX_STRONG) NSMutableArray *banners;
@property (nonatomic, PX_STRONG) NSMutableArray *rankings;
@property (nonatomic, PX_STRONG) NSMutableArray *products;
@property (nonatomic, assign) NSInteger btns;

@end
