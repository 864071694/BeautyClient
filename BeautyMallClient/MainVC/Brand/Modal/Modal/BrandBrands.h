//
//  BrandBrands.h
//
//  Created by ZhangZeNan  on 15/11/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BrandBrands : NSObject

@property (nonatomic, strong) NSString *brandType;
@property (nonatomic, strong) NSString *likesCount;
@property (nonatomic, strong) NSString *style;
@property (nonatomic, assign) double brandsIdentifier;
@property (nonatomic, strong) NSArray *products;
@property (nonatomic, strong) NSString *title;
/**
 *  单元格的三张图片
 */
@property (nonatomic, strong) NSArray *taobaoPicUrls;
/**
 *  Logo图标
 */
@property (nonatomic, strong) NSString *logoUrl;
@property (nonatomic, strong) NSString *bindUserId;
@property (nonatomic, strong) NSString *brandsDescription;
@property (nonatomic, strong) NSString *taobaoSellerNick;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
