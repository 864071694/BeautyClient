//
//  ZYProducts.m
//
//  Created by ZhangZeNan  on 15/11/23
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZYProducts.h"
#import "ZYBrand.h"
#import "ZYTaobaoItemImgs.h"

NSString * const kZYProductsTaobaoTitle = @"taobao_title";
NSString * const kZYProductsTaobaoDelistTime = @"taobao_delist_time";
NSString * const kZYProductsTaobaoSellingPrice = @"taobao_selling_price";
NSString * const kZYProductsTags = @"tags";
NSString * const kZYProductsFromTitle = @"from_title";
NSString * const kZYProductsFromLogoUrl = @"from_logo_url";
NSString * const kZYProductsFreightPayer = @"freight_payer";
NSString * const kZYProductsMoneySymbol = @"money_symbol";
NSString * const kZYProductsBrand = @"brand";
NSString * const kZYProductsDiscount = @"discount";
NSString * const kZYProductsTaobaoItemImgs = @"taobao_item_imgs";
NSString * const kZYProductsCommentsCount = @"comments_count";
NSString * const kZYProductsFromType = @"from_type";
NSString * const kZYProductsSharesCount = @"shares_count";
NSString * const kZYProductsTaobaoPrice = @"taobao_price";
NSString * const kZYProductsMobileCpsUrl = @"mobile_cps_url";
NSString * const kZYProductsTaobaoVolume = @"taobao_volume";
NSString * const kZYProductsLimitDiscountId = @"limit_discount_id";
NSString * const kZYProductsPcCpsUrl = @"pc_cps_url";
NSString * const kZYProductsVisitsCount = @"visits_count";
NSString * const kZYProductsLikesCount = @"likes_count";
NSString * const kZYProductsTaobaoUrl = @"taobao_url";
NSString * const kZYProductsTaobaoNumIid = @"taobao_num_iid";
NSString * const kZYProductsIsDelist = @"is_delist";
NSString * const kZYProductsTaobaoPromoPrice = @"taobao_promo_price";
NSString * const kZYProductsTaobaoPicUrl = @"taobao_pic_url";

@interface ZYProducts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYProducts

@synthesize taobaoTitle = _taobaoTitle;
@synthesize taobaoDelistTime = _taobaoDelistTime;
@synthesize taobaoSellingPrice = _taobaoSellingPrice;
@synthesize tags = _tags;
@synthesize fromTitle = _fromTitle;
@synthesize fromLogoUrl = _fromLogoUrl;
@synthesize freightPayer = _freightPayer;
@synthesize moneySymbol = _moneySymbol;
@synthesize brand = _brand;
@synthesize discount = _discount;
@synthesize taobaoItemImgs = _taobaoItemImgs;
@synthesize commentsCount = _commentsCount;
@synthesize fromType = _fromType;
@synthesize sharesCount = _sharesCount;
@synthesize taobaoPrice = _taobaoPrice;
@synthesize mobileCpsUrl = _mobileCpsUrl;
@synthesize taobaoVolume = _taobaoVolume;
@synthesize limitDiscountId = _limitDiscountId;
@synthesize pcCpsUrl = _pcCpsUrl;
@synthesize visitsCount = _visitsCount;
@synthesize likesCount = _likesCount;
@synthesize taobaoUrl = _taobaoUrl;
@synthesize taobaoNumIid = _taobaoNumIid;
@synthesize isDelist = _isDelist;
@synthesize taobaoPromoPrice = _taobaoPromoPrice;
@synthesize taobaoPicUrl = _taobaoPicUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return PX_AUTORELEASE([[self alloc] initWithDictionary:dict]);
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.taobaoTitle = [self objectOrNilForKey:kZYProductsTaobaoTitle fromDictionary:dict];
            self.taobaoDelistTime = [self objectOrNilForKey:kZYProductsTaobaoDelistTime fromDictionary:dict];
            self.taobaoSellingPrice = [self objectOrNilForKey:kZYProductsTaobaoSellingPrice fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kZYProductsTags fromDictionary:dict];
            self.fromTitle = [self objectOrNilForKey:kZYProductsFromTitle fromDictionary:dict];
            self.fromLogoUrl = [self objectOrNilForKey:kZYProductsFromLogoUrl fromDictionary:dict];
            self.freightPayer = [self objectOrNilForKey:kZYProductsFreightPayer fromDictionary:dict];
            self.moneySymbol = [self objectOrNilForKey:kZYProductsMoneySymbol fromDictionary:dict];
            self.brand = [ZYBrand modelObjectWithDictionary:[dict objectForKey:kZYProductsBrand]];
            self.discount = [self objectOrNilForKey:kZYProductsDiscount fromDictionary:dict];
    NSObject *receivedZYTaobaoItemImgs = [dict objectForKey:kZYProductsTaobaoItemImgs];
    NSMutableArray *parsedZYTaobaoItemImgs = [NSMutableArray array];
    if ([receivedZYTaobaoItemImgs isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZYTaobaoItemImgs) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZYTaobaoItemImgs addObject:[ZYTaobaoItemImgs modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZYTaobaoItemImgs isKindOfClass:[NSDictionary class]]) {
       [parsedZYTaobaoItemImgs addObject:[ZYTaobaoItemImgs modelObjectWithDictionary:(NSDictionary *)receivedZYTaobaoItemImgs]];
    }

    self.taobaoItemImgs = [NSArray arrayWithArray:parsedZYTaobaoItemImgs];
            self.commentsCount = [self objectOrNilForKey:kZYProductsCommentsCount fromDictionary:dict];
            self.fromType = [self objectOrNilForKey:kZYProductsFromType fromDictionary:dict];
            self.sharesCount = [self objectOrNilForKey:kZYProductsSharesCount fromDictionary:dict];
            self.taobaoPrice = [self objectOrNilForKey:kZYProductsTaobaoPrice fromDictionary:dict];
            self.mobileCpsUrl = [self objectOrNilForKey:kZYProductsMobileCpsUrl fromDictionary:dict];
            self.taobaoVolume = [self objectOrNilForKey:kZYProductsTaobaoVolume fromDictionary:dict];
            self.limitDiscountId = [self objectOrNilForKey:kZYProductsLimitDiscountId fromDictionary:dict];
            self.pcCpsUrl = [self objectOrNilForKey:kZYProductsPcCpsUrl fromDictionary:dict];
            self.visitsCount = [self objectOrNilForKey:kZYProductsVisitsCount fromDictionary:dict];
            self.likesCount = [self objectOrNilForKey:kZYProductsLikesCount fromDictionary:dict];
            self.taobaoUrl = [self objectOrNilForKey:kZYProductsTaobaoUrl fromDictionary:dict];
            self.taobaoNumIid = [self objectOrNilForKey:kZYProductsTaobaoNumIid fromDictionary:dict];
            self.isDelist = [[self objectOrNilForKey:kZYProductsIsDelist fromDictionary:dict] boolValue];
            self.taobaoPromoPrice = [self objectOrNilForKey:kZYProductsTaobaoPromoPrice fromDictionary:dict];
            self.taobaoPicUrl = [self objectOrNilForKey:kZYProductsTaobaoPicUrl fromDictionary:dict];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.taobaoTitle forKey:kZYProductsTaobaoTitle];
    [mutableDict setValue:self.taobaoDelistTime forKey:kZYProductsTaobaoDelistTime];
    [mutableDict setValue:self.taobaoSellingPrice forKey:kZYProductsTaobaoSellingPrice];
    [mutableDict setValue:self.tags forKey:kZYProductsTags];
    [mutableDict setValue:self.fromTitle forKey:kZYProductsFromTitle];
    [mutableDict setValue:self.fromLogoUrl forKey:kZYProductsFromLogoUrl];
    [mutableDict setValue:self.freightPayer forKey:kZYProductsFreightPayer];
    [mutableDict setValue:self.moneySymbol forKey:kZYProductsMoneySymbol];
    [mutableDict setValue:[self.brand dictionaryRepresentation] forKey:kZYProductsBrand];
    [mutableDict setValue:self.discount forKey:kZYProductsDiscount];
    NSMutableArray *tempArrayForTaobaoItemImgs = [NSMutableArray array];
    for (NSObject *subArrayObject in self.taobaoItemImgs) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTaobaoItemImgs addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTaobaoItemImgs addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTaobaoItemImgs] forKey:kZYProductsTaobaoItemImgs];
    [mutableDict setValue:self.commentsCount forKey:kZYProductsCommentsCount];
    [mutableDict setValue:self.fromType forKey:kZYProductsFromType];
    [mutableDict setValue:self.sharesCount forKey:kZYProductsSharesCount];
    [mutableDict setValue:self.taobaoPrice forKey:kZYProductsTaobaoPrice];
    [mutableDict setValue:self.mobileCpsUrl forKey:kZYProductsMobileCpsUrl];
    [mutableDict setValue:self.taobaoVolume forKey:kZYProductsTaobaoVolume];
    [mutableDict setValue:self.limitDiscountId forKey:kZYProductsLimitDiscountId];
    [mutableDict setValue:self.pcCpsUrl forKey:kZYProductsPcCpsUrl];
    [mutableDict setValue:self.visitsCount forKey:kZYProductsVisitsCount];
    [mutableDict setValue:self.likesCount forKey:kZYProductsLikesCount];
    [mutableDict setValue:self.taobaoUrl forKey:kZYProductsTaobaoUrl];
    [mutableDict setValue:self.taobaoNumIid forKey:kZYProductsTaobaoNumIid];
    [mutableDict setValue:[NSNumber numberWithBool:self.isDelist] forKey:kZYProductsIsDelist];
    [mutableDict setValue:self.taobaoPromoPrice forKey:kZYProductsTaobaoPromoPrice];
    [mutableDict setValue:self.taobaoPicUrl forKey:kZYProductsTaobaoPicUrl];
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}

@end
