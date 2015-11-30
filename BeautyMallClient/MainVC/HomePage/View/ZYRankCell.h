//
//  ZYRankCell.h
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/23.
//  Copyright © 2015年 √Ç¬∫‚Ä†√ä‚â•Œ©√ä‚Ä¢‚Ä†. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RankingObj;

@interface ZYRankCell : UICollectionViewCell

@property (PX_WEAK, nonatomic) IBOutlet UIButton *btn;
@property (nonatomic, retain) NSArray *dataSource;
@property (nonatomic, PX_STRONG) RankingObj *rank;

@end
