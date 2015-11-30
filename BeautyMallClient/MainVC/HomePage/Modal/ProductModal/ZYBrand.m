//
//  ZYBrand.m
//
//  Created by ZhangZeNan  on 15/11/23
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZYBrand.h"

NSString * const kZYBrandId = @"id";
NSString * const kZYBrandTitle = @"title";
NSString * const kZYBrandLogoUrl = @"logo_url";
NSString * const kZYBrandTaobaoSellerNick = @"taobao_seller_nick";

@interface ZYBrand ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYBrand

@synthesize brandIdentifier = _brandIdentifier;
@synthesize title = _title;
@synthesize logoUrl = _logoUrl;
@synthesize taobaoSellerNick = _taobaoSellerNick;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return PX_AUTORELEASE([[self alloc] initWithDictionary:dict]);
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.brandIdentifier = [self objectOrNilForKey:kZYBrandId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kZYBrandTitle fromDictionary:dict];
            self.logoUrl = [self objectOrNilForKey:kZYBrandLogoUrl fromDictionary:dict];
            self.taobaoSellerNick = [self objectOrNilForKey:kZYBrandTaobaoSellerNick fromDictionary:dict];

    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.brandIdentifier forKey:kZYBrandId];
    [mutableDict setValue:self.title forKey:kZYBrandTitle];
    [mutableDict setValue:self.logoUrl forKey:kZYBrandLogoUrl];
    [mutableDict setValue:self.taobaoSellerNick forKey:kZYBrandTaobaoSellerNick];
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
