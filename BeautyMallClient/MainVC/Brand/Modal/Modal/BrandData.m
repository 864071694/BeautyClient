//
//  BrandData.m
//
//  Created by ZhangZeNan  on 15/11/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BrandData.h"
#import "BrandBrands.h"

NSString * const kBrandDataBrands = @"brands";
NSString * const kBrandDataCreatedTime = @"created_time";

@interface BrandData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BrandData

@synthesize brands = _brands;
@synthesize createdTime = _createdTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return PX_AUTORELEASE([[self alloc] initWithDictionary:dict]);
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
        NSObject *receivedBrandBrands = [dict objectForKey:kBrandDataBrands];
        NSMutableArray *parsedBrandBrands = [NSMutableArray array];
        if ([receivedBrandBrands isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedBrandBrands) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    [parsedBrandBrands addObject:[BrandBrands modelObjectWithDictionary:item]];
                }
            }
        } else if ([receivedBrandBrands isKindOfClass:[NSDictionary class]]) {
            [parsedBrandBrands addObject:[BrandBrands modelObjectWithDictionary:(NSDictionary *)receivedBrandBrands]];
        }
        self.brands = [NSArray arrayWithArray:parsedBrandBrands];
        self.createdTime = [[self objectOrNilForKey:kBrandDataCreatedTime fromDictionary:dict] doubleValue];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForBrands = [NSMutableArray array];
    for (NSObject *subArrayObject in self.brands) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBrands addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBrands addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBrands] forKey:kBrandDataBrands];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdTime] forKey:kBrandDataCreatedTime];
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
