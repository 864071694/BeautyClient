//
//  ThemeDetailCell.h
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/28.
//  Copyright © 2015年 ‚Äö√†√∂‚àö√°¬¨¬®‚Äö√†¬¥‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö¬¢‚Äö√Ñ¬¢‚âà√≠¬¨¬©‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö√ë¬¨¬¢‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ActivityActivities;

@interface ThemeDetailCell : UICollectionViewCell

@property (nonatomic, PX_STRONG) ActivityActivities *activity;

@property (retain, nonatomic) IBOutlet UILabel *timeLB;
@property (retain, nonatomic) IBOutlet UIImageView *imgV;
@property (retain, nonatomic) IBOutlet UILabel *titleLB;
@property (retain, nonatomic) IBOutlet UILabel *leftTimeLB;
@property (retain, nonatomic) IBOutlet UIButton *seeBtn;
@property (retain, nonatomic) IBOutlet UIButton *likeBtn;

@end
