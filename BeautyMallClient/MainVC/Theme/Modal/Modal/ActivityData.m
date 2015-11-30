//
//  ActivityData.m
//
//  Created by ZhangZeNan  on 15/11/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ActivityData.h"
#import "ActivityActivities.h"

NSString * const kActivityDataPreviousCursor = @"previous_cursor";
NSString * const kActivityDataNextCursor = @"next_cursor";
NSString * const kActivityDataActivities = @"activities";

@interface ActivityData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ActivityData

@synthesize previousCursor = _previousCursor;
@synthesize nextCursor = _nextCursor;
@synthesize activities = _activities;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return PX_AUTORELEASE([[self alloc] initWithDictionary:dict]);
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
        self.previousCursor = [self objectOrNilForKey:kActivityDataPreviousCursor fromDictionary:dict];
        self.nextCursor = [self objectOrNilForKey:kActivityDataNextCursor fromDictionary:dict];
        NSObject *receivedActivityActivities = [dict objectForKey:kActivityDataActivities];
        NSMutableArray *parsedActivityActivities = [NSMutableArray array];
        if ([receivedActivityActivities isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedActivityActivities) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    [parsedActivityActivities addObject:[ActivityActivities modelObjectWithDictionary:item]];
                }
            }
        } else if ([receivedActivityActivities isKindOfClass:[NSDictionary class]]) {
            [parsedActivityActivities addObject:[ActivityActivities modelObjectWithDictionary:(NSDictionary *)receivedActivityActivities]];
        }
        self.activities = [NSArray arrayWithArray:parsedActivityActivities];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.previousCursor forKey:kActivityDataPreviousCursor];
    [mutableDict setValue:self.nextCursor forKey:kActivityDataNextCursor];
    NSMutableArray *tempArrayForActivities = [NSMutableArray array];
    for (NSObject *subArrayObject in self.activities) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForActivities addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForActivities addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForActivities] forKey:kActivityDataActivities];
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
