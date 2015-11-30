//
//  ActivityBaseClass.m
//
//  Created by ZhangZeNan  on 15/11/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ActivityBaseClass.h"
#import "ActivityData.h"

NSString * const kActivityBaseClassRet = @"ret";
NSString * const kActivityBaseClassMsg = @"msg";
NSString * const kActivityBaseClassData = @"data";

@interface ActivityBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ActivityBaseClass

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
        self.ret = [[self objectOrNilForKey:kActivityBaseClassRet fromDictionary:dict] doubleValue];
        self.msg = [self objectOrNilForKey:kActivityBaseClassMsg fromDictionary:dict];
        self.data = [ActivityData modelObjectWithDictionary:[dict objectForKey:kActivityBaseClassData]];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kActivityBaseClassRet];
    [mutableDict setValue:self.msg forKey:kActivityBaseClassMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kActivityBaseClassData];
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
