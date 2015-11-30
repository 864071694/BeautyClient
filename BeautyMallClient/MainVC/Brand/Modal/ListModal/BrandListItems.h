//
//  BrandListItems.h
//
//  Created by ZhangZeNan  on 15/11/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BrandListItems : NSObject

@property (nonatomic, strong) NSString *brandType;
@property (nonatomic, strong) NSString *style;
@property (nonatomic, strong) NSString *likesCount;
@property (nonatomic, assign) double itemsIdentifier;
@property (nonatomic, strong) NSString *bindUserId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *taobaoPicUrls;
@property (nonatomic, strong) NSString *logoUrl;
@property (nonatomic, strong) NSString *itemsDescription;
@property (nonatomic, strong) NSString *taobaoSellerNick;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
