//
//  ActivityBaseClass.h
//
//  Created by ZhangZeNan  on 15/11/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ActivityData;

@interface ActivityBaseClass : NSObject

@property (nonatomic, assign) double ret;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) ActivityData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
