//
//  ZYTaobaoItemImgs.h
//
//  Created by ZhangZeNan  on 15/11/23
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYTaobaoItemImgs : NSObject

@property (nonatomic, assign) double taobaoItemImgsIdentifier;
@property (nonatomic, assign) double position;
@property (nonatomic, strong) NSString *url;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
