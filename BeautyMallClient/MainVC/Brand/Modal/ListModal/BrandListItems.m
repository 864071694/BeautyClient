//
//  BrandListItems.m
//
//  Created by ZhangZeNan  on 15/11/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BrandListItems.h"

NSString * const kBrandListItemsBrandType = @"brand_type";
NSString * const kBrandListItemsStyle = @"style";
NSString * const kBrandListItemsLikesCount = @"likes_count";
NSString * const kBrandListItemsId = @"id";
NSString * const kBrandListItemsBindUserId = @"bind_user_id";
NSString * const kBrandListItemsTitle = @"title";
NSString * const kBrandListItemsTaobaoPicUrls = @"taobao_pic_urls";
NSString * const kBrandListItemsLogoUrl = @"logo_url";
NSString * const kBrandListItemsDescription = @"description";
NSString * const kBrandListItemsTaobaoSellerNick = @"taobao_seller_nick";

@interface BrandListItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BrandListItems

@synthesize brandType = _brandType;
@synthesize style = _style;
@synthesize likesCount = _likesCount;
@synthesize itemsIdentifier = _itemsIdentifier;
@synthesize bindUserId = _bindUserId;
@synthesize title = _title;
@synthesize taobaoPicUrls = _taobaoPicUrls;
@synthesize logoUrl = _logoUrl;
@synthesize itemsDescription = _itemsDescription;
@synthesize taobaoSellerNick = _taobaoSellerNick;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return PX_AUTORELEASE([[self alloc] initWithDictionary:dict]);
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
        self.brandType = [self objectOrNilForKey:kBrandListItemsBrandType fromDictionary:dict];
        self.style = [self objectOrNilForKey:kBrandListItemsStyle fromDictionary:dict];
        self.likesCount = [self objectOrNilForKey:kBrandListItemsLikesCount fromDictionary:dict];
        self.itemsIdentifier = [[self objectOrNilForKey:kBrandListItemsId fromDictionary:dict] doubleValue];
        self.bindUserId = [self objectOrNilForKey:kBrandListItemsBindUserId fromDictionary:dict];
        self.title = [self objectOrNilForKey:kBrandListItemsTitle fromDictionary:dict];
        self.taobaoPicUrls = [self objectOrNilForKey:kBrandListItemsTaobaoPicUrls fromDictionary:dict];
        self.logoUrl = [self objectOrNilForKey:kBrandListItemsLogoUrl fromDictionary:dict];
        self.itemsDescription = [self objectOrNilForKey:kBrandListItemsDescription fromDictionary:dict];
        self.taobaoSellerNick = [self objectOrNilForKey:kBrandListItemsTaobaoSellerNick fromDictionary:dict];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.brandType forKey:kBrandListItemsBrandType];
    [mutableDict setValue:self.style forKey:kBrandListItemsStyle];
    [mutableDict setValue:self.likesCount forKey:kBrandListItemsLikesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemsIdentifier] forKey:kBrandListItemsId];
    [mutableDict setValue:self.bindUserId forKey:kBrandListItemsBindUserId];
    [mutableDict setValue:self.title forKey:kBrandListItemsTitle];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTaobaoPicUrls] forKey:kBrandListItemsTaobaoPicUrls];
    [mutableDict setValue:self.logoUrl forKey:kBrandListItemsLogoUrl];
    [mutableDict setValue:self.itemsDescription forKey:kBrandListItemsDescription];
    [mutableDict setValue:self.taobaoSellerNick forKey:kBrandListItemsTaobaoSellerNick];
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
