//
//  BrandListData.m
//
//  Created by ZhangZeNan  on 15/11/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BrandListData.h"
#import "BrandListItems.h"

NSString * const kBrandListDataGroupName = @"group_name";
NSString * const kBrandListDataGroupPicUrl = @"group_pic_url";
NSString * const kBrandListDataGroupIsExpand = @"group_is_expand";
NSString * const kBrandListDataItems = @"items";

@interface BrandListData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BrandListData

@synthesize groupName = _groupName;
@synthesize groupPicUrl = _groupPicUrl;
@synthesize groupIsExpand = _groupIsExpand;
@synthesize items = _items;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return PX_AUTORELEASE([[self alloc] initWithDictionary:dict]);
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.groupName = [self objectOrNilForKey:kBrandListDataGroupName fromDictionary:dict];
            self.groupPicUrl = [self objectOrNilForKey:kBrandListDataGroupPicUrl fromDictionary:dict];
            self.groupIsExpand = [[self objectOrNilForKey:kBrandListDataGroupIsExpand fromDictionary:dict] boolValue];
    NSObject *receivedBrandListItems = [dict objectForKey:kBrandListDataItems];
    NSMutableArray *parsedBrandListItems = [NSMutableArray array];
    if ([receivedBrandListItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBrandListItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBrandListItems addObject:[BrandListItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBrandListItems isKindOfClass:[NSDictionary class]]) {
       [parsedBrandListItems addObject:[BrandListItems modelObjectWithDictionary:(NSDictionary *)receivedBrandListItems]];
    }
    self.items = [NSArray arrayWithArray:parsedBrandListItems];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.groupName forKey:kBrandListDataGroupName];
    [mutableDict setValue:self.groupPicUrl forKey:kBrandListDataGroupPicUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.groupIsExpand] forKey:kBrandListDataGroupIsExpand];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kBrandListDataItems];
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
