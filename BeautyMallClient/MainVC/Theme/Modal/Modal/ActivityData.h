//
//  ActivityData.h
//
//  Created by ZhangZeNan  on 15/11/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityData : NSObject

@property (nonatomic, strong) NSString *previousCursor;
@property (nonatomic, strong) NSString *nextCursor;
@property (nonatomic, strong) NSArray *activities;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
