//
//  BrandBaseClass.m
//
//  Created by ZhangZeNan  on 15/11/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BrandBaseClass.h"
#import "BrandData.h"

NSString * const kBrandBaseClassRet = @"ret";
NSString * const kBrandBaseClassMsg = @"msg";
NSString * const kBrandBaseClassData = @"data";

@interface BrandBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BrandBaseClass

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
        self.ret = [[self objectOrNilForKey:kBrandBaseClassRet fromDictionary:dict] doubleValue];
        self.msg = [self objectOrNilForKey:kBrandBaseClassMsg fromDictionary:dict];
        NSObject *receivedBrandData = [dict objectForKey:kBrandBaseClassData];
        NSMutableArray *parsedBrandData = [NSMutableArray array];
        if ([receivedBrandData isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedBrandData) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    [parsedBrandData addObject:[BrandData modelObjectWithDictionary:item]];
                }
            }
        } else if ([receivedBrandData isKindOfClass:[NSDictionary class]]) {
            [parsedBrandData addObject:[BrandData modelObjectWithDictionary:(NSDictionary *)receivedBrandData]];
        }
        self.data = [NSArray arrayWithArray:parsedBrandData];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kBrandBaseClassRet];
    [mutableDict setValue:self.msg forKey:kBrandBaseClassMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kBrandBaseClassData];
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
