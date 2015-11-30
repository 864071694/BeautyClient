//
//  ZYData.h
//
//  Created by ZhangZeNan  on 15/11/23
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYData : NSObject

@property (nonatomic, strong) NSString *previousCursor;
@property (nonatomic, strong) NSString *nextCursor;
@property (nonatomic, strong) NSArray *products;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
