//
//  ZYBannerCell.m
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/22.
//  Copyright © 2015年 √Ç¬∫‚Ä†√ä‚â•Œ©√ä‚Ä¢‚Ä†. All rights reserved.
//

#import "ZYBannerCell.h"
#import "BannerObj.h"
#import <SDCycleScrollView.h>

@interface ZYBannerCell ()

@property (nonatomic, retain) SDCycleScrollView *scro;

@end

@implementation ZYBannerCell

- (SDCycleScrollView *)scro {
    if (!_scro) {
        CGRect rect = CGRectMake(0, 0, ScreenW, 215);
        _scro = [[SDCycleScrollView alloc] init];
        _scro.dotColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yuike_waterfallv2_dotfull.png"]];
        _scro.notDotColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yuike_waterfallv2_dotempty.png"]];
        _scro.frame = rect;
    }
    return _scro;
}

- (void)awakeFromNib {
    [self.contentView addSubview:self.scro];
}

- (void)setDataSource:(NSArray *)dataSource {
    if (dataSource == _dataSource) {
        
    } else {
        _dataSource = dataSource;
        NSMutableArray *array = [NSMutableArray array];
        for (BannerObj *obj in dataSource) {
            [array addObject:obj.pic_url];
        }
        self.scro.imageURLStringsGroup = array;
        
        
    }
}

@end
