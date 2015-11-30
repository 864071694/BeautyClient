//
//  RankingObj.h
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/23.
//  Copyright © 2015年 √Ç¬∫‚Ä†√ä‚â•Œ©√ä‚Ä¢‚Ä†. All rights reserved.
//

#import "ZYModal.h"

@interface RankingObj : ZYModal

@property (nonatomic, copy) NSString *background_pic_url, *taobao_title, *en_taobao_title;
@property (nonatomic, PX_STRONG) NSNumber *method, *taobao_cid;

@end
