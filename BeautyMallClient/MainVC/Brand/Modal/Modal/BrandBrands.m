//
//  BrandBrands.m
//
//  Created by ZhangZeNan  on 15/11/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BrandBrands.h"
#import "BrandProducts.h"

NSString * const kBrandBrandsBrandType = @"brand_type";
NSString * const kBrandBrandsLikesCount = @"likes_count";
NSString * const kBrandBrandsStyle = @"style";
NSString * const kBrandBrandsId = @"id";
NSString * const kBrandBrandsProducts = @"products";
NSString * const kBrandBrandsTitle = @"title";
NSString * const kBrandBrandsTaobaoPicUrls = @"taobao_pic_urls";
NSString * const kBrandBrandsLogoUrl = @"logo_url";
NSString * const kBrandBrandsBindUserId = @"bind_user_id";
NSString * const kBrandBrandsDescription = @"description";
NSString * const kBrandBrandsTaobaoSellerNick = @"taobao_seller_nick";

@interface BrandBrands ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BrandBrands

@synthesize brandType = _brandType;
@synthesize likesCount = _likesCount;
@synthesize style = _style;
@synthesize brandsIdentifier = _brandsIdentifier;
@synthesize products = _products;
@synthesize title = _title;
@synthesize taobaoPicUrls = _taobaoPicUrls;
@synthesize logoUrl = _logoUrl;
@synthesize bindUserId = _bindUserId;
@synthesize brandsDescription = _brandsDescription;
@synthesize taobaoSellerNick = _taobaoSellerNick;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return PX_AUTORELEASE([[self alloc] initWithDictionary:dict]);
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
        self.brandType = [self objectOrNilForKey:kBrandBrandsBrandType fromDictionary:dict];
        self.likesCount = [self objectOrNilForKey:kBrandBrandsLikesCount fromDictionary:dict];
        self.style = [self objectOrNilForKey:kBrandBrandsStyle fromDictionary:dict];
        self.brandsIdentifier = [[self objectOrNilForKey:kBrandBrandsId fromDictionary:dict] doubleValue];
        NSObject *receivedBrandProducts = [dict objectForKey:kBrandBrandsProducts];
        NSMutableArray *parsedBrandProducts = [NSMutableArray array];
        if ([receivedBrandProducts isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedBrandProducts) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    [parsedBrandProducts addObject:[BrandProducts modelObjectWithDictionary:item]];
                }
           }
        } else if ([receivedBrandProducts isKindOfClass:[NSDictionary class]]) {
           [parsedBrandProducts addObject:[BrandProducts modelObjectWithDictionary:(NSDictionary *)receivedBrandProducts]];
        }

        self.products = [NSArray arrayWithArray:parsedBrandProducts];
        self.title = [self objectOrNilForKey:kBrandBrandsTitle fromDictionary:dict];
        self.taobaoPicUrls = [self objectOrNilForKey:kBrandBrandsTaobaoPicUrls fromDictionary:dict];
        self.logoUrl = [self objectOrNilForKey:kBrandBrandsLogoUrl fromDictionary:dict];
        self.bindUserId = [self objectOrNilForKey:kBrandBrandsBindUserId fromDictionary:dict];
        self.brandsDescription = [self objectOrNilForKey:kBrandBrandsDescription fromDictionary:dict];
        self.taobaoSellerNick = [self objectOrNilForKey:kBrandBrandsTaobaoSellerNick fromDictionary:dict];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.brandType forKey:kBrandBrandsBrandType];
    [mutableDict setValue:self.likesCount forKey:kBrandBrandsLikesCount];
    [mutableDict setValue:self.style forKey:kBrandBrandsStyle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandsIdentifier] forKey:kBrandBrandsId];
    NSMutableArray *tempArrayForProducts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.products) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForProducts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForProducts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProducts] forKey:kBrandBrandsProducts];
    [mutableDict setValue:self.title forKey:kBrandBrandsTitle];
    NSMutableArray *tempArrayForTaobaoPicUrls = [NSMutableArray array];
    for (NSObject *subArrayObject in self.taobaoPicUrls) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTaobaoPicUrls addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTaobaoPicUrls addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTaobaoPicUrls] forKey:kBrandBrandsTaobaoPicUrls];
    [mutableDict setValue:self.logoUrl forKey:kBrandBrandsLogoUrl];
    [mutableDict setValue:self.bindUserId forKey:kBrandBrandsBindUserId];
    [mutableDict setValue:self.brandsDescription forKey:kBrandBrandsDescription];
    [mutableDict setValue:self.taobaoSellerNick forKey:kBrandBrandsTaobaoSellerNick];
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}

@end
