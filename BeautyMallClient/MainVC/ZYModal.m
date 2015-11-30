//
//  ZYModal.m
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/22.
//  Copyright © 2015年 √Ç¬∫‚Ä†√ä‚â•Œ©√ä‚Ä¢‚Ä†. All rights reserved.
//

#import "ZYModal.h"

@implementation ZYModal

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

+ (instancetype)modalWithDictionary:(NSDictionary *)dictionary {
    return PX_AUTORELEASE([[self alloc] initWithDictionary:dictionary]);
}

@end
