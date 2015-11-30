//
//  ZYBaseClass.h
//
//  Created by ZhangZeNan  on 15/11/23
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZYData;

@interface ZYBaseClass : NSObject

@property (nonatomic, assign) double ret;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) ZYData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
