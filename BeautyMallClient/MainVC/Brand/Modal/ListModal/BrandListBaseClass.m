//
//  BrandListBaseClass.m
//
//  Created by ZhangZeNan  on 15/11/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BrandListBaseClass.h"
#import "BrandListData.h"

NSString * const kBrandListBaseClassRet = @"ret";
NSString * const kBrandListBaseClassMsg = @"msg";
NSString * const kBrandListBaseClassData = @"data";

@interface BrandListBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BrandListBaseClass

@synthesize ret = _ret;
@synthesize msg = _msg;
@synthesize data = _data;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return PX_AUTORELEASE([[self alloc] initWithDictionary:dict]);
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.ret = [[self objectOrNilForKey:kBrandListBaseClassRet fromDictionary:dict] doubleValue];
            self.msg = [self objectOrNilForKey:kBrandListBaseClassMsg fromDictionary:dict];
    NSObject *receivedBrandListData = [dict objectForKey:kBrandListBaseClassData];
    NSMutableArray *parsedBrandListData = [NSMutableArray array];
    if ([receivedBrandListData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBrandListData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBrandListData addObject:[BrandListData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBrandListData isKindOfClass:[NSDictionary class]]) {
       [parsedBrandListData addObject:[BrandListData modelObjectWithDictionary:(NSDictionary *)receivedBrandListData]];
    }

    self.data = [NSArray arrayWithArray:parsedBrandListData];

    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kBrandListBaseClassRet];
    [mutableDict setValue:self.msg forKey:kBrandListBaseClassMsg];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.data) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kBrandListBaseClassData];
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
