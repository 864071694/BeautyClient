//
//  BrandListData.h
//
//  Created by ZhangZeNan  on 15/11/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BrandListData : NSObject

@property (nonatomic, strong) NSString *groupName;
@property (nonatomic, copy) NSString *groupPicUrl;
@property (nonatomic, assign) BOOL groupIsExpand;
@property (nonatomic, strong) NSArray *items;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
