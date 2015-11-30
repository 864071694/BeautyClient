//
//  ZYData.m
//
//  Created by ZhangZeNan  on 15/11/23
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZYData.h"
#import "ZYProducts.h"

NSString * const kZYDataPreviousCursor = @"previous_cursor";
NSString * const kZYDataNextCursor = @"next_cursor";
NSString * const kZYDataProducts = @"products";

@interface ZYData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYData

@synthesize previousCursor = _previousCursor;
@synthesize nextCursor = _nextCursor;
@synthesize products = _products;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return PX_AUTORELEASE([[self alloc] initWithDictionary:dict]);
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.previousCursor = [self objectOrNilForKey:kZYDataPreviousCursor fromDictionary:dict];
            self.nextCursor = [self objectOrNilForKey:kZYDataNextCursor fromDictionary:dict];
    NSObject *receivedZYProducts = [dict objectForKey:kZYDataProducts];
    NSMutableArray *parsedZYProducts = [NSMutableArray array];
    if ([receivedZYProducts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZYProducts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZYProducts addObject:[ZYProducts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZYProducts isKindOfClass:[NSDictionary class]]) {
       [parsedZYProducts addObject:[ZYProducts modelObjectWithDictionary:(NSDictionary *)receivedZYProducts]];
    }

    self.products = [NSArray arrayWithArray:parsedZYProducts];

    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.previousCursor forKey:kZYDataPreviousCursor];
    [mutableDict setValue:self.nextCursor forKey:kZYDataNextCursor];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProducts] forKey:kZYDataProducts];
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
