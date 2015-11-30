//
//  ZYBaseClass.m
//
//  Created by ZhangZeNan  on 15/11/23
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZYBaseClass.h"
#import "ZYData.h"

NSString * const kZYBaseClassRet = @"ret";
NSString * const kZYBaseClassMsg = @"msg";
NSString * const kZYBaseClassData = @"data";

@interface ZYBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYBaseClass

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
            self.ret = [[self objectOrNilForKey:kZYBaseClassRet fromDictionary:dict] doubleValue];
            self.msg = [self objectOrNilForKey:kZYBaseClassMsg fromDictionary:dict];
            self.data = [ZYData modelObjectWithDictionary:[dict objectForKey:kZYBaseClassData]];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kZYBaseClassRet];
    [mutableDict setValue:self.msg forKey:kZYBaseClassMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kZYBaseClassData];
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
