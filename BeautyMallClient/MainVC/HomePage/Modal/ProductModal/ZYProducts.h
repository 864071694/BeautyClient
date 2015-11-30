//
//  ZYProducts.h
//
//  Created by ZhangZeNan  on 15/11/23
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZYBrand;

@interface ZYProducts : NSObject

@property (nonatomic, strong) NSString *taobaoTitle;
@property (nonatomic, strong) NSString *taobaoDelistTime;
@property (nonatomic, strong) NSString *taobaoSellingPrice;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, strong) NSString *fromTitle;
@property (nonatomic, strong) NSString *fromLogoUrl;
@property (nonatomic, strong) NSString *freightPayer;
@property (nonatomic, strong) NSString *moneySymbol;
@property (nonatomic, strong) ZYBrand *brand;
@property (nonatomic, strong) NSString *discount;
@property (nonatomic, strong) NSArray *taobaoItemImgs;
@property (nonatomic, strong) NSString *commentsCount;
@property (nonatomic, strong) NSString *fromType;
@property (nonatomic, strong) NSString *sharesCount;
@property (nonatomic, strong) NSString *taobaoPrice;
@property (nonatomic, strong) NSString *mobileCpsUrl;
@property (nonatomic, strong) NSString *taobaoVolume;
@property (nonatomic, strong) NSString *limitDiscountId;
@property (nonatomic, strong) NSString *pcCpsUrl;
@property (nonatomic, strong) NSString *visitsCount;
@property (nonatomic, strong) NSString *likesCount;
@property (nonatomic, strong) NSString *taobaoUrl;
@property (nonatomic, strong) NSString *taobaoNumIid;
@property (nonatomic, assign) BOOL isDelist;
@property (nonatomic, strong) NSString *taobaoPromoPrice;
@property (nonatomic, strong) NSString *taobaoPicUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
