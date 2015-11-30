//
//  ZYRankCell.m
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/23.
//  Copyright © 2015年 √Ç¬∫‚Ä†√ä‚â•Œ©√ä‚Ä¢‚Ä†. All rights reserved.
//

#import "ZYRankCell.h"
#import "RankingObj.h"

@implementation ZYRankCell

- (void)setRank:(RankingObj *)rank {
    _rank = rank;
    NSString *title = [NSString stringWithFormat:@"%@\n%@", rank.taobao_title, rank.en_taobao_title];
    [self.btn setTitle:title forState:UIControlStateNormal];
    [self.btn sd_setBackgroundImageWithURL:[NSURL URLWithString:rank.background_pic_url] forState:UIControlStateNormal placeholderImage:nil];
}

- (void)awakeFromNib {
    self.btn.titleLabel.numberOfLines = 0;
    self.btn.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
