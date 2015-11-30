//
//  ZYTaobaoItemImgs.m
//
//  Created by ZhangZeNan  on 15/11/23
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZYTaobaoItemImgs.h"

NSString * const kZYTaobaoItemImgsId = @"id";
NSString * const kZYTaobaoItemImgsPosition = @"position";
NSString * const kZYTaobaoItemImgsUrl = @"url";

@interface ZYTaobaoItemImgs ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYTaobaoItemImgs

@synthesize taobaoItemImgsIdentifier = _taobaoItemImgsIdentifier;
@synthesize position = _position;
@synthesize url = _url;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return PX_AUTORELEASE([[self alloc] initWithDictionary:dict]);
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.taobaoItemImgsIdentifier = [[self objectOrNilForKey:kZYTaobaoItemImgsId fromDictionary:dict] doubleValue];
            self.position = [[self objectOrNilForKey:kZYTaobaoItemImgsPosition fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:kZYTaobaoItemImgsUrl fromDictionary:dict];

    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.taobaoItemImgsIdentifier] forKey:kZYTaobaoItemImgsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.position] forKey:kZYTaobaoItemImgsPosition];
    [mutableDict setValue:self.url forKey:kZYTaobaoItemImgsUrl];
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
